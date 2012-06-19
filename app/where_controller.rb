class WhereController < UIViewController
  def init
    super.tap do
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Dove Siamo', image:UIImage.imageNamed('map'), tag:3)
      @poul_location = [45.47717,9.229802]
      @map_region = [@poul_location, [0.001,0.001]]
    end
  end

  def loadView
    super
    self.view = MKMapView.alloc.init
    self.view.frame = self.tabBarController.view.bounds
    self.view.delegate = self
    self.view.mapType = MKMapTypeHybrid
    
  end

  def viewDidLoad
    super
    self.view.setRegion(@map_region, animated:true)
    @poul_annotation = MKPointAnnotation.alloc.init
    @poul_annotation.coordinate = @poul_location
    @poul_annotation.title = "Sede POuL"
    @poul_annotation.subtitle = "Veniteci a trovare"
    self.view.addAnnotation(@poul_annotation)
    
    
  end

  def mapView(map_view, didAddAnnotationViews:ann_views)
    self.view.selectAnnotation(@poul_annotation, animated:true)
  end
  

  def mapView(map_view, viewForAnnotation:annotation)
    annotation_view = self.view.dequeueReusableAnnotationViewWithIdentifier('tux')
    unless(annotation_view)
      annotation_view = MKAnnotationView.alloc.initWithAnnotation(annotation, reuseIdentifier:'tux')
      annotation_view.image = UIImage.imageNamed('tux_icon')
      annotation_view.canShowCallout = true
    end

    annotation_view
  end
  

  
end
