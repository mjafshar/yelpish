class Business
  PROPERTIES = [:name, :photo_url_small, :distance, :is_closed, :category, :mobile_url]
  PROPERTIES.each { |prop|
    attr_accessor prop
  }

  def initialize(hash = {})
    hash.each { |key, value|
      # if PROPERTIES.member? key.to_sym
      if self.respond_to?(key.to_s + "=")
        self.send((key.to_s + "=").to_s, value)
      end
    }
  end

  def categories=(new_categories_list)
    self.category = new_categories_list.first[:name]
  end
end
