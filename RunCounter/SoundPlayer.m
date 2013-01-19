//
//  SoundPlayer.m
//  RunCounter
//
//  Created by Will Fairclough on 2013-01-18.
//  Copyright (c) 2013 Will Fairclough. All rights reserved.
//

#import "SoundPlayer.h"

@implementation SoundPlayer
@synthesize soundFileURL, appSoundPlayer;

static SoundPlayer *instance;

+ (SoundPlayer*)sharedInstance
{
    @synchronized(self)
    {
        if (instance == nil) {
            instance = [[SoundPlayer alloc] init];
        }
    }
    
    return instance;
}

#pragma mark -
    #pragma mark *play*
- (void) playSound:(NSString *)soundName
{
    //beep_caf
    NSArray *soundNameTokens = [soundName componentsSeparatedByString:@"."];
    
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:[soundNameTokens objectAtIndex:0] ofType:[soundNameTokens objectAtIndex:1]];

    if (soundFilePath == nil)
    {
        NSLog(@"Sound file is nil");
        return;
    }
    
    NSURL *newURL = [[NSURL alloc] initFileURLWithPath: soundFilePath];
    self.soundFileURL = newURL;

    [[AVAudioSession sharedInstance] setDelegate: self];
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryAmbient error: nil];
    
    // Registers the audio route change listener callback function
    AudioSessionAddPropertyListener (
                                     kAudioSessionProperty_AudioRouteChange,
                                     audioRouteChangeListenerCallback,
                                     (__bridge void *)(self)
                                     );
    
    // Activates the audio session.
    
    NSError *activationError = nil;
    [[AVAudioSession sharedInstance] setActive: YES error: &activationError];
    
    AVAudioPlayer *newPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: soundFileURL error: nil];
    self.appSoundPlayer = newPlayer;

    [appSoundPlayer prepareToPlay];
    [appSoundPlayer setVolume: 1.0];
    [appSoundPlayer setDelegate: self];
    [appSoundPlayer play];
    
    
//    [stopbutton setEnabled:YES];
//    [playbutton setEnabled: NO];
//    playbutton.hidden=YES;
//    pausebutton.hidden =NO;
}//playbutton touch up inside

#pragma mark -
#pragma mark *pause*
-(IBAction)pauseaction
{
    [appSoundPlayer pause];
//    pausebutton.hidden = YES;
//    resumebutton.hidden = NO;
    
}//pausebutton touch up inside

#pragma mark -
#pragma mark *resume*
-(IBAction)resumeaction{
    [appSoundPlayer prepareToPlay];
    [appSoundPlayer setVolume:1.0];
    [appSoundPlayer setDelegate: self];
    [appSoundPlayer play];
//    playbutton.hidden=YES;
//    resumebutton.hidden =YES;
//    pausebutton.hidden = NO;
    
}//resumebutton touch up inside

#pragma mark -
#pragma mark *stop*
-(IBAction)stopaction{
    
    [appSoundPlayer stop];
//    [playbutton setEnabled:YES];
//    [stopbutton setEnabled:NO];
//    playbutton.hidden=NO;
//    resumebutton.hidden =YES;
//    pausebutton.hidden = YES;
    
}//stopbutton touch up inside


void audioRouteChangeListenerCallback (void *inUserData, AudioSessionPropertyID inPropertyID, UInt32 inPropertyValueSize, const void *inPropertyValue ) {
    // ensure that this callback was invoked for a route change
    if (inPropertyID != kAudioSessionProperty_AudioRouteChange) return;
    
    
    {
        // Determines the reason for the route change, to ensure that it is not
        //      because of a category change.
        CFDictionaryRef routeChangeDictionary = (CFDictionaryRef)inPropertyValue;
        
        CFNumberRef routeChangeReasonRef = (CFNumberRef)CFDictionaryGetValue (routeChangeDictionary, CFSTR (kAudioSession_AudioRouteChangeKey_Reason) );
        SInt32 routeChangeReason;
        CFNumberGetValue (routeChangeReasonRef, kCFNumberSInt32Type, &routeChangeReason);
        
        if (routeChangeReason == kAudioSessionRouteChangeReason_OldDeviceUnavailable) {
            
            //Handle Headset Unplugged
        } else if (routeChangeReason == kAudioSessionRouteChangeReason_NewDeviceAvailable) {
            //Handle Headset plugged in
        }
        
    }
}
@end
