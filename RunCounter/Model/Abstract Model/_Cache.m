// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Cache.m instead.

#import "_Cache.h"

const struct CacheAttributes CacheAttributes = {
	.createdAt = @"createdAt",
	.eta = @"eta",
	.isActive = @"isActive",
	.restSecs = @"restSecs",
	.sets = @"sets",
	.timePaused = @"timePaused",
	.timeStarted = @"timeStarted",
	.updatedAt = @"updatedAt",
	.workoutSecs = @"workoutSecs",
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
	
	if ([key isEqualToString:@"isActiveValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"isActive"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"restSecsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"restSecs"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"setsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"sets"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"workoutSecsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"workoutSecs"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic createdAt;






@dynamic eta;






@dynamic isActive;



- (BOOL)isActiveValue {
	NSNumber *result = [self isActive];
	return [result boolValue];
}

- (void)setIsActiveValue:(BOOL)value_ {
	[self setIsActive:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveIsActiveValue {
	NSNumber *result = [self primitiveIsActive];
	return [result boolValue];
}

- (void)setPrimitiveIsActiveValue:(BOOL)value_ {
	[self setPrimitiveIsActive:[NSNumber numberWithBool:value_]];
}





@dynamic restSecs;



- (int16_t)restSecsValue {
	NSNumber *result = [self restSecs];
	return [result shortValue];
}

- (void)setRestSecsValue:(int16_t)value_ {
	[self setRestSecs:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveRestSecsValue {
	NSNumber *result = [self primitiveRestSecs];
	return [result shortValue];
}

- (void)setPrimitiveRestSecsValue:(int16_t)value_ {
	[self setPrimitiveRestSecs:[NSNumber numberWithShort:value_]];
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





@dynamic timePaused;






@dynamic timeStarted;






@dynamic updatedAt;






@dynamic workoutSecs;



- (int16_t)workoutSecsValue {
	NSNumber *result = [self workoutSecs];
	return [result shortValue];
}

- (void)setWorkoutSecsValue:(int16_t)value_ {
	[self setWorkoutSecs:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveWorkoutSecsValue {
	NSNumber *result = [self primitiveWorkoutSecs];
	return [result shortValue];
}

- (void)setPrimitiveWorkoutSecsValue:(int16_t)value_ {
	[self setPrimitiveWorkoutSecs:[NSNumber numberWithShort:value_]];
}










@end
