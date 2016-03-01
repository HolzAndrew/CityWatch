$(document).ready(function() {
  var map;

  function moveMap(search_lat, search_lng) {
    map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: search_lat, lng: search_lng},
      zoom: 15,
    })//map =
  }//move map

  var video_notes;
  var video_date;
  var video_time;
  var search_lat;
  var search_lng;

  $(document).on('submit', ".address_search", function(el) {
    el.preventDefault();
    ajax({
      type: "GET",
      url: "https://maps.googleapis.com/maps/api/geocode/json",
        data: {

            address: $('#search_input').val(),
            key: ''
        },//data
        success: function(data){
          console.log("mic check. one. two")
          results = data.results[0];
          address = results.formatted_address
          search_lat = loc_results.geometry.location.lat;
          search_lng = loc_results.geometry.location.lng;
          debugger
          moveMap(search_lat, search_lng);
          return search_lng, search_lat;
        }//success
    })//ajax
  });//address search

});//ready