class BitsView < UIView
  
  def initWithFrame(rect)
    if super(rect)
      self.backgroundColor = UIColor.viewFlipsideBackgroundColor
      
      @poul_label = UILabel.new
      @poul_label.text = 'iPOuL'
      @poul_label.textColor = UIColor.yellowColor
      @poul_label.backgroundColor = UIColor.clearColor
      if Device.iphone?
        font_size = 72
      elsif Device.ipad?
        font_size = 140
      end
      @poul_label.font = UIFont.fontWithName('HelveticaNeue-BoldItalic', size:font_size)
      @poul_label.sizeToFit
      self.addSubview(@poul_label)


      @tux_image = UIImageView.alloc.initWithImage(UIImage.imageNamed('tux.png'))
      @tux_image.sizeToFit
      @tux_image.bounds = CGRectInset(@tux_image.bounds, 128, 128) if Device.iphone?
      self.addSubview(@tux_image)
      
    end
    self
  end

  def layoutSubviews
    @poul_label.center = CGPoint.new(self.bounds.size.width/2,self.bounds.size.height/8)
    @tux_image.center = CGPoint.new(self.bounds.size.width/2, self.bounds.size.height/2)

    
  end
  
  
end
