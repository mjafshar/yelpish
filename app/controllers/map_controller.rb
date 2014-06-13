class MapController < UIViewController
  attr_accessor :business

  def loadView
    super
    self.view = MKMapView.alloc.init
    self.view.zoomEnabled = true
    self.view.scrollEnabled = true
    view.delegate = self
  end

  def viewDidLoad
    get_location_from_address(business.address)
  end

  def initWithBusiness(business)
    init
    self.business = business
    self
  end

  def get_location_from_address(address)
    geo_coder = CLGeocoder.alloc.init
    NSLog("Address: #{address}")
    geo_coder.geocodeAddressString(address, completionHandler:lambda do |coord, error|
      if coord
        coords = coord.first.location.coordinate
        placemarker = MKPointAnnotation.new
        placemarker.coordinate = coords
        placemarker.title = business.name

        region = MKCoordinateRegion.new
        region.center = coords

        self.view.region = region
        self.view.addAnnotation(placemarker)
      else
        NSLog("Error Description: #{error.localizedDescription}")
        NSLog("Failure Reason: #{error.localizedFailureReason}")
        NSLog("Recovery Suggestion: #{error.localizedRecoverySuggestion}")
        error
      end
    end)
  end
end
