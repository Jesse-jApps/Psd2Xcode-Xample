//
//  GameViewController.m
//  Psd2Xcode-WrongOrRight
//
//  Created by jesse on 09.11.14.
//  Copyright (c) 2014 j-apps. All rights reserved.
//

#import "GameViewController.h"
#import "Question.h"

#import "AudioPlayer.h"

#import "EndViewController.h"

@interface GameViewController ()

@property (nonatomic, weak) IBOutlet UILabel *questionText;
@property (nonatomic, weak) IBOutlet UIImageView *questionBackground;

@property (nonatomic, weak) IBOutlet UILabel *name;
@property (nonatomic, weak) IBOutlet UILabel *score;
@property (nonatomic, assign) NSInteger scoreCount;
@property (nonatomic, assign) NSInteger questionCount;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) Question *question;
@property (nonatomic, assign) NSInteger time;

@end

@implementation GameViewController

float const TIME_LIMIT = 10.0;
NSString* const FINAL_SEGUE = @"FinalScreen";

- (void)viewDidLoad {
    [super viewDidLoad];
	
	_name.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"NAME_TEXT"];
	
	//Add animation later and delay this action
	[self startGame];
}

- (void)startGame
{
	_scoreCount = 0;
	_questionCount = [_questions count];
	[self updateScore:0];
	[[AudioPlayer sharedPlayer] playMusic];
	[self setRandomQuestion];

}

- (void)updateScore:(NSInteger)newScore
{
	_scoreCount = newScore;
	_score.text = [NSString stringWithFormat:@"%ld/%ld", (long)_scoreCount, (long)_questionCount];
}

- (void)setRandomQuestion
{
	if ([_questions count] == 0) {
		[[AudioPlayer sharedPlayer] stopMusic];
		return [self performSegueWithIdentifier:FINAL_SEGUE sender:self];
	}
	
	_questionBackground.image = [_questionBackground.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	_questionBackground.tintColor = [UIColor whiteColor];
	
	_time = TIME_LIMIT;
	
	NSMutableArray *mutableCopy = [_questions mutableCopy];
	
	NSUInteger randomIndex = arc4random() % [mutableCopy count];
	Question *question = [mutableCopy objectAtIndex:randomIndex];
	
	[mutableCopy removeObject:question];
	
	_question = question;
	_questionText.text = question.question;
	
	_questions = mutableCopy;
	
	[self startTimer];
}

- (void)reduceTime:(NSTimer *)timer
{
	_time = _time - 1;
	_questionText.alpha = _time / TIME_LIMIT;
	if (_time == 0) {
		[timer invalidate];
		timer = nil;
		
		[self animate:YES withCompletion:^(BOOL finished) {
			[self setRandomQuestion];
		}];
	}
}

- (void)animate:(BOOL)wrong withCompletion:(void (^)(BOOL finished))completion
{
	[UIView animateWithDuration:0.3 animations:^{
		_questionBackground.image = [_questionBackground.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
		UIColor *color = [UIColor greenColor];
		if (wrong)
			color = [UIColor redColor];
		_questionBackground.tintColor = color;
	} completion:completion];
}

- (void)startTimer
{
	_timer = [NSTimer scheduledTimerWithTimeInterval:1.0
									 target:self
								   selector:@selector(reduceTime:)
								   userInfo:nil
									repeats:YES];
}

- (void)validateAnswer:(BOOL)answer
{
	[_timer invalidate];
	_timer = nil;
	
	if(_question.wrong == answer) {
		[[AudioPlayer sharedPlayer] playRightSound];
		_scoreCount = _scoreCount + 1;
		[self updateScore:_scoreCount];
	}
	else {
		[[AudioPlayer sharedPlayer] playWrongSound];
	}
	
	[self animate:(_question.wrong != answer) withCompletion:^(BOOL finished) {
		[self setRandomQuestion];
	}];
	
	
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:FINAL_SEGUE]) {
		EndViewController *vc = segue.destinationViewController;
		vc.score = _scoreCount;
		vc.total = _questionCount;
	}
}

- (IBAction)wrong:(id)sender
{
	[self validateAnswer:YES];
}

- (IBAction)right:(id)sender
{
	[self validateAnswer:NO];
}


@end
