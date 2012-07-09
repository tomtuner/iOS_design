//
//  AssetController.h
//  iOS_design
//
//  Created by Thomas DeMeo on 7/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface AssetController : UIView  {
//    UIImageView *expandGrip;
    UIView *view;
}

//@property (nonatomic, strong) IBOutlet UIImageView *expandGrip;
@property (nonatomic, strong) IBOutlet UIView *view;

- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer;
- (IBAction)handleGrip:(UIPanGestureRecognizer *)recognizer;

@end
