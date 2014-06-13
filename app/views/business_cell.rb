class BusinessCell < UITableViewCell

  attr_accessor :business

  def create_subviews
    @business_name = UILabel.alloc.init
    @business_name.textAlignment = UITextAlignmentLeft
    @business_name.font = UIFont.systemFontOfSize(14)

    @distance = UILabel.alloc.init
    @distance.textAlignment = UITextAlignmentLeft
    @distance.font = UIFont.systemFontOfSize(12)
    @distance.textColor = UIColor.grayColor

    @category = UILabel.alloc.init
    @category.textAlignment = UITextAlignmentLeft
    @category.font = UIFont.systemFontOfSize(12)
    @category.textColor = UIColor.grayColor

    @open = UILabel.alloc.init
    @open.textAlignment = UITextAlignmentRight
    @open.font = UIFont.systemFontOfSize(10)
    @open.textColor = UIColor.greenColor

    @image_view = UIImageView.alloc.initWithFrame([[0, 0], [0, 0]])
    @image_view.layer.cornerRadius = 4.0
    @image_view.layer.masksToBounds = true
    # @image_view.layer.borderWidth = 2.0
    # @image_view.layer.borderColor = UIColor.blackColor

    self.contentView.addSubview(@business_name)
    self.contentView.addSubview(@distance)
    self.contentView.addSubview(@category)
    self.contentView.addSubview(@open)
    self.contentView.addSubview(@image_view)

    self
  end

  def populate_subviews
    @business_name.text = business.name
    @distance.text = "#{business.distance.round(1).to_s} miles away"
    @category.text = business.category
    @open.text = 'OPEN'

    image = UIImage.imageWithContentsOfFile("#{PHOTOS_SMALL}#{business.image_path}")
    @image_view.image = image
  end

  def layoutSubviews
    super

    content_rect = self.contentView.bounds
    origin = content_rect.origin

    @business_name.frame = CGRectMake(origin.x + 90, 8, 200, 25)
    @distance.frame = CGRectMake(origin.x + 90, 35, 100, 15)
    @category.frame = CGRectMake(origin.x + 90, 55, 100, 15)
    @open.frame = CGRectMake(origin.x + 200, 12, 100, 15)
    @image_view.frame = CGRectMake(origin.x + 12.5, 12.5, 60, 60)
  end
end
