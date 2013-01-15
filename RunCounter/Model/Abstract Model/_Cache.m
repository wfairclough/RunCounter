// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Cache.m instead.

#import "_Cache.h"

const struct CacheAttributes CacheAttributes = {
	.restMins = @"restMins",
	.sets = @"sets",
	.timeStarted = @"timeStarted",
	.workoutMins = @"workoutMins",
};

const struct CacheRelationships CacheRelationships = {
};

const struct CacheFetchedProperties CacheFetchedProperties = {
};

@implementation CacheID
@end

@implementation _Cache

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Cache" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Cache";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Cache" inManagedObjectContext:moc_];
}

- (CacheID*)objectID {
	return (CacheID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"restMinsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"restMins"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"setsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"sets"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"workoutMinsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"workoutMins"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic restMins;



- (int16_t)restMinsValue {
	NSNumber *result = [self restMins];
	return [result shortValue];
}

- (void)setRestMinsValue:(int16_t)value_ {
	[self setRestMins:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveRestMinsValue {
	NSNumber *result = [self primitiveRestMins];
	return [result shortValue];
}

- (void)setPrimitiveRestMinsValue:(int16_t)value_ {
	[self setPrimitiveRestMins:[NSNumber numberWithShort:value_]];
}





@dynamic sets;



- (int16_t)setsValue {
	NSNumber *result = [self sets];
	return [result shortValue];
}

- (void)setSetsValue:(int16_t)value_ {
	[self setSets:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveSetsValue {
	NSNumber *result = [self primitiveSets];
	return [result shortValue];
}

- (void)setPrimitiveSetsValue:(int16_t)value_ {
	[self setPrimitiveSets:[NSNumber numberWithShort:value_]];
}





@dynamic timeStarted;






@dynamic workoutMins;



- (int16_t)workoutMinsValue {
	NSNumber *result = [self workoutMins];
	return [result shortValue];
}

- (void)setWorkoutMinsValue:(int16_t)value_ {
	[self setWorkoutMins:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveWorkoutMinsValue {
	NSNumber *result = [self primitiveWorkoutMins];
	return [result shortValue];
}

- (void)setPrimitiveWorkoutMinsValue:(int16_t)value_ {
	[self setPrimitiveWorkoutMins:[NSNumber numberWithShort:value_]];
}










@end
