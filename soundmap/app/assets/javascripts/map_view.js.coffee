# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$(document).ready ->
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
        location_list = data
        cid = 0
        for location in location_list

          location_lat = location.location.split(',')[1]
          location_lng = location.location.split(',')[0]

          map.addMarker
            lat: location_lat
            lng: location_lng
            click: (e) ->
              map.map.panTo e.getPosition()
              if map.map.getZoom() < 5
                map.setZoom 5
            infoWindow:
              content: '<strong>Coords:</strong> ' + location_lat + ', ' + location_lng \
              + '<br>Uploaded in <strong>' + location.title + '</strong>' \
              + '<br><button onclick="play(\'' + location.path + '\')" class="btn btn-small btn-primary" id="play' + cid + '"><i class="icon-play icon-white"></i> Play</button>' \
              + '<br><strong>Track:</strong>' + location.path + '.mp3'

          cid += 1

        mc = new MarkerClusterer(map.map, map.markers)

        console.log map.markers

  #setTimeout(reqLocations, 60000 * 5)

  reqLocations()