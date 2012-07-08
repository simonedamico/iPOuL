class BitsController < UIViewController
  def init
    super.tap do
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Bits', image:UIImage.imageNamed('radar.png'), tag:0)
    end

  end
  
  def loadView
    self.view = BitsView.alloc.init
  end

  def viewDidLoad
    update_status
    self.view.tux_image.whenPressed do
      update_status
    end
    
  end

  def update_status
    self.view.update_status_label(:updating)
    BW::HTTP.get('http://bits.otacon22.it/status.php?format=text') do |response|
      if response.body.to_str == "1"
        self.view.update_status_label(:open)
      elsif response.body.to_str == "0"
        self.view.update_status_label(:closed)
      else
        self.view.update_status_label(:sailcazzo)
      end
    end
    
  end
  
end
