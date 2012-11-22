# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->

  map = new GMaps
    zoom: 9
    div: '#map-select'
    lng: 116.4
    lat: 39.93

  GMaps.geolocate
    success: (position) ->
      map.setCenter position.coords.latitude, position.coords.longitude
      map.setZoom 12

      # add marker indicating current position
      map.addMarker
        lat: position.coords.latitude
        lng: position.coords.longitude
        animation: google.maps.Animation.DROP
        draggable: true
        mouseup: ->
          $('#coords').val "#{this.getPosition().lng()},#{this.getPosition().lat()}"
          $('#latitude-box').val this.getPosition().lat()
          $('#longitude-box').val this.getPosition().lng()


  $('#location-search').submit (e) ->
    e.preventDefault()
    GMaps.geocode
      address: $('#location-search-content').val().trim()
      callback: (results, status) ->
        if status is 'OK'
          latlng = results[0].geometry.location
          map.setCenter latlng.lat(), latlng.lng()
          map.markers[0].setPosition latlng
          map.markers[0].setAnimation google.maps.Animation.BOUNCE


