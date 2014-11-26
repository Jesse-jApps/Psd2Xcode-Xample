//
//  AudioPlayer.m
//  WrongOrRight-iPhone
//
//  Created by jesse on 19.11.14.
//  Copyright (c) 2014 j-apps. All rights reserved.
//

#import "AudioPlayer.h"

@implementation AudioPlayer

NSString* const MUSIC_KEY = @"MUSIC_KEY";
NSString* const SOUND_KEY = @"SOUND_KEY";


static AudioPlayer *_sharedPlayer;

+ (instancetype)sharedPlayer
{
	static dispatch_once_t once;
	
	dispatch_once(&once, ^{
		_sharedPlayer = [[self alloc] init];
		
		_sharedPlayer.btnPlayer = [_sharedPlayer loadAudio:@"snd-btn.mp3"];
		_sharedPlayer.endPlayer =[_sharedPlayer loadAudio:@"snd-end.mp3"];
		_sharedPlayer.rightPlayer = [_sharedPlayer loadAudio:@"snd-right.mp3"];
		_sharedPlayer.wrongPlayer = [_sharedPlayer loadAudio:@"snd-wrong.mp3"];
		_sharedPlayer.musicPlayer = [_sharedPlayer loadAudio:@"mus-worloop.mp3"];
		
		if (![[NSUserDefaults standardUserDefaults] objectForKey:MUSIC_KEY])
			_sharedPlayer.musicOn = YES;
		if (![[NSUserDefaults standardUserDefaults] objectForKey:SOUND_KEY])
			_sharedPlayer.soundOn = YES;
		
		_sharedPlayer.musicOn = [[[NSUserDefaults standardUserDefaults] objectForKey:MUSIC_KEY] boolValue];
		_sharedPlayer.soundOn = [[[NSUserDefaults standardUserDefaults] objectForKey:SOUND_KEY] boolValue];
		
		_sharedPlayer.musicPlayer.numberOfLoops = -1;
		
	});
	
	return _sharedPlayer;
}

- (void)setMusicOn:(BOOL)musicOn
{
	_musicOn = musicOn;
	[[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:musicOn] forKey:MUSIC_KEY];
}

- (void)setSoundOn:(BOOL)soundOn
{
	_soundOn = soundOn;
	[[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:soundOn] forKey:SOUND_KEY];
}

- (AVAudioPlayer *)loadAudio:(NSString *)file
{
	NSString *path = [NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath],file];
	NSURL *soundUrl = [NSURL fileURLWithPath:path];
	
	return [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
	
}

- (void)playButtonSound
{
	[_btnPlayer play];
}

- (void)playRightSound
{
	if (_soundOn)
		[_rightPlayer play];
}

- (void)playWrongSound
{
	if (_soundOn)
		[_wrongPlayer play];
}

- (void)playMusic
{
	if (_musicOn)
		[_musicPlayer play];
}

- (void)stopMusic
{
	[_musicPlayer stop];
}

- (void)playEnd
{
	if (_soundOn)
		[_endPlayer play];
}

@end
