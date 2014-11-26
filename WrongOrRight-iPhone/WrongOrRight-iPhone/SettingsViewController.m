//
//  SettingsViewController.m
//  WrongOrRight-iPhone
//
//  Created by jesse on 19.11.14.
//  Copyright (c) 2014 j-apps. All rights reserved.
//

#import "SettingsViewController.h"

#import "AudioPlayer.h"

@interface SettingsViewController ()

@property (nonatomic, weak) IBOutlet UIButton *musicControll;
@property (nonatomic, weak) IBOutlet UIButton *soundControll;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	_musicControll.selected = [AudioPlayer sharedPlayer].musicOn;
	_soundControll.selected = [AudioPlayer sharedPlayer].soundOn;
}

- (IBAction)triggerMusicControll:(UIButton *)sender
{
	sender.selected = !sender.selected;
	
	[AudioPlayer sharedPlayer].musicOn = sender.selected;
	[[AudioPlayer sharedPlayer] playButtonSound];
	
}

- (IBAction)triggerSoundControll:(UIButton *)sender
{
	sender.selected = !sender.selected;
	
	[AudioPlayer sharedPlayer].soundOn = sender.selected;
	[[AudioPlayer sharedPlayer] playButtonSound];
	
}

@end
