class Location
  def self.load(&block)
    @block = block
    BW::Location.get do |result|
      BW::Location.stop
      p "To Lat #{result[:to].latitude}, Long #{result[:to].longitude}"
      lat = result[:to].latitude
      long = result[:to].longitude
      YelpAPI.search(lat, long) do |response|
        @block.call(response)
      end
    end
  end
end
