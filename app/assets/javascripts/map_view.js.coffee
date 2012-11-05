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

  map = new GMaps
    zoom: 5
    div: '#map'
    lng: 116.4
    lat: 39.93

  reqLocations = ->
    $.ajax
      url: '/sounds.json'
      dataType: 'json'
      success: (data) ->
        #alert data

        new_locations = []
        console.log new_locations.length
        console.log location_list.length
        console.log data.length

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

          location_lng = location.location.split(',')[0]
          location_lat = location.location.split(',')[1]


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
              + '<br><button onclick="play(\'' + location.path.url + '\')" class="btn btn-small btn-primary" id="play' + cid + '"><i class="icon-play icon-white"></i> Play</button>' \
              + '<br><strong>Track:</strong>' + location.path.url

            animation: google.maps.Animation.DROP

          cid += 1

        mc = new MarkerClusterer(map.map, map.markers)

        first_time = false

    setTimeout(reqLocations, 1000 * 10)

  reqLocations()