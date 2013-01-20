//
//  SettingsViewController.m
//  RunCounter
//
//  Created by Will Fairclough on 2013-01-20.
//  Copyright (c) 2013 Will Fairclough. All rights reserved.
//

#import "SettingsViewController.h"

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
    [[AppStyle sharedInstance] styleNavigationBar:self.navigationBar];
    
    /* Setup Done button for SettingsViewController */
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                    style:UIBarButtonSystemItemDone
                                                                   target:self
                                                                   action:@selector(pressedCloseButton:)];
    
    UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:@"Settings"];
    item.rightBarButtonItem = rightButton;
    item.hidesBackButton = YES;
    [self.navigationBar pushNavigationItem:item animated:NO];


    
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


@end
