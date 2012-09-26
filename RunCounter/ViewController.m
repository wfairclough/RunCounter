//
//  ViewController.m
//  RunCounter
//
//  Created by Will Fairclough on 2012-09-25.
//  Copyright (c) 2012 Will Fairclough. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize timePicker, minsValues, setsValues, pView, pickerSetsLabel, pickerRestMinsLabel, pickerWorkoutMinsLabel;

- (void)viewWillAppear:(BOOL)animated {
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
      
    setsValues = @[@"  1", @"  2", @"  3", @"  4", @"  5", @"  6", @"  7", @"  8", @"  9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20", @"21", @"22", @"23", @"24", @"25"];
    
    minsValues = [[NSMutableArray alloc] initWithCapacity:60];
    
    for (int i = 1; i < 60; i++) {
        NSString *val = [NSString stringWithFormat:@"%d", i];
        
        if (i < 10)
            val = [NSString stringWithFormat:@"  %d", i];
        
        [minsValues addObject:val];
        
        NSLog(@"Values %i: %@", i, val);
    }

    pickerSetsLabel = [[UILabel alloc] initWithFrame:CGRectMake(66, 93, 70, 30)];
    pickerSetsLabel.text = @"set";
    pickerSetsLabel.textColor = [UIColor colorWithRed:74.0/255.0 green:78.0/255.0 blue:95.0/255.0 alpha:1.0];
    pickerSetsLabel.font = [UIFont boldSystemFontOfSize:18];
    pickerSetsLabel.backgroundColor = [UIColor clearColor];
    pickerSetsLabel.shadowColor = [UIColor whiteColor];
    pickerSetsLabel.shadowOffset = CGSizeMake (0,1);
    
    pickerWorkoutMinsLabel = [[UILabel alloc] initWithFrame:CGRectMake(165, 93, 70, 30)];
    pickerWorkoutMinsLabel.text = @"min";
    pickerWorkoutMinsLabel.textColor = [UIColor colorWithRed:74.0/255.0 green:78.0/255.0 blue:95.0/255.0 alpha:1.0];
    pickerWorkoutMinsLabel.font = [UIFont boldSystemFontOfSize:18];
    pickerWorkoutMinsLabel.backgroundColor = [UIColor clearColor];
    pickerWorkoutMinsLabel.shadowColor = [UIColor whiteColor];
    pickerWorkoutMinsLabel.shadowOffset = CGSizeMake (0,1);
    
    pickerRestMinsLabel = [[UILabel alloc] initWithFrame:CGRectMake(265, 93, 70, 30)];
    pickerRestMinsLabel.text = @"min";
    pickerRestMinsLabel.textColor = [UIColor colorWithRed:74.0/255.0 green:78.0/255.0 blue:95.0/255.0 alpha:1.0];
    pickerRestMinsLabel.font = [UIFont boldSystemFontOfSize:18];
    pickerRestMinsLabel.backgroundColor = [UIColor clearColor];
    pickerRestMinsLabel.shadowColor = [UIColor whiteColor];
    pickerRestMinsLabel.shadowOffset = CGSizeMake (0,1);
    
    
    [pView insertSubview:pickerSetsLabel aboveSubview:timePicker];
    [pView insertSubview:pickerRestMinsLabel aboveSubview:timePicker];
    [pView insertSubview:pickerWorkoutMinsLabel aboveSubview:timePicker];
 
    
    [timePicker setDataSource:self];
    [timePicker setDelegate:self];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startTimer:(id)sender
{
    
}

#pragma mark - Data  Source 

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return [setsValues count];
    } else {
        NSLog(@"Count %d", [minsValues count]);
        return [minsValues count];
    }
}

#pragma mark - Delegate

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [[NSAttributedString alloc] initWithString:[setsValues objectAtIndex:row]];
    } else {
        return [[NSAttributedString alloc] initWithString:[minsValues objectAtIndex:row]];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            if (row == 0) {
                pickerSetsLabel.text = @"set";
            } else {
                pickerSetsLabel.text = @"sets";
            }
            break;
        case 1:
            if (row == 0) {
                pickerWorkoutMinsLabel.text = @"min";
            } else {
                pickerWorkoutMinsLabel.text = @"mins";
            }
            break;
        case 2:
            if (row == 0) {
                pickerRestMinsLabel.text = @"min";
            } else {
                pickerRestMinsLabel.text = @"mins";
            }
            break;
            
        default:
            break;
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40.0;
}

/*
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        if (row != 0) {
            return @"sets";
        } else {
            return @"set";
        }
    } else {
        if (row != 0) {
            return @"mins";
        } else {
            return @"min";
        }
    }
}
 */

/*
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    
}
*/

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 100.0;
}




@end
