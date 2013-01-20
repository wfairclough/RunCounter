//
//  AppStyle.m
//  RunCounter
//
//  Created by Will Fairclough on 2013-01-20.
//  Copyright (c) 2013 Will Fairclough. All rights reserved.
//

#import "AppStyle.h"

@implementation AppStyle


static AppStyle *instance;

+ (AppStyle*)sharedInstance
{
    @synchronized(self)
    {
        if (instance == nil) {
            instance = [[AppStyle alloc] init];
        }
    }
    
    return instance;
}


- (void)styleNavigationBar:(UINavigationBar *)navBar withAppNameImage:(BOOL)useAppNameImage
{
    navBar.tintColor = [UIColor colorWithRed:kMainColorRed green:kMainColorGreen blue:kMainColorBlue alpha:1.0];
    [navBar setBackgroundImage:[UIImage imageNamed: @"NavBarPattern"] forBarMetrics:UIBarMetricsDefault];
    
    if (useAppNameImage)
    {
        UIImageView* logoView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 6, 120, 36)];
        [logoView setImage:[UIImage imageNamed:@"RunCounterLogoNavBar@2x"]];
        
        [navBar addSubview:logoView];
    }
    
}

- (void)styleNavigationBar:(UINavigationBar *)navBar
{
    [self styleNavigationBar:navBar withAppNameImage:NO];
}

@end
