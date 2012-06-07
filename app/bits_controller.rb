class BitsController < UIViewController
  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Bits', image:UIImage.imageNamed('radar.png'), tag:0)
    end

    self
  end
  
  def loadView
    self.view = BitsView.alloc.init
  end

  def viewDidLoad
    update_status
  end

  def update_status
    if is_open?
      self.view.update_status_label(:open)
    else
      self.view.update_status_label(:closed)
    end
  end
  
  def is_open?
    return false
  end
  
end
