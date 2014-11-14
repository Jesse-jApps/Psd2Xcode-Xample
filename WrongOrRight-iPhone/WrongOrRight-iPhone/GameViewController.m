//
//  GameViewController.m
//  Psd2Xcode-WrongOrRight
//
//  Created by jesse on 09.11.14.
//  Copyright (c) 2014 j-apps. All rights reserved.
//

#import "GameViewController.h"

#import "Question.h"

@interface GameViewController ()

@property (nonatomic, weak) IBOutlet UITextField *questionText;

@property (nonatomic, strong) Question *question;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	//Add animation later and delay this action
	[self startGame];
}

- (void)startGame
{
	
}

- (void)setRandomQuestion
{
	NSMutableArray *mutableCopy = [_questions mutableCopy];
	
	NSUInteger randomIndex = arc4random() % [mutableCopy count];
	Question *question = [mutableCopy objectAtIndex:randomIndex];
	
	[mutableCopy removeObject:question];
	
	_question = question;
	_questionText.text = question.question;
	
	_questions = mutableCopy;
}

- (BOOL)validateAnswer:(BOOL)answer
{
	return _question.wrong == answer;
}

- (IBAction)wrong:(id)sender
{
	if ([self validateAnswer:YES]) {
		
	}
}

- (IBAction)right:(id)sender
{
	if ([self validateAnswer:NO]) {
		
	}
}


@end
