// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// require turbolinks
//= require_tree .

// $(document).on('page:load', function() {
//   componentHandler.upgradeDom();
// });

// $(document).on('ready', function() {
//   componentHandler.upgradeDom();
// });

$(document).on('ready page:load', function() {
  if ($('body.videos-new').length) {
    var mapStyle = [{"featureType":"landscape","stylers":[{"hue":"#FFBB00"},{"saturation":43.400000000000006},{"lightness":37.599999999999994},{"gamma":1}]},{"featureType":"road.highway","stylers":[{"hue":"#FFC200"},{"saturation":-61.8},{"lightness":45.599999999999994},{"gamma":1}]},{"featureType":"road.arterial","stylers":[{"hue":"#FF0300"},{"saturation":-100},{"lightness":51.19999999999999},{"gamma":1}]},{"featureType":"road.local","stylers":[{"hue":"#FF0300"},{"saturation":-100},{"lightness":52},{"gamma":1}]},{"featureType":"water","stylers":[{"hue":"#0078FF"},{"saturation":-13.200000000000003},{"lightness":2.4000000000000057},{"gamma":1}]},{"featureType":"poi","stylers":[{"hue":"#00FF6A"},{"saturation":-1.0989010989011234},{"lightness":11.200000000000017},{"gamma":1}]}];

    var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    var labelIndex = 0;
    window.initMap = function() {
      var map_el = document.getElementById('map');
      var lat = parseFloat($(map_el).data('lat'));
      var lng = parseFloat($(map_el).data('lng'));
      console.log(lat, lng);
      window.map = new google.maps.Map(map_el, {
        center: {lat: lat, lng: lng },
        zoom: 12,
        styles: mapStyle
      });

      // var infoWindow = new google.maps.InfoWindow({map: map});
      
      // This event listener calls addMarker() when the map is clicked.
       var listener = google.maps.event.addListener(map, 'click', function(event) {
        console.log("click")
        addMarker(event.latLng, map);
        lat = event.latLng.lat()
        lng = event.latLng.lng()
        $('#pin_lat').val(lat);
        $('#pin_lng').val(lng);
      });//listener
    }//initMAp

   
      // Adds a marker to the map.
      
      function addMarker(location, map) {
        // Add the marker at the clicked location, and add the next-available label
        // from the array of alphabetical characters.
        var marker = new google.maps.Marker({
          position: location,
          label: labels[labelIndex++ % labels.length],
          map: map
        });//var marker
      }//addMarker
  }//if
});//document