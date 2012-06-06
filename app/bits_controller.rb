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
  
end
