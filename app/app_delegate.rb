class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    application.setStatusBarStyle(UIStatusBarStyleLightContent)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    create_photo_dir

    results_controller = ResultsController.new
    results_nav_controller = UINavigationController.alloc.initWithRootViewController(results_controller)
    @window.rootViewController = results_nav_controller
    true
  end

  def create_photo_dir
    file_manager = NSFileManager.alloc.init
    file_manager.createDirectoryAtPath(PHOTOS_SMALL, withIntermediateDirectories:false, attributes:nil, error:nil)
  end
end
