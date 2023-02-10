$(document).ready(function() {
  $("#geocoder_location").autocomplete({
    source: function(request, response) {
      $.ajax({
        url: "/location_search",
        data: { location: request.term },
        dataType: "json",
        success: function(data) {
          var locations = $.map(data, function(location) {
            return {
              label: location.address,
              value: location.address,
              longitude: location.longitude,
              latitude: location.latitude
            }
          });
          response(locations);
        }
      });
    },
    select: function(event, ui) {
      $("#longitude").val(ui.item.longitude);
      $("#latitude").val(ui.item.latitude);
    }
  });
});