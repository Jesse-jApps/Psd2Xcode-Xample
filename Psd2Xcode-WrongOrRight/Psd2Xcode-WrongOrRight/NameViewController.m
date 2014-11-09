//
//  NameViewController.m
//  Psd2Xcode-WrongOrRight
//
//  Created by jesse on 09.11.14.
//  Copyright (c) 2014 j-apps. All rights reserved.
//

#import "NameViewController.h"

NSString* const NAME_TEXT = @"NAME_TEXT";

@interface NameViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *nameText;

@end

@implementation NameViewController



- (void)viewDidLoad {
    [super viewDidLoad];
	
	_nameText.placeholder = [self loadName];
}

- (IBAction)saveName:(id)sender
{
	[[NSUserDefaults standardUserDefaults] setObject:_nameText.text forKey:NAME_TEXT];
	[self.view endEditing:YES];
}

- (NSString *)loadName
{
	NSString *name = [[NSUserDefaults standardUserDefaults] objectForKey:NAME_TEXT];
	if (name)
		return name;
	return @"Nobody";
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[self saveName:nil];
	[textField resignFirstResponder];
	
	return YES;
}



@end
