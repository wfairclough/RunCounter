//
//  ViewController.h
//  RunCounter
//
//  Created by Will Fairclough on 2012-09-25.
//  Copyright (c) 2012 Will Fairclough. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cache.h"

#define kWorkoutType @"workout"
#define kRestType @"rest"
#define kAlarmTypeKey @"AlarmType"
#define kAlerySoundNameKey @"AlertSoundName"

@interface CreateWorkoutViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic) NSTimeInterval restTime;
@property (nonatomic) NSTimeInterval workoutTime;
@property (nonatomic, strong) NSNumber *setsNumber;
@property (nonatomic, strong) NSDate *timeStarted;
@property (nonatomic, strong) NSDate *timePaused;

@property (nonatomic, strong) NSArray *setsValues;
@property (nonatomic, strong) NSMutableArray *minsValues;
@property (nonatomic, strong) UILabel *pickerSetsLabel;
@property (nonatomic, strong) UILabel *pickerWorkoutMinsLabel;
@property (nonatomic, strong) UILabel *pickerRestMinsLabel;
@property (nonatomic, strong) IBOutlet UIView *pickerSuperview;
@property (nonatomic, strong) IBOutlet UIPickerView *timePicker;
@property (nonatomic, strong) IBOutlet UIButton *startButton;
@property (nonatomic, strong) IBOutlet UISwitch *notificationSwitch;
@property (nonatomic, strong) IBOutlet UILabel *timeLabel;

@property (nonatomic, strong) NSTimer *pollingTimer;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;

@property (nonatomic, strong) Cache *cache;
@end
