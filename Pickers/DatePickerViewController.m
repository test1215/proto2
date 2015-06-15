//
//  DatePickerViewController.m
//  Pickers
//
//  Created by M on 21.05.15.
//  Copyright (c) 2015 BID8. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)buttonPressed:(id)sender;

@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_configureView];
}

#pragma mark - IBActions

- (IBAction)buttonPressed:(id)sender {
    NSDate *date = self.datePicker.date;
    NSString *message = [[NSString alloc] initWithFormat:@"The date and time you selectd is %@", date];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Date and Time Selected"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"That's so true!" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Private Methods

- (void)p_configureView {
    NSDate *now = [NSDate date];
    [self.datePicker setDate:now animated:NO];
}

@end
