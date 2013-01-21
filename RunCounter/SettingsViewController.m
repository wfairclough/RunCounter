//
//  SettingsViewController.m
//  RunCounter
//
//  Created by Will Fairclough on 2013-01-20.
//  Copyright (c) 2013 Will Fairclough. All rights reserved.
//

#import "SettingsViewController.h"
#import "AlertNoisePickerController.h"

#define kTableViewLocalNotificationsSection 0
#define kTableViewAlertNoisesSection 1

@implementation SettingsViewController

- (SettingsViewController *)init
{
    if (self)
    {
        self = [super init];
    }
    
    return self;
}

# pragma mark - Initializations

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"SettingsTitle", @"Settings title");
    
    [[AppStyle sharedInstance] styleNavigationBar:self.navigationController.navigationBar];
    
    /* Setup Done button for SettingsViewController */
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                    style:UIBarButtonSystemItemDone
                                                                   target:self
                                                                   action:@selector(pressedCloseButton:)];
    
//    UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:@"Settings"];
//    item.rightBarButtonItem = rightButton;
//    item.hidesBackButton = YES;

    self.navigationItem.rightBarButtonItem = rightButton;
    
//    [self.navigationBar pushNavigationItem:item animated:NO];


    
    Settings* settings = (Settings *)[Settings findFirst];
    [self.notificationSwitch setOn:settings.isNotificationsOnValue];

}


#pragma mark - Actions

- (IBAction)setNotificationSwitchVal:(UISwitch *)sender
{
    Settings* settings = (Settings *)[Settings findFirst];
    [settings setUpdatedAt:[NSDate date]];
    [settings setIsNotificationsOnValue:sender.isOn];
    
    NSManagedObjectContext* context = [settings managedObjectContext];
    
    NSError* error = nil;
    
    [context save:&error];
    
    if (error != nil)
    {
        // Error handling
        NSLog(@"Error saving context in - setNotificationSwitchVal: %@,   userinfo: %@", error, error.userInfo);
        
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

- (IBAction)pressedCloseButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table View Delegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == kTableViewAlertNoisesSection)
    {
        [self performSegueWithIdentifier:@"PushAlertNoiseSegue" sender:indexPath];
    }
    
    NSLog(@"Did select row at indexpath: Section - %d   Row - %d", indexPath.section, indexPath.row);
}


#pragma mark - Storyboard Segues

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PushAlertNoiseSegue"])
    {
        Settings* settings = (Settings *)[Settings findFirst];
        NSString* workoutSoundName = settings.workoutAlertSoundName;
        NSString* restSoundName = settings.restAlertSoundName;
        
        ((AlertNoisePickerController *)segue.destinationViewController).isWorkoutNoise = (((NSIndexPath *)sender).row == 0);
        ((AlertNoisePickerController *)segue.destinationViewController).soundName = (((NSIndexPath *)sender).row == 0) ? workoutSoundName : restSoundName;
    }
}


@end
