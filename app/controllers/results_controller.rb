class ResultsController < UITableViewController
  def viewDidLoad
    self.tableView.delegate = self
    self.tableView.dataSource = self
    self.title = "Results"
  end

  def init
    super
    Location.load do |response|
      @businesses_hash = response
      @businesses = []

      @businesses_hash.each do |business|
        @businesses << Business.new(business)
      end

      self.tableView.reloadData
    end
    self
  end

  def tableView(tableView, numberOfRowsInSection:section)
    if @businesses
      @businesses.count
    else
      0
    end
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

  end

  def tableView(tableView, heightForRowAtIndexPath:indexPath)
    60
  end
end
