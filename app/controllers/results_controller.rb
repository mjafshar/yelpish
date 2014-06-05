class ResultsController < UITableViewController
  def viewDidLoad
    self.tableView.delegate = self
    self.tableView.dataSource = self
    self.title = "Results"
  end

  def init
    super
    Location.load do |response|
      if response.has_key?(:businesses)
        Business.destroy_all
        businesses = Business.prepare(response[:businesses])

        businesses.each do |business|
          Business.create(business)
          cdq.save
        end
      end

      self.tableView.reloadData
    end

    self
  end

  def tableView(tableView, numberOfRowsInSection:section)
      Business.all.array.count
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    @reuseIdentifier ||= "ResultsCell"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      cell_view = BusinessCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)

      cell_view.create_subviews
      cell_view
    end
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
    cell.business = Business.sort_by(:distance).all.array[indexPath.row]

    cell.populate_subviews
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)

  end

  def tableView(tableView, heightForRowAtIndexPath:indexPath)
    60
  end
end
