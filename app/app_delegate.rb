class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    tab_bar = UITabBarController.alloc.init
    tab_bar.viewControllers = [BitsController.new]
    tab_bar.selectedIndex = 0
    @window.rootViewController = tab_bar
    @window.makeKeyAndVisible
    true
  end
end
