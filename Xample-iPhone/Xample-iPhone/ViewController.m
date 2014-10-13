//
//  ViewController.m
//  SimpleXample-iPhone
//
//  Created by jesse on 12.10.14.
//  Copyright (c) 2014 j-apps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *logo;

@property (nonatomic, weak) IBOutlet UITextField *inputTextField;
@property (nonatomic, weak) IBOutlet UITextField *outputTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
	[self animateLogo:[NSNumber numberWithFloat:1.5]];
	[self performSelector:@selector(animateLogo:) withObject:[NSNumber numberWithFloat:1] afterDelay:0.3];
	
}

- (void)animateLogo:(NSNumber *)scale
{
	if (_logo) {
		
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.3];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
		
		
		_logo.transform = CGAffineTransformScale(CGAffineTransformIdentity, [scale floatValue], [scale floatValue]);

		
		[UIView commitAnimations];
		
	}
}

- (IBAction)slectableButton:(id)sender
{
	UIButton *button = (UIButton *)sender;
	
	[button setSelected:!button.selected];
}

- (IBAction)sendTextButton:(id)sender
{
	if (_inputTextField && _outputTextField) {
		_outputTextField.text = _inputTextField.text;
	}
}

@end
