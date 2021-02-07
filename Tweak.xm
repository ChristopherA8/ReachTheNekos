#import "Tweak.h"

%hook SBReachabilityBackgroundViewController


- (void)viewDidAppear:(BOOL)animated {
    %orig;
    
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
    }

    [self.view addSubview:imageView];
    [self.view bringSubviewToFront:imageView];
}

%end

%hook SBReachabilityBackgroundView

- (void)_setupChevron {
    // Remove chevron from reachability
}

%end
