// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

var play = function(id) {
    var audio = document.getElementById('player');
    audio.pause();

    $.ajax({
        url: '/sounds/' + id + '.json',
        dataType: 'json',
        success: function (data) {
            audio.src = data.path.url;
            $('#p-title').html(data.title);
            $('#p-location').html(data.location);
            audio.play();
        }
    });

}

var setLocation = function(id) {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(pos) {
            $('#' + id).attr({ 'value': pos.coords.longitude + "," + pos.coords.latitude });
        });
    } else {
        alert("not supported");
    }
}