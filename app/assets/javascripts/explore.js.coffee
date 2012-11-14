# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/



getNewLocations = (previousList, currentList) ->
  if previousList.length == currentList.length
    []
  else
    currentList.slice previousList.length, currentList.length

$(document).ready ->

  first_time = true
  location_list = []
  mc = null

  map = new GMaps
    zoom: 9
    div: '#map-explore'
    lng: 116.4
    lat: 39.93
    scrollwheel: false

  GMaps.geolocate
    success: (position) ->
      map.setCenter position.coords.latitude, position.coords.longitude
      map.setZoom 13

      # map.addMarker
      #   lat: position.coords.latitude
      #   lng: position.coords.longitude
      #   animation: google.maps.Animation.DROP

  $('#location-search-commit').click ->

    location_content = $('#location-search-content').val()

    if location_content.length == 0
      alert 'Enter something please :-)'
      return false

    $.ajax
      url: '/nearby.json'
      dataType: 'json'
      type: 'POST'
      data: "location=#{location_content}&distance=#{5}"
      beforeSend: ->
        $('#location-search-commit').button('loading')

      success: (data) ->
        console.log data
        $('#location-search-commit').button('reset')

        current_location = new google.maps.LatLng data.current.data.geometry.location.lat, data.current.data.geometry.location.lng

        map.map.panTo current_location
        map.removeMarkers()

        for location in data.data
          location_lat = parseFloat(location.sound.location.split(',')[1])
          location_lng = parseFloat(location.sound.location.split(',')[0])

          map.addMarker
            lat: location_lat
            lng: location_lng

            animation: google.maps.Animation.DROP

        #map.fitZoom()

    return false

  reqLocations = ->
    $.ajax
      url: '/sounds.json'
      dataType: 'json'
      success: (data) ->
        #alert data

        new_locations = []
#        console.log new_locations.length
#        console.log location_list.length
#        console.log data.length

        if first_time
          new_locations = data
        else
          new_locations = getNewLocations(location_list, data)

        if new_locations.length > 0
          $('#notice-flash').html "#{new_locations.length} new sounds comming!"
          $('#notice-flash').fadeIn 'slow', ->
            $('#notice-flash').fadeOut 'slow'

        location_list = data

        cid = 0
        for location in new_locations

          location_lng = parseFloat(location.location.split(',')[0])
          location_lat = parseFloat(location.location.split(',')[1])

          map.addMarker
            lat: location_lat
            lng: location_lng
            click: (e) ->
              map.map.panTo e.getPosition()
              if map.map.getZoom() < 5
                map.setZoom 5

            infoWindow:
              content: '<strong>Coords:</strong> ' + location_lng + ', ' + location_lat \
              + '<br>Uploaded in <strong>' + location.title + '</strong>' \
              + '<br><button onclick="play(\'' + location.id + '\')" class="btn btn-mini btn-primary" id="play' + cid + '"><i class="icon-heart"></i> Play</button>' \
              + '<br><strong>Track:</strong>' + location.path.url

            animation: google.maps.Animation.DROP

          cid += 1

        if first_time
          mc = new MarkerClusterer(map.map, map.markers)
        else
          if new_locations.length > 0
            mc.repaint()

        first_time = false

    setTimeout(reqLocations, 1000 * 10)

  #reqLocations()