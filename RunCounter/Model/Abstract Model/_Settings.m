// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Settings.m instead.

#import "_Settings.h"

const struct SettingsAttributes SettingsAttributes = {
	.alertSoundName = @"alertSoundName",
	.createdAt = @"createdAt",
	.isNotificationsOn = @"isNotificationsOn",
	.updatedAt = @"updatedAt",
};

const struct SettingsRelationships SettingsRelationships = {
};

const struct SettingsFetchedProperties SettingsFetchedProperties = {
};

@implementation SettingsID
@end

@implementation _Settings

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Settings" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Settings";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Settings" inManagedObjectContext:moc_];
}

- (SettingsID*)objectID {
	return (SettingsID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"isNotificationsOnValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"isNotificationsOn"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic alertSoundName;






@dynamic createdAt;






@dynamic isNotificationsOn;



- (BOOL)isNotificationsOnValue {
	NSNumber *result = [self isNotificationsOn];
	return [result boolValue];
}

- (void)setIsNotificationsOnValue:(BOOL)value_ {
	[self setIsNotificationsOn:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveIsNotificationsOnValue {
	NSNumber *result = [self primitiveIsNotificationsOn];
	return [result boolValue];
}

- (void)setPrimitiveIsNotificationsOnValue:(BOOL)value_ {
	[self setPrimitiveIsNotificationsOn:[NSNumber numberWithBool:value_]];
}





@dynamic updatedAt;











@end
