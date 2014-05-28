class YelpAPI
  API_URL = "http://api.yelp.com/business_review_search"

  def self.search(lat, long, &block)
    @block = block
    search_url = "#{API_URL}?lat=#{lat}&long=#{long}&ywsid=#{YWSID}"
    BW::HTTP.get(search_url) do |response|
      json = nil
      error = nil

      if response.ok?
        json = BW::JSON.parse(response.body.to_s)
      else
        error = {error: "Error with the Yelp API"}
      end

      @block.call(json, error)
    end

  end

end
