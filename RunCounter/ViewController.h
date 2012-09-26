//
//  ViewController.h
//  RunCounter
//
//  Created by Will Fairclough on 2012-09-25.
//  Copyright (c) 2012 Will Fairclough. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) NSArray *setsValues;
@property (nonatomic, strong) NSMutableArray *minsValues;
@property (nonatomic, strong) UILabel *pickerSetsLabel;
@property (nonatomic, strong) UILabel *pickerWorkoutMinsLabel;
@property (nonatomic, strong) UILabel *pickerRestMinsLabel;
@property (nonatomic, strong) IBOutlet UIView *pView;
@property (nonatomic, strong) IBOutlet UIPickerView *timePicker;

- (IBAction)startTimer:(id)sender;

@end
