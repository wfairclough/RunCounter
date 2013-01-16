// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Cache.h instead.

#import <CoreData/CoreData.h>


extern const struct CacheAttributes {
	__unsafe_unretained NSString *createdAt;
	__unsafe_unretained NSString *eta;
	__unsafe_unretained NSString *isActive;
	__unsafe_unretained NSString *restSecs;
	__unsafe_unretained NSString *sets;
	__unsafe_unretained NSString *timePaused;
	__unsafe_unretained NSString *timeStarted;
	__unsafe_unretained NSString *updatedAt;
	__unsafe_unretained NSString *workoutSecs;
} CacheAttributes;

extern const struct CacheRelationships {
} CacheRelationships;

extern const struct CacheFetchedProperties {
} CacheFetchedProperties;












@interface CacheID : NSManagedObjectID {}
@end

@interface _Cache : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (CacheID*)objectID;





@property (nonatomic, strong) NSDate* createdAt;



//- (BOOL)validateCreatedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* eta;



//- (BOOL)validateEta:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* isActive;



@property BOOL isActiveValue;
- (BOOL)isActiveValue;
- (void)setIsActiveValue:(BOOL)value_;

//- (BOOL)validateIsActive:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* restSecs;



@property int16_t restSecsValue;
- (int16_t)restSecsValue;
- (void)setRestSecsValue:(int16_t)value_;

//- (BOOL)validateRestSecs:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* sets;



@property int16_t setsValue;
- (int16_t)setsValue;
- (void)setSetsValue:(int16_t)value_;

//- (BOOL)validateSets:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* timePaused;



//- (BOOL)validateTimePaused:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* timeStarted;



//- (BOOL)validateTimeStarted:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* updatedAt;



//- (BOOL)validateUpdatedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* workoutSecs;



@property int16_t workoutSecsValue;
- (int16_t)workoutSecsValue;
- (void)setWorkoutSecsValue:(int16_t)value_;

//- (BOOL)validateWorkoutSecs:(id*)value_ error:(NSError**)error_;






@end

@interface _Cache (CoreDataGeneratedAccessors)

@end

@interface _Cache (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveCreatedAt;
- (void)setPrimitiveCreatedAt:(NSDate*)value;




- (NSDate*)primitiveEta;
- (void)setPrimitiveEta:(NSDate*)value;




- (NSNumber*)primitiveIsActive;
- (void)setPrimitiveIsActive:(NSNumber*)value;

- (BOOL)primitiveIsActiveValue;
- (void)setPrimitiveIsActiveValue:(BOOL)value_;




- (NSNumber*)primitiveRestSecs;
- (void)setPrimitiveRestSecs:(NSNumber*)value;

- (int16_t)primitiveRestSecsValue;
- (void)setPrimitiveRestSecsValue:(int16_t)value_;




- (NSNumber*)primitiveSets;
- (void)setPrimitiveSets:(NSNumber*)value;

- (int16_t)primitiveSetsValue;
- (void)setPrimitiveSetsValue:(int16_t)value_;




- (NSDate*)primitiveTimePaused;
- (void)setPrimitiveTimePaused:(NSDate*)value;




- (NSDate*)primitiveTimeStarted;
- (void)setPrimitiveTimeStarted:(NSDate*)value;




- (NSDate*)primitiveUpdatedAt;
- (void)setPrimitiveUpdatedAt:(NSDate*)value;




- (NSNumber*)primitiveWorkoutSecs;
- (void)setPrimitiveWorkoutSecs:(NSNumber*)value;

- (int16_t)primitiveWorkoutSecsValue;
- (void)setPrimitiveWorkoutSecsValue:(int16_t)value_;




@end
