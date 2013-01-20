//
//  SettingsViewController.h
//  RunCounter
//
//  Created by Will Fairclough on 2013-01-20.
//  Copyright (c) 2013 Will Fairclough. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppStyle.h"
#import "NSManagedObject+EasyFetching.h"
#import "Settings.h"

@interface SettingsViewController : UITableViewController

@property (nonatomic, strong) IBOutlet UINavigationBar *navigationBar;
@property (nonatomic, strong) IBOutlet UISwitch *notificationSwitch;


- (IBAction)setNotificationSwitchVal:(UISwitch *)sender;

@end
