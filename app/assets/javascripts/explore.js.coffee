# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->

  map = new GMaps
    zoom: 9
    div: '#map-explore'
    lng: 116.4
    lat: 39.93
    scrollwheel: false

  GMaps.geolocate
    success: (position) ->
      map.setCenter position.coords.latitude, position.coords.longitude
      map.setZoom 12
      getNearybySounds("#{position.coords.latitude},#{position.coords.longitude}", 5)

  $('#location-search-commit').click ->

    location_content = $('#location-search-content').val()

    if location_content.length == 0
      alert 'Enter something please :-)'
      return false

    getNearybySounds(location_content, 5)

    return false

  getNearybySounds = (current, distance) ->
    $('#play_radio_btn').attr("disabled", "disabled")
    $('#stop_radio_btn').attr("disabled", "disabled")

    $.ajax
      url: '/nearby.json'
      dataType: 'json'
      type: 'POST'
      data: "location=#{current}&distance=#{distance}"
      beforeSend: ->
        $('#location-search-commit').button('loading')
        $('#loading-bar').fadeIn()

      success: (data) ->
        #alert(data.data[1].sound.path.url.substr(25))
        console.log data
        $('#location-search-commit').button('reset')
        $('#loading-bar').hide()

        current_location = new google.maps.LatLng data.current.data.geometry.location.lat, data.current.data.geometry.location.lng

        map.map.panTo current_location
        map.removeMarkers()

        html = ''
        sound_paths = ''

        for location in data.data
          sound_paths += location.sound.path.url + ','

          html += generateList(location)

          location_lat = parseFloat(location.sound.location.split(',')[1])
          location_lng = parseFloat(location.sound.location.split(',')[0])

          map.addMarker
            lat: location_lat
            lng: location_lng

            click:
              ((item) ->
                () ->
                  play(item))(location)

            animation: google.maps.Animation.DROP

        #cache sounds' file path
        $('#radio_sound_paths').val(sound_paths)
        $('#play_radio_btn').removeAttr("disabled")
        $('#stop_radio_btn').removeAttr("disabled")


        $('#info-box-list').hide ->
          $('#info-box-list').html(html)
          $('#info-box-list').fadeIn()

  play = (item) ->
    audio = document.getElementById 'player'
    audio.pause()

    audio.src = item.sound.path.url.substr(54)
    #audio.src = item.sound.path.url

    $('#p-title').html item.sound.title
    $('#p-description').html item.sound.description
    $('#p-location').html item.sound.location
    $('#p-author').html item.username
    audio.play()

  generateList = (item) ->
    html = """
    <div class="info-box-entry">
      <h5 class="info-entry-title">#{item.sound.title}</h5>
      <p>#{item.sound.description}</p>
      <div class="info-entry-author">By <a href="#">#{item.username}</a> at <a href="#">Santa Barbara</a></div>
      <div class="info-entry-labels">
        <a href="#"><span class="label label-info">Chinese</span></a>
        <span class="label label-info">life</span>
        <span class="label label-info">mood</span>
      </div>
    </div>
    """