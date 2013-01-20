//
//  AppDelegate.m
//  RunCounter
//
//  Created by Will Fairclough on 2012-09-25.
//  Copyright (c) 2012 Will Fairclough. All rights reserved.
//

#import "AppDelegate.h"
#import <AudioToolbox/AudioToolbox.h>
#import "CreateWorkoutViewController.h"
#import "NSManagedObject+EasyFetching.h"
#import "Settings.h"
#import "WorkoutSet.h"
#import "SoundPlayer.h"
#import "Cache.h"

#define kMainColorRed 90.0/255.0
#define kMainColorGreen 72.0/255.0
#define kMainColorBlue 157.0/255.0

#define kLightPurple "#5a489d"
#define kDarkPurple "#421252"


@implementation AppDelegate
@synthesize splashImageView;
@synthesize managedObjectContext = __managedObjectContext;
@synthesize managedObjectModel = __managedObjectModel;
@synthesize persistentStoreCoordinator = __persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    
    /* Controllers Initialization */
    UINavigationController *navController = (UINavigationController *)self.window.rootViewController;
    CreateWorkoutViewController *viewController = [navController.storyboard instantiateViewControllerWithIdentifier:@"CreateWorkoutViewController"];
    [navController setViewControllers:@[viewController]];
    
    navController.navigationBar.tintColor = [UIColor colorWithRed:kMainColorRed green:kMainColorGreen blue:kMainColorBlue alpha:1.0];
    [navController.navigationBar setBackgroundImage:[UIImage imageNamed: @"NavBarPattern"] forBarMetrics:UIBarMetricsDefault];
    
    UIImageView* logoView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 6, 120, 36)];
    [logoView setImage:[UIImage imageNamed:@"RunCounterLogoNavBar@2x"]];
    
    [navController.navigationBar addSubview:logoView];
     
    
    /* Splash Screen Initialization */
    self.splashImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screenBounds.size.width, screenBounds.size.height)];

    if (screenBounds.size.height == 568) {
        // iPhone 5 - 4 inch screen
        [self.splashImageView setImage:[UIImage imageNamed:@"Default-568h@2x"]];
    } else {
        // iPhone 4 - 3.5 inch screen
        [self.splashImageView setImage:[UIImage imageNamed:@"Default@2x"]];
    }
    [[navController view] addSubview:self.splashImageView];
    [[navController view] bringSubviewToFront:self.splashImageView];

    
    /* Window setup */
//    self.window.rootViewController = navController;
//    [self.window makeKeyAndVisible];
    [NSNotificationCenter defaultCenter];
    
    
    /* Schedule the fading of the Splash Screen */
    [NSTimer scheduledTimerWithTimeInterval:2.0
                                     target:self
                                   selector:@selector(fadeSplashScreen)
                                   userInfo:nil
                                    repeats:NO];
    
    [self setupSettingsData];
    
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

- (BOOL)application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder
{
    return YES;
}

- (BOOL)application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder
{
    return YES;
}


/**
 * When the application receives a Local notification be sure to play the proper sound for whether it is a RestOver or WorkoutOver sinario 
 */
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    NSLog(@"Did receive Notification \n\n\n %@", notification);
    
    NSString* soundName = [[notification userInfo] valueForKey:kAlerySoundNameKey];
    
    [[SoundPlayer sharedInstance] playSound:soundName];
    
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}



- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil)
    {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error])
        {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}


#pragma mark - Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext
{
    if (__managedObjectContext != nil)
    {
        return __managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil)
    {
        __managedObjectContext = [[NSManagedObjectContext alloc] init];
        [__managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return __managedObjectContext;
}

/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created from the application's model.
 */
- (NSManagedObjectModel *)managedObjectModel
{
    if (__managedObjectModel != nil)
    {
        return __managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"RunCounterSchema" withExtension:@"momd"];
    __managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return __managedObjectModel;
}


/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (__persistentStoreCoordinator != nil)
    {
        return __persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"RunCounter.sqlite"];
    
    NSError *error = nil;
    __persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![__persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
    {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return __persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

/**
 Returns the URL to the application's Documents directory.
 */
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


#pragma mark - Prepopulate Core Data Database Methods

- (void) setupSettingsData
{
    if ([[Settings findAllObjects] count] == 0)
    {
        NSLog(@"No Settings. Initial Setup of Settings.");
        
        Settings* s = (Settings *)[Settings insertNewEntity];
        
        [s setAlertSoundName:@"beed_caf.caf"];
        [s setIsNotificationsOnValue:YES];
        [s setCreatedAt:[NSDate date]];
        [s setWorkoutAlertSoundName:@"Alert3.mp3"];
        [s setRestAlertSoundName:@"Alert2.mp3"];
        
        NSError* error = nil;
        
        [self.managedObjectContext save:&error];
        
        if (error != nil)
        {
            // Error handling
            NSLog(@"Error saving context in - setupSettingsData: %@,   userinfo: %@", error, error.userInfo);
            
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
}

@end
