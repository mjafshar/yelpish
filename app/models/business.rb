class Business < CDQManagedObject
  def self.destroy_all
    Business.all.array.each do |business|
      business.destroy
    end
  end
end
