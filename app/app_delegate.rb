class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    #App does not launch normally if tests are running
    return true if RUBYMOTION_ENV == 'test'
    
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    tab_bar = UITabBarController.alloc.init
    tab_bar.viewControllers = [BitsController.alloc.init, GiornalinuxController.alloc.initWithStyle(UITableViewStyleGrouped), NewsController.alloc.init, WhereController.alloc.init]
    tab_bar.selectedIndex = 0
    @window.rootViewController = tab_bar
    @window.makeKeyAndVisible
    true
  end
end
