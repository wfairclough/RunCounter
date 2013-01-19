// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WorkoutSet.m instead.

#import "_WorkoutSet.h"

const struct WorkoutSetAttributes WorkoutSetAttributes = {
	.dateRestIsCompleted = @"dateRestIsCompleted",
	.dateWorkoutIsCompleted = @"dateWorkoutIsCompleted",
	.restTimeInterval = @"restTimeInterval",
	.workoutTimeInterval = @"workoutTimeInterval",
};

const struct WorkoutSetRelationships WorkoutSetRelationships = {
	.cache = @"cache",
};

const struct WorkoutSetFetchedProperties WorkoutSetFetchedProperties = {
};

@implementation WorkoutSetID
@end

@implementation _WorkoutSet

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"WorkoutSet" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"WorkoutSet";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"WorkoutSet" inManagedObjectContext:moc_];
}

- (WorkoutSetID*)objectID {
	return (WorkoutSetID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"restTimeIntervalValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"restTimeInterval"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"workoutTimeIntervalValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"workoutTimeInterval"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic dateRestIsCompleted;






@dynamic dateWorkoutIsCompleted;






@dynamic restTimeInterval;



- (int16_t)restTimeIntervalValue {
	NSNumber *result = [self restTimeInterval];
	return [result shortValue];
}

- (void)setRestTimeIntervalValue:(int16_t)value_ {
	[self setRestTimeInterval:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveRestTimeIntervalValue {
	NSNumber *result = [self primitiveRestTimeInterval];
	return [result shortValue];
}

- (void)setPrimitiveRestTimeIntervalValue:(int16_t)value_ {
	[self setPrimitiveRestTimeInterval:[NSNumber numberWithShort:value_]];
}





@dynamic workoutTimeInterval;



- (int16_t)workoutTimeIntervalValue {
	NSNumber *result = [self workoutTimeInterval];
	return [result shortValue];
}

- (void)setWorkoutTimeIntervalValue:(int16_t)value_ {
	[self setWorkoutTimeInterval:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveWorkoutTimeIntervalValue {
	NSNumber *result = [self primitiveWorkoutTimeInterval];
	return [result shortValue];
}

- (void)setPrimitiveWorkoutTimeIntervalValue:(int16_t)value_ {
	[self setPrimitiveWorkoutTimeInterval:[NSNumber numberWithShort:value_]];
}





@dynamic cache;

	






@end
