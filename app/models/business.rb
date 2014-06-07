class Business < CDQManagedObject
  def self.prepare(businesses)
    counter = 0
    info = businesses.map do |business|
      counter += 1
      create_address(business)
      filter(business)
      get_first_category(business)
      cache_image(business, counter)
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

  def self.cache_image(business, counter)
    image = encode_image(business[:photo_url_small])
    image_name = "#{Time.now.to_s.gsub(/:|-| /,'')}-#{counter}.jpg"

    write_image(image, image_name)
    business[:image_path] = image_name

    business
  end

  def self.create_address(business)
    business[:address] = "#{business[:address1]}, #{business[:city]}, #{business[:zip]}"

    business
  end

  def self.encode_image(url)
    photo_data = NSData.alloc.initWithContentsOfURL(NSURL.URLWithString(url))
    image = UIImage.imageWithData(photo_data)
    imageData = UIImage.UIImageJPEGRepresentation(image, 1)
    [imageData].pack("m0")
  end

  def self.write_image(image, image_name)
    unpack = image.unpack("m0")

    File.open("#{PHOTOS_SMALL}/#{image_name}", "w+b") do |f|
      f.write(unpack.first)
    end
  end
end
