@implementation SBReachabilityWindow

- (id)initWithWallpaperVariant:(long long)arg1 {
  id backgroundViewController = [[SBReachabilityBackgroundViewController alloc]
      initWithWallpaperVariant:arg1];

  NSString *selfClassName = NSStringFromClass(self);

  SBReachabilityWindow *reachabilityWindow =
      [super initWithScreen:[UIScreen mainScreen]
                   debugName:NSStringFromClass([self class])
          rootViewController:backgroundViewController];

  if (reachabilityWindow) {
    [reachabilityWindow setBackgroundColor:[UIColor clearColor]];
    [reachabilityWindow setWindowLevel:UIScreenshotServicesWindowLevel - 1.0];
    [reachabilityWindow setClipsToBounds:NO];
  }

  return reachabilityWindow;
}

@end