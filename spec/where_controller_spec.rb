describe "The Where Controller" do
  before do
    @controller = WhereController.alloc.init
    tab = UITabBarController.alloc.init
    tab.viewControllers = [@controller]
    window.rootViewController = tab

  end
    
  tests WhereController

  it "should contains only the POuL annotation" do
    controller.view.annotations.size.should.equal 1
  end
  
end
