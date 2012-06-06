class BitsController < UIViewController
  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Bits', image:UIImage.imageNamed('radar.png'), tag:0)
    end

    self
  end
  
    
end
