//
//  EndViewController.m
//  WrongOrRight-iPhone
//
//  Created by jesse on 19.11.14.
//  Copyright (c) 2014 j-apps. All rights reserved.
//

#import "EndViewController.h"
#import "AudioPlayer.h"


@interface EndViewController ()

@property (nonatomic, weak) IBOutlet UILabel *endText;
@property (nonatomic, weak) IBOutlet UILabel *heyText;

@end

@implementation EndViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[[AudioPlayer sharedPlayer] playEnd];
	
	NSString *name = [[NSUserDefaults standardUserDefaults] objectForKey:@"NAME_TEXT"];
	if (name)
		_heyText.text = [NSString stringWithFormat:@"Hey %@", name];
	
	_endText.text = [NSString stringWithFormat:@"Congratulations! You got %ld of %ld questions right!", (long)self.score, (long)self.total];
}


@end
