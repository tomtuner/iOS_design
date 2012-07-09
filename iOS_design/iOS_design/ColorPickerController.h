//
//  ColorPickerController.h
//  iOS_design
//
//  Created by Thomas DeMeo on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ColorDelegate <NSObject>
-(void) colorPickerControllerDismissedWithColor:(UIColor *) colorSelected;
@end

@interface ColorPickerController : UIViewController {
    UIView *swatchView;
}

@property (weak) id myDelegate;
@property(nonatomic, strong) IBOutlet UIView *swatchView;

- (IBAction)colorSelected:(id)sender;
- (IBAction)colorDoneSelected:(id)sender;

@end
