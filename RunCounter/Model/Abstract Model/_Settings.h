// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Settings.h instead.

#import <CoreData/CoreData.h>


extern const struct SettingsAttributes {
	__unsafe_unretained NSString *alertSoundName;
	__unsafe_unretained NSString *createdAt;
	__unsafe_unretained NSString *isNotificationsOn;
	__unsafe_unretained NSString *restAlertSoundName;
	__unsafe_unretained NSString *updatedAt;
	__unsafe_unretained NSString *workoutAlertSoundName;
} SettingsAttributes;

extern const struct SettingsRelationships {
} SettingsRelationships;

extern const struct SettingsFetchedProperties {
} SettingsFetchedProperties;









@interface SettingsID : NSManagedObjectID {}
@end

@interface _Settings : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (SettingsID*)objectID;





@property (nonatomic, strong) NSString* alertSoundName;



//- (BOOL)validateAlertSoundName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* createdAt;



//- (BOOL)validateCreatedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* isNotificationsOn;



@property BOOL isNotificationsOnValue;
- (BOOL)isNotificationsOnValue;
- (void)setIsNotificationsOnValue:(BOOL)value_;

//- (BOOL)validateIsNotificationsOn:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* restAlertSoundName;



//- (BOOL)validateRestAlertSoundName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* updatedAt;



//- (BOOL)validateUpdatedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* workoutAlertSoundName;



//- (BOOL)validateWorkoutAlertSoundName:(id*)value_ error:(NSError**)error_;






@end

@interface _Settings (CoreDataGeneratedAccessors)

@end

@interface _Settings (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveAlertSoundName;
- (void)setPrimitiveAlertSoundName:(NSString*)value;




- (NSDate*)primitiveCreatedAt;
- (void)setPrimitiveCreatedAt:(NSDate*)value;




- (NSNumber*)primitiveIsNotificationsOn;
- (void)setPrimitiveIsNotificationsOn:(NSNumber*)value;

- (BOOL)primitiveIsNotificationsOnValue;
- (void)setPrimitiveIsNotificationsOnValue:(BOOL)value_;




- (NSString*)primitiveRestAlertSoundName;
- (void)setPrimitiveRestAlertSoundName:(NSString*)value;




- (NSDate*)primitiveUpdatedAt;
- (void)setPrimitiveUpdatedAt:(NSDate*)value;




- (NSString*)primitiveWorkoutAlertSoundName;
- (void)setPrimitiveWorkoutAlertSoundName:(NSString*)value;




@end
