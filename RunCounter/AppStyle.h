//
//  AppStyle.h
//  RunCounter
//
//  Created by Will Fairclough on 2013-01-20.
//  Copyright (c) 2013 Will Fairclough. All rights reserved.
//

#import <Foundation/Foundation.h>


#define kMainColorRed 90.0/255.0
#define kMainColorGreen 72.0/255.0
#define kMainColorBlue 157.0/255.0

#define kLightPurple "#5a489d"
#define kDarkPurple "#421252"

@interface AppStyle : NSObject

+ (AppStyle*)sharedInstance;

- (void)styleNavigationBar:(UINavigationBar *)navBar withAppNameImage:(BOOL)useAppNameImage;
- (void)styleNavigationBar:(UINavigationBar *)navBar;

@end
