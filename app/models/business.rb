class Business < CDQManagedObject
  BUSINESS_PROPERTIES.each { |prop|
    attr_accessor prop
  }

  def initialize(hash = {})
    hash.each { |key, value|
      if self.respond_to?(key.to_s + "=")
        self.send((key.to_s + "=").to_s, value)
      end
    }
  end

  def categories=(new_categories_list)
    self.category = new_categories_list.first[:name]
  end
end
