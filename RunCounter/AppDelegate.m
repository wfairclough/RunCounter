//
//  AppDelegate.m
//  RunCounter
//
//  Created by Will Fairclough on 2012-09-25.
//  Copyright (c) 2012 Will Fairclough. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

#define kMainColorRed 90.0/255.0
#define kMainColorGreen 72.0/255.0
#define kMainColorBlue 157.0/255.0

@implementation AppDelegate
@synthesize splashImageView, navController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    
    /* Controllers Initialization */
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];

    self.navController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    self.navController.navigationBar.tintColor = [UIColor colorWithRed:kMainColorRed green:kMainColorGreen blue:kMainColorBlue alpha:1.0];
    [self.navController.navigationBar setBackgroundImage:[UIImage imageNamed: @"NavBarPattern"] forBarMetrics:UIBarMetricsDefault];
    
    UIImageView* logoView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 6, 120, 36)];
    [logoView setImage:[UIImage imageNamed:@"RunCounterLogoNavBar@2x"]];
    
    [self.navController.navigationBar addSubview:logoView];
     
    
    /* Splash Screen Initialization */
    self.splashImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screenBounds.size.width, screenBounds.size.height)];

    if (screenBounds.size.height == 568) {
        // iPhone 5 - 4 inch screen
        [self.splashImageView setImage:[UIImage imageNamed:@"Default-568h@2x"]];
    } else {
        // iPhone 4 - 3.5 inch screen
        [self.splashImageView setImage:[UIImage imageNamed:@"Default@2x"]];
    }
    [[self.navController view] addSubview:self.splashImageView];
    [[self.navController view] bringSubviewToFront:self.splashImageView];

    
    /* Window setup */
    self.window.rootViewController = self.navController;
    [self.window makeKeyAndVisible];
    [NSNotificationCenter defaultCenter];
    
    
    /* Schedule the fading of the Splash Screen */
    [NSTimer scheduledTimerWithTimeInterval:2.0
                                     target:self
                                   selector:@selector(fadeSplashScreen)
                                   userInfo:nil
                                    repeats:NO];
    
    return YES;
}

// Fade the splash screen and remove from Superview
- (void) fadeSplashScreen
{
    //now fade out splash image
    [UIView transitionWithView:self.window duration:1.0f options:UIViewAnimationOptionTransitionNone
                                                      animations:^(void){
                                                          self.splashImageView.alpha=0.0f;
                                                      }
                                                      completion:^(BOOL finished){
                                                          [self.splashImageView removeFromSuperview];
                                                      }];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    NSLog(@"Did receive Notification \n\n\n %@", notification);
}

@end
