//
//  SettingsViewController.m
//  RunCounter
//
//  Created by Will Fairclough on 2013-01-20.
//  Copyright (c) 2013 Will Fairclough. All rights reserved.
//

#import "SettingsViewController.h"

@implementation SettingsViewController


- (void)viewDidLoad
{
    [[AppStyle sharedInstance] styleNavigationBar:self.navigationBar];
    
    Settings* settings = (Settings *)[Settings findFirst];
    [self.notificationSwitch setOn:settings.isNotificationsOnValue];
}

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

@end
