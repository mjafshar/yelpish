class ResultsController < UITableViewController
  def viewDidLoad
    nav_bar = self.navigationController.navigationBar
    nav_bar.setTranslucent(false)
    nav_bar.barTintColor = UIColor.colorWithRed(0, green:0.66, blue:0.89, alpha:1)
    nav_bar.barStyle = UIBarStyleBlackOpaque

    self.tableView.delegate = self
    self.tableView.dataSource = self
    self.title = "Locations"
  end

  def init
    super
    Location.load do |response|
      if response.has_key?(:businesses)
        Business.destroy_all
        FileManager.destroy_all
        businesses = Business.prepare(response[:businesses])

        businesses.each do |business|
          Business.create(business)
          cdq.save
        end
      end

      @businesses = Business.sort_by(:distance).all.array
      self.tableView.reloadData
    end
    @businesses = Business.sort_by(:distance).all.array

    self
  end

  def tableView(tableView, numberOfRowsInSection:section)
      @businesses.count
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    @reuseIdentifier ||= "ResultsCell"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      cell_view = BusinessCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)

      cell_view.create_subviews
      cell_view
    end
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
    cell.business = @businesses[indexPath.row]

    cell.populate_subviews
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    business = @businesses[indexPath.row]
    map_view = MapController.alloc.initWithBusiness(business)
    self.navigationController.pushViewController(map_view, animated:true)
  end

  def tableView(tableView, heightForRowAtIndexPath:indexPath)
    85
  end
end
