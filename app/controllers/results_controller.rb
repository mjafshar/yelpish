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
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:@reuseIdentifier)
    end
    business = @businesses[indexPath.row]
    cell.textLabel.text = business.name
    cell.detailTextLabel.text = "#{business.category}, #{business.distance.round(1).to_s} miles away"

    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)

  end
end
