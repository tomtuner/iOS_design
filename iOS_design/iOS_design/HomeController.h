//
//  HomeController.h
//  iOS_design
//
//  Created by Thomas DeMeo on 7/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AssetController.h"
#import "ColorPickerController.h"

@interface HomeController : UIViewController <UIGestureRecognizerDelegate, ColorDelegate> {
    AssetController *assetController;
    UIImageView *expandGrip;
    id viewLongPress;

}

@property (nonatomic, strong) IBOutlet UIImageView *expandGrip;
@property (nonatomic, strong) IBOutlet AssetController *assetController;
@property (nonatomic, strong) id viewLongPress;

- (IBAction)handleGrip:(UIPanGestureRecognizer *)recognizer;
- (IBAction)handleLongPress:(UILongPressGestureRecognizer *)recognizer;

@end
