#import "Tweak.h"

%hook SBReachabilityBackgroundViewController


- (void)viewDidAppear:(BOOL)animated {
    %orig;

    static UIImageView *imageView;
    // Add imageView
    if(!imageView) {
        UIImage *image = [UIImage imageWithContentsOfFile:@"/Library/ReachImage/neko.png"];
        imageView = [[UIImageView alloc] initWithImage:image];

        // apparently what you're doing is just scaling the image frame down to
        // be 5x smaller than the image. i preserved this behavior
        CGSize newSize = CGSizeMake(imageView.frame.size.width/5, imageView.frame.size.height/5);
        imageView.frame = CGRectMake(
            (self.view.frame.size.width - newSize.width - 10), // 10 padding
            (-1 * newSize.height),
            newSize.width,
            newSize.height
        );
        // burrit0z shut
		// no
		// thanks : )
    }

    [self.view addSubview:imageView];
    [self.view bringSubviewToFront:imageView];

	[NSLayoutConstraint activateConstraints:@[ // If I don't need half of these feel free to remove some
		[imageView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor],
		[imageView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor],
		[imageView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
		[imageView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
		[imageView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
		[imageView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
		[imageView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor],
		[imageView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor]
	]];
}

%end

%hook SBReachabilityBackgroundView

- (void)_setupChevron {
    // Remove chevron from reachability
}

%end
