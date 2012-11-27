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
//= require jquery-ui
//= require jquery_ujs
//= require twitter/bootstrap
// require_tree .

var play = function(id) {
    var audio = document.getElementById('player');
    audio.pause();

    $.ajax({
        url: '/sounds/' + id + '.json',
        dataType: 'json',
        success: function (data) {
            //alert("hi")
            var sound = data.sound
            var r_tag_sounds = data.tags

            var tag_titles = ""
            var tags_html = ""
            for(i in r_tag_sounds) {
                tags_html += "<span class=\"label label-info\">"+ r_tag_sounds[i].tag_title +"</span>&nbsp;";
                tag_titles += r_tag_sounds[i].tag_title + ","
            }
            tags_html += "<button class=\"btn btn-primary btn-mini\" onclick=\"edit_tag('"+ id +"','"+ tag_titles +"')\">Edit</button>"

            $('#p-title').html(sound.title);
            $('#p-description').html(sound.description);
            $('#p-location').html(sound.location);
            $('#p-tags').html(tags_html);
            //$('#p-author').html(data.username);
            //alert("data.username")


            audio.src = sound.path.url;
            audio.play();
        }
    });

}

//Set to tagit style
var edit_tag = function(sound_id, tag_titles){
    //Generate all tags in <ul> format
    tags = tag_titles.split(',')

    var tags_html = "<ul id=\"ul_tags\">"
    for(i in tags){
        if(tags[i] != ""){
            tags_html += "<li>"+ tags[i] +"</li>"
        }
    }
    tags_html += "</ul>"
    tags_html += "<button class=\"btn btn-primary btn-mini\" onclick=\"save_tag('"+ sound_id +"')\">Save</button>"
    tags_html += "<button class=\"btn btn-primary btn-mini\" onclick=\"play('"+ sound_id +"')\">Cancel</button>"

    $('#p-tags').html(tags_html);

    //Set to tagit style
    $('#ul_tags').tagit();
}

var save_tag = function(id){
    //Get all tags which link to sound_id
    var array = $('#ul_tags').tagit("assignedTags");
    var titles = ""
    for(i in array){
        titles += array[i]
        if(i < array.length-1) titles += ","
    }

    $.ajax({
        url: '/sounds/' + id + '/update_tags',
        data: {tags: titles},
        dataType: 'json',
        success: function (data){
           //alert(data);
            play(id);
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

var random_play = function() {
    var str = $('#radio_sound_paths').val()

    if(str[str.length-1] == ','){
        str = str.substr(0, str.length-1)
    }
    var paths = str.split(',')

    //get random number from 0~length-1
    var rnd=Math.floor(Math.random()*paths.length)

    audio = document.getElementById('random_player')
    audio.pause()
    audio.src = paths[rnd]
    audio.play()

    audio.addEventListener("ended", function(){
        audio.src = paths[Math.floor(Math.random()*paths.length)]
        audio.play()
    })

}
