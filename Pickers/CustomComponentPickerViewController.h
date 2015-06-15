//
//  CustomComponentPickerViewController.h
//  Pickers
//
//  Created by M on 21.05.15.
//  Copyright (c) 2015 BID8. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ContentViewController.h"

@interface CustomComponentPickerViewController : ContentViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UILabel *winLabel;
@property (weak, nonatomic) IBOutlet UIButton *button;

- (IBAction)spin;

@end
