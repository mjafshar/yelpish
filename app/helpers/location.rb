class Location
  def self.load(&block)
    BW::Location.get do |result|
      BW::Location.stop

      lat = result[:to].latitude
      long = result[:to].longitude

      YelpAPI.search(lat, long) do |response|
        block.call(response)
      end
    end
  end
end
