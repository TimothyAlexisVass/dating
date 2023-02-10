class LocationController < ApplicationController
  def search
    geocoder_location = params[:location]
    @locations = Geocoder.search(geocoder_location).first(20).map do |location|
      {
        address: location.address,
        longitude: location.longitude,
        latitude: location.latitude
      }
    end
    respond_to do |format|
      format.json { render json: @locations }
    end
  end
end
