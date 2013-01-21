//
//  AlertNoisePickerController.h
//  RunCounter
//
//  Created by Will Fairclough on 2013-01-20.
//  Copyright (c) 2013 Will Fairclough. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppStyle.h"
#import "NSManagedObject+EasyFetching.h"
#import "Settings.h"

@interface AlertNoisePickerController : UITableViewController

@property BOOL isWorkoutNoise;

@property (nonatomic, strong) NSIndexPath* selectedIndexPath;
@property (nonatomic, strong) NSString* soundName;

@end
