//
//  ColorPickerController.m
//  iOS_design
//
//  Created by Thomas DeMeo on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ColorPickerController.h"

@interface ColorPickerController ()

@end

@implementation ColorPickerController

@synthesize swatchView;
@synthesize myDelegate;

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

- (IBAction)colorSelected:(id)sender {
    NSString *color = [(UIButton *)sender currentTitle];
    if ([color isEqual:@"Red"]) {
        [swatchView setBackgroundColor:[UIColor redColor]];
    }else if ([color isEqual:@"Green"]) {
        [swatchView setBackgroundColor:[UIColor greenColor]];
    }else if ([color isEqual:@"Blue"]) {
        [swatchView setBackgroundColor:[UIColor blueColor]];
    }
}

- (IBAction)colorDoneSelected:(id)sender {
    if([self.myDelegate respondsToSelector:@selector(colorPickerControllerDismissedWithColor:)])
    {
        [self.myDelegate colorPickerControllerDismissedWithColor:swatchView.backgroundColor];
    }
    [self dismissModalViewControllerAnimated:YES];
}

@end
