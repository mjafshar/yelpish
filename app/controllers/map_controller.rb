class MapController < UIViewController
  attr_accessor :address

  def viewDidLoad
    get_location_from_address(address)
  end

  def initWithAddress(address)
    init
    self.address = address
    self
  end

  def get_location_from_address(address)
    # address = address.address
    NSLog("Address: #{address}")
    map_view = MKMapView.alloc.init
    map_view.frame = self.view.frame
    map_view.delegate = self
    # map_view.region = CoordinateRegion.new([41.889911, -87.637657], [0.2, 0.2])
    map_view.showsUserLocation = true
    map_view.zoomEnabled = true
    map_view.scrollEnabled = true

    geo_coder = CLGeocoder.alloc.init

    geo_coder.geocodeAddressString(address, completionHandler:lambda do |coord, error|
        if coord
          NSLog("Coord: #{coord.first.location.coordinate.latitude}")
          NSLog("Coord: #{coord.first.location.coordinate.longitude}")
          NSLog("Coord: #{coord.first.location.coordinate}")
          lat = coord.first.location.coordinate.latitude
          long = coord.first.location.coordinate.longitude
          # coord = {latitude: lat, longitude: long}
          # placemarker = MKPlacemark.alloc.initWithPlacemark(coord.first)
          coords = coord.first.location.coordinate
          placemarker = MKPointAnnotation.new
          placemarker.coordinate = coords

          region = MKCoordinateRegion.new
          region.center = coords

          map_view.region = region

          map_view.addAnnotation(placemarker)
        else
          NSLog("Error: #{error.to_s}")
          coord = error
        end
        self.view.addSubview(map_view)
        # self.view.reloadData
      end
    )
  end
end
