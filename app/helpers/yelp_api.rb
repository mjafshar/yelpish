class YelpAPI
  API_URL = "http://api.yelp.com/business_review_search"

  def self.search(lat, long, &block)
    search_url = "#{API_URL}?lat=#{lat}&long=#{long}&ywsid=#{YWSID}"
    BW::HTTP.get(search_url) do |response|
      if response.ok?
        yelp_response = BW::JSON.parse(response.body.to_s)
      else
        yelp_response = {error: "Error with the Yelp API"}
      end

      block.call(yelp_response)
    end
  end
end
