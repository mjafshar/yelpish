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

    contentRect = self.contentView.bounds
    boundsX = contentRect.origin.x

    @business_name.frame = CGRectMake(boundsX+70, 5, 200, 25)
    @distance.frame = CGRectMake(boundsX+70, 30, 100, 15)
    @image_view.frame = CGRectMake(boundsX+10, 5, 40, 40)
  end
end
