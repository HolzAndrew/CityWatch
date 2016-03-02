$(document).ready(function() {
  var map;

  $('#pin_form_submit').on("click", function(){
    if (!$('#pin_lat').val()){
          event.preventDefault();
          //flash notice to click for pin location or append note to div with $
    }
  })



  function moveMap(search_lat, search_lng) {
    window.map.setCenter({lat: search_lat, lng: search_lng})//map =
    window.map.setZoom(18)
  }//move map

  var video_notes;
  var video_date;
  var video_time;
  var search_lat;
  var search_lng;

  $(document).on('submit', ".address_search", function(el) {
    el.preventDefault();
      $.ajax({
      type: "GET",
      url: "https://maps.googleapis.com/maps/api/geocode/json",
        data: {

            address: $('.search_input').val(),
            key: ''
        },//data
        success: function(data){
          console.log("mic check. one. two")
          // debugger
          results = data.results[0];
          address = results.formatted_address
          search_lat = results.geometry.location.lat;
          search_lng = results.geometry.location.lng;
          // debugger
          moveMap(search_lat, search_lng);
          return search_lng, search_lat;
        }//success
    })//ajax
  });//address search

});//ready