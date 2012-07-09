//
//  AssetController.m
//  iOS_design
//
//  Created by Thomas DeMeo on 7/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AssetController.h"

@interface AssetController ()

-(void) initialize;

@end

@implementation AssetController

//@synthesize expandGrip;
@synthesize view;

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        [self initialize];
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    [[NSBundle mainBundle] loadNibNamed:@"AssetController" owner:self options:nil];

    self.layer.masksToBounds = NO;
    self.layer.cornerRadius = 8; // if you like rounded corners
    self.layer.shadowOffset = CGSizeMake(5, 0);
    self.layer.shadowRadius = 5;
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowColor = [[UIColor blackColor] CGColor];

    
    [self addSubview:view];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer {

    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:UIViewAnimationCurveEaseOut
                     animations:^{
                         CGPoint centerSuperView         = CGPointMake((-160), self.view.superview.center.y);
                         
                         self.view.superview.center = centerSuperView;
                     }
                     completion:nil];
    UIView *gripView = [self.view.superview.superview viewWithTag:10];
    [UIView animateWithDuration:1.0
                          delay:0
                        options:UIViewAnimationCurveEaseOut
                     animations:^{
                         CGPoint centerSuperView         = CGPointMake(0 + (gripView.bounds.size.width /2), gripView.center.y);
        gripView.center = centerSuperView;
    } completion:nil];
    
    CGPoint translation = [recognizer translationInView:self.view];
    
    if ([recognizer.view tag] == 0) {
        UIImageView *copyView = (UIImageView *)recognizer.view;
        [self.view.superview addSubview:copyView];
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]
                                                   initWithTarget:[self.view.superview.superview nextResponder] action:@selector(handleLongPress:)];
        [recognizer.view addGestureRecognizer:longPress];
        [self.view.superview.superview addSubview:recognizer.view];
        [self.view.superview.superview sendSubviewToBack:recognizer.view];
        [recognizer.view setTag:1];
    }else {
        recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x, 
                                         recognizer.view.center.y + translation.y);
    }
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];    
}

//- (IBAction)handleGrip:(UIPanGestureRecognizer *)recognizer {
//    
//    if (recognizer.state == UIGestureRecognizerStateEnded) {
//        
//        CGPoint velocity = [recognizer velocityInView:self.view];
//        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
//        CGFloat slideMult = magnitude / 200;
//        NSLog(@"magnitude: %f, slideMult: %f", magnitude, slideMult);
//        
//        float slideFactor = 0.1 * slideMult; // Increase for more of a slide
//        CGPoint finalPoint = CGPointMake(self.view.superview.center.x + (velocity.x * slideFactor), 
//                                         self.view.superview.center.y);
//        if (finalPoint.x > 80) {
//            finalPoint.x = 80;
//        }else if (finalPoint.x < -150) {
//            finalPoint.x = -150;
//        }
//        
//        [UIView animateWithDuration:slideFactor*1.0 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//            self.view.superview.center = finalPoint;
//        } completion:nil];
//        
//    }else {
//        
//        CGPoint translation = [recognizer translationInView:self.view];
//
//        self.view.superview.center = CGPointMake(self.view.superview.center.x + translation.x, 
//                                             self.view.superview.center.y);
//        [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];  
//    }
//}


@end
