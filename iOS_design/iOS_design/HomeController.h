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

@interface HomeController : UIViewController {
    UIPanGestureRecognizer *dragRecognizer;
    AssetController *assetController;
}

@property (nonatomic, strong) IBOutlet AssetController *assetController;

@end
