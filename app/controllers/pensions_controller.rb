class PensionsController < ApplicationController

  def index
    @pensions = Pension.all

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @pensions.geocoded.map do |pension|
      {
        lat: pension.latitude,
        lng: pension.longitude
      }
    end
  end
end
