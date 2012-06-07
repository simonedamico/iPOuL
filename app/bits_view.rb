class BitsView < UIView

  attr_accessor :status_label
  
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

      @status_label = UILabel.alloc.init
      @status_label.text = "La sede e' aperta"
      @status_label.textColor = UIColor.whiteColor
      @status_label.backgroundColor = UIColor.clearColor
      @status_label.sizeToFit
      self.addSubview(@status_label)
      
    end
    self
  end 

  def layoutSubviews
    @poul_label.center = CGPoint.new(self.bounds.size.width/2,self.bounds.size.height/8)
    @tux_image.center = CGPoint.new(self.bounds.size.width/2, self.bounds.size.height/2)
    @status_label.center = CGPoint.new(self.bounds.size.width/2, self.bounds.size.height/8*7)
    
  end

  def update_status_label(status)
    if status == :open
      @status_label.text = "La sede e' aperta"
    elsif status == :closed
      @status_label.text = "La sede e' chiusa"
    else
      @status_label.text = "La sede e' in uno stato indefinito"
    end
    
    @status_label.sizeToFit
    self.setNeedsLayout
  end
  
end
