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
	[[AudioPlayer sharedPlayer] playButtonSound];
	
	sender.selected = !sender.selected;
	
	[AudioPlayer sharedPlayer].musicOn = sender.selected;
}

- (IBAction)triggerSoundControll:(UIButton *)sender
{
	[[AudioPlayer sharedPlayer] playButtonSound];
	
	sender.selected = !sender.selected;
	
	[AudioPlayer sharedPlayer].soundOn = sender.selected;
}

- (IBAction)openJapps:(id)sender
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.j-apps.com"]];

}


@end
