//
//  LevelViewController.m
//  Psd2Xcode-WrongOrRight
//
//  Created by jesse on 09.11.14.
//  Copyright (c) 2014 j-apps. All rights reserved.
//

#import "LevelViewController.h"
#import "GameViewController.h"

#import "Question.h"

@interface LevelViewController ()


@end

@implementation LevelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	NSArray *questions = [Question loadQuestionsForLevel:segue.identifier];
	if (questions) {
		GameViewController *vc = segue.destinationViewController;
		vc.questions = questions;
	}
		
}

@end
