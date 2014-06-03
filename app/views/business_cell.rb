class BusinessCell < UITableViewCell

  attr_accessor :business

  def create_subviews
    @business_name = UILabel.alloc.init
    @business_name.textAlignment = UITextAlignmentLeft
    @business_name.font = UIFont.systemFontOfSize(14)

    @distance = UILabel.alloc.init
    @distance.textAlignment = UITextAlignmentLeft
    @distance.font = UIFont.systemFontOfSize(8)

    @image_view = UIImageView.alloc.initWithFrame([[0, 0], [0, 0]])
    @image_view.layer.cornerRadius = 4.0
    @image_view.layer.masksToBounds = true
    # @image_view.layer.borderWidth = 2.0
    # @image_view.layer.borderColor = UIColor.blackColor

    self.contentView.addSubview(@business_name)
    self.contentView.addSubview(@distance)
    self.contentView.addSubview(@image_view)

    self
  end

  def populate_subviews
    @business_name.text = business.name
    @distance.text = business.distance.round(1).to_s

    photo_data = NSData.alloc.initWithContentsOfURL(NSURL.URLWithString(business.photo_url_small))
    @image = UIImage.imageWithData(photo_data)
    @image_view.image = @image
  end

  def layoutSubviews
    super

    content_rect = self.contentView.bounds
    origin = content_rect.origin

    @business_name.frame = CGRectMake(origin.x + 70, 5, 200, 25)
    @distance.frame = CGRectMake(origin.x + 70, 30, 100, 15)

    @image_view.frame = CGRectMake(origin.x + 15, 10, 40, 40)
  end
end
