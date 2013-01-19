//
//  SoundPlayer.h
//  RunCounter
//
//  Created by Will Fairclough on 2013-01-18.
//  Copyright (c) 2013 Will Fairclough. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface SoundPlayer : NSObject <AVAudioSessionDelegate, AVAudioPlayerDelegate>

@property(nonatomic, strong) NSURL* soundFileURL;
@property(nonatomic, strong) AVAudioPlayer* appSoundPlayer;


+ (SoundPlayer*)sharedInstance;
- (void) playSound:(NSString *)soundName;

@end
