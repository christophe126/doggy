class CallGeocoder

  def initialize(address)
    @address = address
  end

  def geocode_address
    Geocoder.search(@address)
  end

end
