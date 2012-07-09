//
//  HomeController.m
//  iOS_design
//
//  Created by Thomas DeMeo on 7/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HomeController.h"

@interface HomeController ()

@end

@implementation HomeController

@synthesize assetController;
@synthesize expandGrip;
@synthesize viewLongPress;

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {

    if ([touch.view tag] == 99) {
        // we touched a button, slider, or other UIControl
        return YES; // ignore the touch
    }
    return NO; // handle the touch
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)handleGrip:(UIPanGestureRecognizer *)recognizer {

    if (recognizer.state == UIGestureRecognizerStateEnded) {
        
        CGPoint velocity = [recognizer velocityInView:self.view];
        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
        CGFloat slideMult = magnitude / 200;
        
        float slideFactor = 0.1 * slideMult; // Increase for more of a slide
        CGPoint finalPoint = CGPointMake(self.assetController.center.x + (velocity.x * slideFactor), 
                                         self.assetController.center.y);
        CGPoint finalPointGrip = CGPointMake(self.expandGrip.center.x + (velocity.x * slideFactor), 
                                         self.expandGrip.center.y);
        
        if (finalPoint.x > 80) {
            finalPoint.x = 80;
        }else if (finalPoint.x < -160) {
            finalPoint.x = -160;
        }
        if (finalPointGrip.x < (0 + (self.expandGrip.bounds.size.width /2))) {
            finalPointGrip.x = (0 + (self.expandGrip.bounds.size.width /2));
        }else if (finalPointGrip.x > (240 + (self.expandGrip.bounds.size.width /2))) {
            finalPointGrip.x = (240+ (self.expandGrip.bounds.size.width /2));
        }
        
        [UIView animateWithDuration:slideFactor*1.0 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.assetController.center = finalPoint;
        } completion:nil];
        [UIView animateWithDuration:slideFactor*1.0 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.expandGrip.center = finalPointGrip;
        } completion:nil];
         
    }else {
        
        CGPoint translation = [recognizer translationInView:self.view];
        
        CGPoint finalPoint = CGPointMake(self.assetController.center.x + translation.x, 
                                         self.assetController.center.y);
        CGPoint finalPointGrip = CGPointMake(self.expandGrip.center.x + translation.x, 
                                             self.expandGrip.center.y);
        
        self.assetController.center = finalPoint;
        self.expandGrip.center = finalPointGrip;
        [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];  
    }
}

- (IBAction)handleLongPress:(UILongPressGestureRecognizer *)recognizer {

    viewLongPress = recognizer.view;
    
    ColorPickerController *cpController = [[ColorPickerController alloc] initWithNibName:nil bundle:nil];
    
    cpController.myDelegate = self;
    
    [self presentModalViewController:cpController animated:YES];
    
}

-(void) colorPickerControllerDismissedWithColor:(UIColor *) colorSelected {
    if ([viewLongPress isKindOfClass:[UINavigationBar class]]) {
        UINavigationBar *navBar = (UINavigationBar *) viewLongPress;
        navBar.tintColor = colorSelected;
    }else {
        [viewLongPress setBackgroundColor:colorSelected];
    }
}



@end
