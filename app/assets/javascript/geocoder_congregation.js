$(document).ready(function() {
  $("#geocoder_congregation").autocomplete({
    source: function(request, response) {
      $.ajax({
        url: "/location_search",
        data: { location: request.term },
        dataType: "json",
        success: function(data) {
          var locations = $.map(data, function(location) {
            return {
              label: location.address,
              value: location.address
            }
          });
          response(locations);
        }
      });
    }
  });
});