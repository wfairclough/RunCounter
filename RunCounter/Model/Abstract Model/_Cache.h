// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Cache.h instead.

#import <CoreData/CoreData.h>


extern const struct CacheAttributes {
	__unsafe_unretained NSString *restMins;
	__unsafe_unretained NSString *sets;
	__unsafe_unretained NSString *timeStarted;
	__unsafe_unretained NSString *workoutMins;
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





@property (nonatomic, strong) NSNumber* restMins;



@property int16_t restMinsValue;
- (int16_t)restMinsValue;
- (void)setRestMinsValue:(int16_t)value_;

//- (BOOL)validateRestMins:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* sets;



@property int16_t setsValue;
- (int16_t)setsValue;
- (void)setSetsValue:(int16_t)value_;

//- (BOOL)validateSets:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* timeStarted;



//- (BOOL)validateTimeStarted:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* workoutMins;



@property int16_t workoutMinsValue;
- (int16_t)workoutMinsValue;
- (void)setWorkoutMinsValue:(int16_t)value_;

//- (BOOL)validateWorkoutMins:(id*)value_ error:(NSError**)error_;






@end

@interface _Cache (CoreDataGeneratedAccessors)

@end

@interface _Cache (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveRestMins;
- (void)setPrimitiveRestMins:(NSNumber*)value;

- (int16_t)primitiveRestMinsValue;
- (void)setPrimitiveRestMinsValue:(int16_t)value_;




- (NSNumber*)primitiveSets;
- (void)setPrimitiveSets:(NSNumber*)value;

- (int16_t)primitiveSetsValue;
- (void)setPrimitiveSetsValue:(int16_t)value_;




- (NSDate*)primitiveTimeStarted;
- (void)setPrimitiveTimeStarted:(NSDate*)value;




- (NSNumber*)primitiveWorkoutMins;
- (void)setPrimitiveWorkoutMins:(NSNumber*)value;

- (int16_t)primitiveWorkoutMinsValue;
- (void)setPrimitiveWorkoutMinsValue:(int16_t)value_;




@end
