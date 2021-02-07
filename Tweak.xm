#import "Tweak.h"

%hook SBReachabilityBackgroundViewController


-(void)viewDidAppear:(BOOL)animated { // Add imageView
	%orig;

	if (!imageView) {
		image = [UIImage imageWithContentsOfFile:@"/Library/ReachImage/neko.png"];
		imageView = [[UIImageView alloc] initWithImage:image];
		imageView.frame = CGRectMake(220,-imageView.frame.size.height/5,imageView.frame.size.width/5,imageView.frame.size.height/5); 
		// burrit0z shut
	}
	[self.view addSubview:imageView];
	[self.view bringSubviewToFront:imageView];
}

%end

%hook SBReachabilityBackgroundView

-(void)_setupChevron { } // Remove chevron from reachability

%end