class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    application.setStatusBarStyle(UIStatusBarStyleLightContent)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    results_controller = ResultsController.new
    results_nav_controller = UINavigationController.alloc.initWithRootViewController(results_controller)
    @window.rootViewController = results_nav_controller
    true
  end
end
