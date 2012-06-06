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
    end
    self
  end

  def layoutSubviews
      @poul_label.center = CGPoint.new(self.bounds.size.width/2,self.bounds.size.height/8)
  end
  
  
end
