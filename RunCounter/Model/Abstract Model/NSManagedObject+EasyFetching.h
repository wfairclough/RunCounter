//
//  NSManagedObject+EasyFetching.h
//  RunCounter
//
//  Created by Will Fairclough on 2013-01-15.
//  Copyright (c) 2013 Will Fairclough. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (EasyFetching)

+ (NSEntityDescription *) entityDescriptionInContext:(NSManagedObjectContext *)context;

+ (NSManagedObject *) insertNewEntity; // Uses the deafult ManagedObjectContext from AppDelegate
+ (NSManagedObject *) insertNewEntityInContext:(NSManagedObjectContext *)context;

+ (NSArray *) findAllObjects; // Uses the deafult ManagedObjectContext from AppDelegate
+ (NSArray *) findAllObjectsInContext:(NSManagedObjectContext *)context;

+ (NSManagedObject *) findFirst; // Uses the deafult ManagedObjectContext from AppDelegate
+ (NSManagedObject *) findFirstInContext:(NSManagedObjectContext *)context;

+ (NSManagedObject *) findLast; // Uses the deafult ManagedObjectContext from AppDelegate
+ (NSManagedObject *) findLastInContext:(NSManagedObjectContext *)context;

@end
