class GiornalinuxController < UITableViewController
  GIORNALINUX_NUMBERS = 10
  GIORNALINUX_CELL_NAME = 'giornalinux'
  
  def initWithStyle(style)
    if super(style)
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Giornalinux', image:UIImage.imageNamed('book.png'), tag:1)
    end
    self
  end

  def tableView(tableView, numberOfRowsInSection:section)
    GIORNALINUX_NUMBERS 
  end

  def tableView(tableView, cellForRowAtIndexPath:path)
    cell = self.tableView.dequeueReusableCellWithIdentifier('giornalinux')
    unless(cell)
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:GIORNALINUX_CELL_NAME)
    end
    cell.textLabel.text = "Giornalinux numero #{path.row}"
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:path)
    @doc_controller ||= UIDocumentInteractionController.alloc.init
    giornalinux_path = NSBundle.mainBundle.pathForResource("giornalinux#{path.row}.pdf", ofType:nil)
    giornalinux_url = NSURL.fileURLWithPath(giornalinux_path)
    @doc_controller.URL = giornalinux_url
    @doc_controller.name = "Giornalinux #{path.row}"
    @doc_controller.delegate = self
    @doc_controller.presentPreviewAnimated(true)
    
  end

  def documentInteractionControllerViewControllerForPreview(controller)
    self
  end
  
  
end
