class NewsController < UITableViewController
  def initWithStyle(style)
    super.tap do
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('News', image:UIImage.imageNamed('calendar'), tag:4)
    end
  end

  def viewDidLoad
    super
    @news ||= []
    news_feed = BW::RSSParser.new('http://www.poul.org/category/eventi/feed/')
    news_feed.parse do |item|
      @news << item
      self.view.reloadData
    end
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @news.size
  end

  def tableView(tableView, cellForRowAtIndexPath:path)
    cell = self.tableView.dequeueReusableCellWithIdentifier('news-cell')
    unless(cell)
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:'news-cell')
    end

    cell.tap do |cell|
      cell.textLabel.text = @news[path.row].title
      cell.detailTextLabel.text = @news[path.row].description
    end
  end
  
  def tableView(tableView, didSelectRowAtIndexPath:path)
    App.open_url(@news[path.row].link)
  end
  
end
