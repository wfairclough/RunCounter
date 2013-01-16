//
//  NSManagedObject+EasyFetching.m
//  RunCounter
//
//  Created by Will Fairclough on 2013-01-15.
//  Copyright (c) 2013 Will Fairclough. All rights reserved.
//

#import "NSManagedObject+EasyFetching.h"

@implementation NSManagedObject (EasyFetching)

+ (NSEntityDescription *)entityDescriptionInContext:(NSManagedObjectContext *)context;
{
    return [self respondsToSelector:@selector(entityInManagedObjectContext:)] ?
    [self performSelector:@selector(entityInManagedObjectContext:) withObject:context] :
    [NSEntityDescription entityForName:NSStringFromClass(self) inManagedObjectContext:context];
}

+ (NSManagedObject *) insertNewEntity
{
    // Must have managedObjectContext public in the AppDelegate for this to work
    NSManagedObjectContext *context = [((id)[[UIApplication sharedApplication] delegate]) managedObjectContext];
    return [self insertNewEntityInContext:context];
}

+ (NSManagedObject *) insertNewEntityInContext:(NSManagedObjectContext *)context
{
    return [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass(self) inManagedObjectContext:context];
}


+ (NSArray *)findAllObjects;
{
    // Must have managedObjectContext public in the AppDelegate for this to work
    NSManagedObjectContext *context = [((id)[[UIApplication sharedApplication] delegate]) managedObjectContext];
    return [self findAllObjectsInContext:context];
}

+ (NSArray *)findAllObjectsInContext:(NSManagedObjectContext *)context;
{
    NSEntityDescription *entity = [self entityDescriptionInContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    NSError *error = nil;
    
    NSArray *results = [context executeFetchRequest:request error:&error];
    
    if (error != nil)
    {
        //handle errors
    }
    
    return results;
}



+ (NSManagedObject *) findFirst
{
    // Must have managedObjectContext public in the AppDelegate for this to work
    NSManagedObjectContext *context = [((id)[[UIApplication sharedApplication] delegate]) managedObjectContext];
    return [self findFirstInContext:context];
}

+ (NSManagedObject *) findFirstInContext:(NSManagedObjectContext *)context
{
    return [self findEndObjectInContext:context ascending:YES];
}

+ (NSManagedObject *) findLast
{
    // Must have managedObjectContext public in the AppDelegate for this to work
    NSManagedObjectContext *context = [((id)[[UIApplication sharedApplication] delegate]) managedObjectContext];
    return [self findLastInContext:context];
}

+ (NSManagedObject *) findLastInContext:(NSManagedObjectContext *)context
{
    return [self findEndObjectInContext:context ascending:NO];
}

/* Private method to find an object and the end of a Fetched Array.
        ascending == YES then FIRST
        ascending == NO then LAST
 */
+ (NSManagedObject *)findEndObjectInContext:(NSManagedObjectContext *)context ascending:(BOOL)ascending
{
    NSEntityDescription *entity = [self entityDescriptionInContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    [request setFetchLimit:1];
    
    NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"createdAt" ascending:ascending];
    [request setSortDescriptors:@[sortDescriptor]];
    
    NSError *error = nil;
    
    NSArray *results = [context executeFetchRequest:request error:&error];
    
    if (error != nil)
    {
        //handle errors
    }
    
    return ([results count] > 0) ? [results objectAtIndex:0] : nil;
}


@end
