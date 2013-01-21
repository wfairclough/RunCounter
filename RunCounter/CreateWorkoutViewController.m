//
//  ViewController.m
//  RunCounter
//
//  Created by Will Fairclough on 2012-09-25.
//  Copyright (c) 2012 Will Fairclough. All rights reserved.
//

#import "CreateWorkoutViewController.h"
#import "NSManagedObject+EasyFetching.h"
#import "Settings.h"
#import "WorkoutSet.h"

#define kPollingInterval 1


@interface CreateWorkoutViewController ()

@end

@implementation CreateWorkoutViewController
@synthesize timePicker, minsValues, setsValues, pickerSuperview,
            pickerSetsLabel, pickerRestMinsLabel, pickerWorkoutMinsLabel,
            startButton, timeLabel;
@synthesize pollingTimer, dateFormatter;
@synthesize restTime, workoutTime, setsNumber;
@synthesize timeStarted;
@synthesize timePaused = _timePaused;
@synthesize cache;

//+ (ViewController*) viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder {
//    ViewController* vc;
//    NSString* storyboardName = [coder decodeObjectForKey:UIStateRestorationViewControllerStoryboardKey];
//    UIStoryboard* sb = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
//    if (storyboardName) {
//        vc = (MyViewController*)[sb instantiateViewControllerWithIdentifier:@"MyViewController"];
//        thePush.restorationIdentifier = [identifierComponents lastObject];
//        thePush.restorationClass = [MyViewController class];
//    }
//    return vc;
//}

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        [self initView];
        
    }
    
    return self;
}

/* Called from story */
- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    
    if (self) {
        
        [self initView];
        
    }
    
    return self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Initializations

- (void) initView
{
    //self.title = NSLocalizedString(@"Title", @"The Title for the Main View");
    
    cache = (Cache *)[Cache findLast];
    
    setsValues = @[@"  1", @"  2", @"  3", @"  4", @"  5", @"  6", @"  7", @"  8", @"  9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20", @"21", @"22", @"23", @"24", @"25"];
    
    minsValues = [[NSMutableArray alloc] initWithCapacity:60];
    
    for (int i = 1; i < 60; i++) {
        NSString *val = [NSString stringWithFormat:@"%d", i];
        
        if (i < 10)
            val = [NSString stringWithFormat:@"  %d", i];
        
        [minsValues addObject:val];
    }
    
    setsNumber = [NSNumber numberWithInt:1];
    restTime = 1.0 * 60.0;
    workoutTime = 1.0 * 60.0;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Add backgroun pattern
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-tile"]]];

    dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"mm : ss.S"];
    
    
    /* Setup the Custom Settings button of the navigation bar */
    UIButton *customSettingsButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [customSettingsButton setFrame:CGRectMake(0.0f, 0.0f, 25.0f, 25.0f)];
    [customSettingsButton addTarget:self action:@selector(pressedSettingsButton:) forControlEvents:UIControlEventTouchUpInside];
    [customSettingsButton setImage:[UIImage imageNamed:@"gear@2x"] forState:UIControlStateNormal];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customSettingsButton];
    
    
    /* Setup the Labels for each of the componenets of the Picker View */
    pickerSetsLabel = [[UILabel alloc] initWithFrame:CGRectMake(66, 93, 70, 30)];
    [self initializePickerViewLabel:pickerSetsLabel withText:@"set"];
    
    pickerWorkoutMinsLabel = [[UILabel alloc] initWithFrame:CGRectMake(165, 93, 70, 30)];
    [self initializePickerViewLabel:pickerWorkoutMinsLabel withText:@"min"];
    
    pickerRestMinsLabel = [[UILabel alloc] initWithFrame:CGRectMake(265, 93, 70, 30)];
    [self initializePickerViewLabel:pickerRestMinsLabel withText:@"min"];
    
    [pickerSuperview insertSubview:pickerSetsLabel aboveSubview:timePicker];
    [pickerSuperview insertSubview:pickerRestMinsLabel aboveSubview:timePicker];
    [pickerSuperview insertSubview:pickerWorkoutMinsLabel aboveSubview:timePicker];
    
    [timePicker setDataSource:self];
    [timePicker setDelegate:self];
    
    
    // Setup view based on whether the newest cashe item is Active or not
    if ((cache != nil) && (cache.isActiveValue))
    {
        [self setStartButtonActive:YES];
        
        int setsRow = [[cache sets] integerValue] - 1;
        int workoutRow = ([[cache workoutSecs] integerValue] / 60) - 1;
        int restRow = ([[cache restSecs] integerValue] / 60) - 1 ;
        
        [self.timePicker selectRow:setsRow inComponent:0 animated:YES];
        [self.timePicker selectRow:workoutRow inComponent:1 animated:YES];
        [self.timePicker selectRow:restRow inComponent:2 animated:YES];
        
        if ((setsRow + 1) > 1)
            [pickerSetsLabel setText:@"sets"];
        
        if ((workoutRow + 1) > 1)
            [pickerWorkoutMinsLabel setText:@"mins"];
        
        if ((workoutRow + 1) > 1)
            [pickerRestMinsLabel setText:@"mins"];
        
        [self setupPollingTimer];
    }
    else
    {
        [self setStartButtonActive:NO];
    }
    
}

/**
 Pass a reference to the Label you want initialized for the compenents of the PickerView
*/
- (void) initializePickerViewLabel:(UILabel *)label withText:(NSString *)text
{
    label.text = text;
    label.textColor = [UIColor colorWithRed:74.0/255.0 green:78.0/255.0 blue:95.0/255.0 alpha:1.0];
    label.font = [UIFont boldSystemFontOfSize:18];
    label.backgroundColor = [UIColor clearColor];
    label.shadowColor = [UIColor whiteColor];
    label.shadowOffset = CGSizeMake (0,1);
}

- (void) setupPollingTimer
{
    pollingTimer = [NSTimer scheduledTimerWithTimeInterval:kPollingInterval
                                                    target:self
                                                  selector:@selector(updateTime)
                                                  userInfo:nil
                                                   repeats:YES];
}

- (void) invalidatePollingTimer
{
    [pollingTimer invalidate];
    pollingTimer = nil;
}

- (void)resetPickerview
{
    [self.timePicker selectRow:0 inComponent:0 animated:YES];
    [self.timePicker selectRow:0 inComponent:1 animated:YES];
    [self.timePicker selectRow:0 inComponent:2 animated:YES];
    
    [pickerSetsLabel setText:@"set"];
    [pickerWorkoutMinsLabel setText:@"min"];
    [pickerRestMinsLabel setText:@"min"];
}

- (void)setStartButtonActive:(BOOL)isActive
{
    UIImage *buttonImage;
    UIImage *buttonImageHighlight;
    
    if (isActive)
    {
        buttonImage = [[UIImage imageNamed:@"orangeButton"]
                       resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
        buttonImageHighlight = [[UIImage imageNamed:@"orangeButtonHighlight"]
                                resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
        [startButton setTitle:NSLocalizedString(@"EndWorkout", @"End Workout Title") forState:UIControlStateNormal];
    }
    else
    {
        buttonImage = [[UIImage imageNamed:@"greenButton"]
                       resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
        buttonImageHighlight = [[UIImage imageNamed:@"greenButtonHighlight"]
                                resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
        [startButton setTitle:NSLocalizedString(@"StartWorkout", @"Start Workout Title") forState:UIControlStateNormal];
    }
    
    // Set the background for any states you plan to use
    [startButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [startButton setBackgroundImage:buttonImageHighlight forState:UIControlStateHighlighted];
}

#pragma mark - Actions

- (IBAction)pressedSettingsButton:(id)sender
{
    [self performSegueWithIdentifier:@"ModalSettingsSegue" sender:self];
}


- (IBAction)startTimer:(UIButton *)sender
{
    UIApplication* app = [UIApplication sharedApplication];
    
    NSArray* oldNotifications = [app scheduledLocalNotifications];
    
    // Clear out the old notification before scheduling a new one.
    if ([oldNotifications count] > 0) {
        for (int i = 0; i < [oldNotifications count]; i++) {
            NSLog(@"%@", [oldNotifications objectAtIndex:i]);
        }
        
        [app cancelAllLocalNotifications];
        
    }

    
    if ((cache != nil) && (cache.isActiveValue))
    {
        NSDate* date = [NSDate date];
        
        [cache setIsActiveValue:NO];
        [cache setTimePaused:date];
        [cache setUpdatedAt:date];
        
        [self setStartButtonActive:NO];
        
        [self resetPickerview];
        
        [self invalidatePollingTimer];
        
    }
    else
    {
        Settings* settings = (Settings *)[Settings findFirst];
        
        cache = (Cache*)[Cache insertNewEntity];
        [cache setCreatedAt:[NSDate date]];
        [cache setSets:setsNumber];
        [cache setWorkoutSecs:[NSNumber numberWithDouble:workoutTime]];
        [cache setRestSecs:[NSNumber numberWithDouble:restTime]];
        [cache setIsActiveValue:YES];
        
        NSTimeInterval eta = (([setsNumber intValue] * workoutTime) + ([setsNumber intValue] * restTime)) - restTime;
        
        [cache setEta:[NSDate dateWithTimeIntervalSinceNow:eta]];
        
        [self setStartButtonActive:YES];
        
        
        [self setupPollingTimer];
        
        
        // Create Local Notifications for all Workout and Rest end times.
        for (int setNum = 1; setNum <= [setsNumber intValue]; setNum++) {
            
            WorkoutSet* wSet = (WorkoutSet *)[WorkoutSet insertNewEntity];
            [wSet setCache:cache];
            
            // Create a new workout notification.
            UILocalNotification* workoutOverAlarm = [[UILocalNotification alloc] init];
            if (workoutOverAlarm)
            {
                
                NSTimeInterval workoutTimeIntervalFirst = setNum * workoutTime;
                NSTimeInterval workoutTimeInterval = (setNum * (restTime + workoutTime)) - restTime;
                
                NSDate* theDate;
                if (setNum == 1) {
                    theDate = [[NSDate alloc] initWithTimeIntervalSinceNow:workoutTimeIntervalFirst];
                    [wSet setWorkoutTimeInterval:[NSNumber numberWithDouble:workoutTimeIntervalFirst]];
                } else {
                    theDate = [[NSDate alloc] initWithTimeIntervalSinceNow:workoutTimeInterval];
                    [wSet setWorkoutTimeInterval:[NSNumber numberWithDouble:workoutTimeInterval]];
                }
                [wSet setDateWorkoutIsCompleted:theDate];
                
                
                NSLog(@"WorkoutOverTime: %@  Set: %d", theDate, setNum);
                
                workoutOverAlarm.fireDate = theDate;
                workoutOverAlarm.timeZone = [NSTimeZone defaultTimeZone];
                workoutOverAlarm.soundName = [settings workoutAlertSoundName];
                NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:@[kWorkoutType, [settings workoutAlertSoundName]] forKeys:@[kAlarmTypeKey, kAlerySoundNameKey]];
                workoutOverAlarm.userInfo = userInfo;
                
                
                NSString* restString;
                
                if (setNum != [setsNumber intValue]) {
                    restString = [NSString stringWithFormat:@"Set %d: Time to take a break for %d min", setNum, (int)(restTime/60.0)];
                } else {
                    restString = [NSString stringWithFormat:@"Workout Complete! Great Job!"];
                }
                
                workoutOverAlarm.alertBody = restString;
                
                [app scheduleLocalNotification:workoutOverAlarm];
            }
            
            
            // Create a new rest notification if it is not the last one.
            if (setNum != [setsNumber intValue])
            {
                UILocalNotification* restOverAlarm = [[UILocalNotification alloc] init];
                if (restOverAlarm)
                {
                    NSTimeInterval restTimeInterval = (setNum * (restTime + workoutTime));

                    NSDate* theDate = [[NSDate alloc] initWithTimeIntervalSinceNow:restTimeInterval];

                    [wSet setRestTimeInterval:[NSNumber numberWithDouble:restTimeInterval]];
                    [wSet setDateRestIsCompleted:theDate];
                    
                    NSLog(@"RestOverTime: %@  Set: %d", theDate, setNum);
                    
                    restOverAlarm.fireDate = theDate;
                    restOverAlarm.timeZone = [NSTimeZone defaultTimeZone];
                    restOverAlarm.soundName = [settings restAlertSoundName];
                    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:@[kRestType, [settings restAlertSoundName]] forKeys:@[kAlarmTypeKey, kAlerySoundNameKey]];
                    restOverAlarm.userInfo = userInfo;
                    
                    NSString* workoutString = [NSString stringWithFormat:@"Set %d complete! Time to start set %d for %d min", setNum, (setNum + 1), (int)(workoutTime/60)];
                    
                    restOverAlarm.alertBody = workoutString;
                    
                    [app scheduleLocalNotification:restOverAlarm];
                }
            }
            
        }
        
    }
    
    NSManagedObjectContext* context = [cache managedObjectContext];

    NSError* error = nil;
    
    [context save:&error];
    
    if (error != nil)
    {
        // Error handling
        NSLog(@"Error saving context in - startTimer: %@,   userinfo: %@", error, error.userInfo);
        
        if ([[[error userInfo] allKeys] containsObject:NSDetailedErrorsKey])
        {
            NSArray* errors = [[error userInfo] objectForKey:NSDetailedErrorsKey];
            for (NSError* e in errors)
            {
                NSLog(@"Userinfo NSDetailedError: %@", e);
            }
        }
    }
    
}

- (void) updateTime
{
    NSTimeInterval timeLeft = [[cache eta] timeIntervalSinceDate:[NSDate date]];
    
    if (timeLeft <= 0)
    {
        timeLeft = 0.0;
        [self invalidatePollingTimer];
        [self setStartButtonActive:NO];
        [self resetPickerview];
    }
    
    self.timeLabel.text = [NSString stringWithFormat:@"Secs Left: %.0f", timeLeft];
}

#pragma mark - Data  Source 

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return [setsValues count];
    } else {
        return [minsValues count];
    }
}

#pragma mark - Delegate

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [[NSAttributedString alloc] initWithString:[setsValues objectAtIndex:row]];
    } else {
        return [[NSAttributedString alloc] initWithString:[minsValues objectAtIndex:row]];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            setsNumber = [NSNumber numberWithInt:(row + 1)];
            if (row == 0) {
                pickerSetsLabel.text = @"set";
            } else {
                pickerSetsLabel.text = @"sets";
            }
            break;
        case 1:
            workoutTime = ((double)(row + 1)) * 60.0;
            if (row == 0) {
                pickerWorkoutMinsLabel.text = @"min";
            } else {
                pickerWorkoutMinsLabel.text = @"mins";
            }
            break;
        case 2:
            restTime = ((double)(row + 1)) * 60.0;
            if (row == 0) {
                pickerRestMinsLabel.text = @"min";
            } else {
                pickerRestMinsLabel.text = @"mins";
            }
            break;
            
        default:
            break;
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40.0;
}

/*
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        if (row != 0) {
            return @"sets";
        } else {
            return @"set";
        }
    } else {
        if (row != 0) {
            return @"mins";
        } else {
            return @"min";
        }
    }
}
 */

/*
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    
}
*/

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 100.0;
}



@end
