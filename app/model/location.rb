class Location
  def self.load(&block)
    @block = block
    BW::Location.get do |result|
      BW::Location.stop
      p "To Lat #{result[:to].latitude}, Long #{result[:to].longitude}"
      NSLog('=============================================================')
      NSLog("To Lat #{result[:to].latitude}, Long #{result[:to].longitude}")
      NSLog('=============================================================')
      lat = result[:to].latitude
      long = result[:to].longitude
      YelpAPI.search(lat, long) do |response|
        sorted_response = response[:businesses].sort_by { |business| business[:distance]}

        @block.call(sorted_response)
      end
    end
  end
end
