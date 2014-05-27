class ResultsController < UITableViewController
  def init
    super

    self.title = "Results"

    self
  end

  def viewDidLoad
    self.tableView.delegate = self
    self.tableView.dataSource = self
  end

  def tableView(tableView, numberOfRowsInSection:section)

  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    @reuseIdentifier ||= "ResultsCell"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:@reuseIdentifier)
    end

    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)

  end
end
