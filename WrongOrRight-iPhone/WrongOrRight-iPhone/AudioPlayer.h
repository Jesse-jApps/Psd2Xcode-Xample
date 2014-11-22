//
//  AudioPlayer.h
//  WrongOrRight-iPhone
//
//  Created by jesse on 19.11.14.
//  Copyright (c) 2014 j-apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>


@interface AudioPlayer : NSObject
@property(nonatomic, strong) AVAudioPlayer *btnPlayer;
@property(nonatomic, strong) AVAudioPlayer *wrongPlayer;
@property(nonatomic, strong) AVAudioPlayer *rightPlayer;
@property(nonatomic, strong) AVAudioPlayer *musicPlayer;
@property(nonatomic, strong) AVAudioPlayer *endPlayer;

@property (nonatomic, assign) BOOL soundOn;
@property (nonatomic, assign) BOOL musicOn;


+ (instancetype)sharedPlayer;

- (void)playButtonSound;

- (void)playRightSound;

- (void)playWrongSound;

- (void)playMusic;
- (void)stopMusic;

- (void)playEnd;


@end
