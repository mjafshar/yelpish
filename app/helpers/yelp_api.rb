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
        business_info = format_json(json[:businesses])
      else
        error = {error: "Error with the Yelp API"}
      end

      @block.call(business_info, error)
    end
  end

  def self.format_json(json)
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
