class YelpAPI
  API_URL = "http://api.yelp.com/business_review_search"

  def self.search(lat, long, &block)
    search_url = "#{API_URL}?lat=#{lat}&long=#{long}&ywsid=#{YWSID}"
    BW::HTTP.get(search_url) do |response|
      json = nil

      if response.ok?
        json = BW::JSON.parse(response.body.to_s)
        filtered_response = filter(json[:businesses])

        yelp_response = {businesses: filtered_response}
      else
        yelp_response = {error: "Error with the Yelp API"}
      end

      block.call(yelp_response)
    end
  end

  def self.filter(json)
    json.map do |business|
      info = business.select do |key, value|
        BUSINESS_PROPERTIES.include?(key.to_sym)
      end
      get_first_category(info)
    end
  end

  def self.get_first_category(info)
    info[:category] = info[:categories].first[:name]
    info.delete(:categories)

    info
  end
end
