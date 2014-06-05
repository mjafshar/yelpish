class Business < CDQManagedObject
  def self.prepare(businesses)
    info = businesses.map do |business|
      filter(business)
      get_first_category(business)
    end
    info
  end

  def self.destroy_all
    self.all.array.each do |business|
      business.destroy
    end
  end

  private

  def self.filter(business)
    business.select! do |key, value|
      BUSINESS_PROPERTIES.include?(key.to_sym)
    end
  end

  def self.get_first_category(business)
    business[:category] = business[:categories].first[:name]
    business.delete(:categories)

    business
  end
end
