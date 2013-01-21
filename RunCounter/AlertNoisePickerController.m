//
//  AlertNoisePickerController.m
//  RunCounter
//
//  Created by Will Fairclough on 2013-01-20.
//  Copyright (c) 2013 Will Fairclough. All rights reserved.
//

#import "AlertNoisePickerController.h"
#import "SoundPlayer.h"

@interface AlertNoisePickerController ()

@property (nonatomic, strong) NSArray* keysArray;
@property (nonatomic, strong) NSDictionary* soundDictionary;

@end

@implementation AlertNoisePickerController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = NSLocalizedString(@"AlertNoisePickerTitle", @"Title for picking an alert noise");
    
    self.keysArray = @[@"Alert1", @"Alert2", @"Alert3", @"Alert4", @"Alert5", @"Beep"];
    self.soundDictionary = @{[self.keysArray objectAtIndex:0] : @"Alert1.mp3",
                             [self.keysArray objectAtIndex:1] : @"Alert2.mp3",
                             [self.keysArray objectAtIndex:2] : @"Alert3.mp3",
                             [self.keysArray objectAtIndex:3] : @"Alert4.mp3",
                             [self.keysArray objectAtIndex:4] : @"Alert5.mp3",
                             [self.keysArray objectAtIndex:5] : @"beep_caf.caf"};

    /* Determine the selectedIndexPath for the sound name in the DB */
    for (NSString* key in [self.soundDictionary allKeys])
    {
        if ([[self.soundDictionary valueForKey:key] isEqual:self.soundName]) {
            for (int i = 0; i <= [self.keysArray count]; i++) {
                if ([key isEqual:[self.keysArray objectAtIndex:i]])
                {
                    self.selectedIndexPath = [NSIndexPath indexPathForItem:i inSection:0];
                    break;
                }
            }
            break;
        }
    }
    
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AlertNoiseCell"];
    
    /*
     *   If the cell is nil it means no cell was available for reuse and that we should
     *   create a new one.
     */
    if (cell == nil) {
        
        /*
         *   Actually create a new cell (with an identifier so that it can be dequeued).
         */
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"AlertNoiseCell"];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    if ([self.selectedIndexPath isEqual:indexPath])
    {
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    }
    else
    {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    return cell;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return (self.isWorkoutNoise) ? NSLocalizedString(@"WorkoutAlertNoise", @"WorkoutAlertNoise") : NSLocalizedString(@"RestAlertNoise", @"RestAlertNoise");
    }
    
    // nil for no header title
    return nil;
}

- (void) configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.text = [self.keysArray objectAtIndex:indexPath.row];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Uncheck the previous checked row
    if(self.selectedIndexPath)
    {
        UITableViewCell* uncheckCell = [tableView cellForRowAtIndexPath:self.selectedIndexPath];
        uncheckCell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    self.selectedIndexPath = indexPath;
    
    /* Save newly selected sound */
    NSString* soundName = [self.soundDictionary valueForKey:[cell.textLabel text]];
    Settings* settings = (Settings *)[Settings findFirst];
    
    if (self.isWorkoutNoise)
    {
        settings.workoutAlertSoundName = soundName;
    }
    else
    {
        settings.restAlertSoundName = soundName;
    }
    
    NSManagedObjectContext* context = [settings managedObjectContext];
    NSError* error = nil;
    
    if ([context save:&error])
    {
        // Error handling
        NSLog(@"Error saving context in - didSelectRowAtIndexPath: %@,   userinfo: %@", error, error.userInfo);
        
        if ([[[error userInfo] allKeys] containsObject:NSDetailedErrorsKey])
        {
            NSArray* errors = [[error userInfo] objectForKey:NSDetailedErrorsKey];
            for (NSError* e in errors)
            {
                NSLog(@"Userinfo NSDetailedError: %@", e);
            }
        }
    }
    
    /* Play Sound */
    [[SoundPlayer sharedInstance] playSound:soundName];
    
    NSLog(@"Did select row at indexpath: Section - %d   Row - %d", indexPath.section, indexPath.row);
}

@end
