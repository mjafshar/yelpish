class BusinessCell < UITableViewCell

  attr_accessor :business

  def create_subviews
    @business_name = UILabel.alloc.init
    @business_name.textAlignment = UITextAlignmentLeft
    @business_name.font = UIFont.fontWithName('Lucida Grande', size: 16)
    @business_name.textColor = UIColor.darkGrayColor

    @distance = UILabel.alloc.init
    @distance.textAlignment = UITextAlignmentLeft
    @distance.font = UIFont.fontWithName('Lucida Grande', size: 12)
    @distance.textColor = UIColor.lightGrayColor

    @category = UILabel.alloc.init
    @category.textAlignment = UITextAlignmentLeft
    @category.font = UIFont.fontWithName('Lucida Grande', size: 12)
    @category.textColor = UIColor.lightGrayColor

    @open = UILabel.alloc.init
    @open.textAlignment = UITextAlignmentRight
    @open.font = UIFont.fontWithName('Lucida Grande', size: 10)

    @image_view = UIImageView.alloc.initWithFrame([[0, 0], [0, 0]])
    @image_view.layer.cornerRadius = 4.0
    @image_view.layer.masksToBounds = true

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
    set_open_or_closed_status

    image = UIImage.imageWithContentsOfFile("#{PHOTOS_SMALL}#{business.image_path}")
    @image_view.image = image
  end

  def layoutSubviews
    super

    content_rect = self.contentView.bounds
    origin = content_rect.origin

    @business_name.frame = CGRectMake(origin.x + 90, 8, 160, 25)
    @distance.frame = CGRectMake(origin.x + 90, 35, 100, 15)
    @category.frame = CGRectMake(origin.x + 90, 55, 100, 15)
    @open.frame = CGRectMake(origin.x + 200, 14, 100, 15)
    @image_view.frame = CGRectMake(origin.x + 12.5, 12.5, 60, 60)
  end

  def set_open_or_closed_status
    if business.is_closed == 1
      @open.textColor = UIColor.lightGrayColor
      @open.text = 'CLOSED'
    else
      @open.textColor = UIColor.colorWithRed(0.11, green:0.73, blue:0.26, alpha:1)
      @open.text = 'OPEN'
    end
  end
end
