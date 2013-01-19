// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WorkoutSet.h instead.

#import <CoreData/CoreData.h>


extern const struct WorkoutSetAttributes {
	__unsafe_unretained NSString *dateRestIsCompleted;
	__unsafe_unretained NSString *dateWorkoutIsCompleted;
	__unsafe_unretained NSString *restTimeInterval;
	__unsafe_unretained NSString *workoutTimeInterval;
} WorkoutSetAttributes;

extern const struct WorkoutSetRelationships {
	__unsafe_unretained NSString *cache;
} WorkoutSetRelationships;

extern const struct WorkoutSetFetchedProperties {
} WorkoutSetFetchedProperties;

@class Cache;






@interface WorkoutSetID : NSManagedObjectID {}
@end

@interface _WorkoutSet : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (WorkoutSetID*)objectID;





@property (nonatomic, strong) NSDate* dateRestIsCompleted;



//- (BOOL)validateDateRestIsCompleted:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* dateWorkoutIsCompleted;



//- (BOOL)validateDateWorkoutIsCompleted:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* restTimeInterval;



@property int16_t restTimeIntervalValue;
- (int16_t)restTimeIntervalValue;
- (void)setRestTimeIntervalValue:(int16_t)value_;

//- (BOOL)validateRestTimeInterval:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* workoutTimeInterval;



@property int16_t workoutTimeIntervalValue;
- (int16_t)workoutTimeIntervalValue;
- (void)setWorkoutTimeIntervalValue:(int16_t)value_;

//- (BOOL)validateWorkoutTimeInterval:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Cache *cache;

//- (BOOL)validateCache:(id*)value_ error:(NSError**)error_;





@end

@interface _WorkoutSet (CoreDataGeneratedAccessors)

@end

@interface _WorkoutSet (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveDateRestIsCompleted;
- (void)setPrimitiveDateRestIsCompleted:(NSDate*)value;




- (NSDate*)primitiveDateWorkoutIsCompleted;
- (void)setPrimitiveDateWorkoutIsCompleted:(NSDate*)value;




- (NSNumber*)primitiveRestTimeInterval;
- (void)setPrimitiveRestTimeInterval:(NSNumber*)value;

- (int16_t)primitiveRestTimeIntervalValue;
- (void)setPrimitiveRestTimeIntervalValue:(int16_t)value_;




- (NSNumber*)primitiveWorkoutTimeInterval;
- (void)setPrimitiveWorkoutTimeInterval:(NSNumber*)value;

- (int16_t)primitiveWorkoutTimeIntervalValue;
- (void)setPrimitiveWorkoutTimeIntervalValue:(int16_t)value_;





- (Cache*)primitiveCache;
- (void)setPrimitiveCache:(Cache*)value;


@end
