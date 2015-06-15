//
//  CustomComponentPickerViewController.m
//  Pickers
//
//  Created by M on 21.05.15.
//  Copyright (c) 2015 BID8. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>

#import "CustomComponentPickerViewController.h"

@interface CustomComponentPickerViewController ()

@property (nonatomic, strong) NSArray *images;
@property (nonatomic) SystemSoundID winSoundID;
@property (nonatomic) SystemSoundID crunchSoundID;

@end

@implementation CustomComponentPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.images = @[[UIImage imageNamed:@"seven"],
                    [UIImage imageNamed:@"bar"],
                    [UIImage imageNamed:@"crown"],
                    [UIImage imageNamed:@"cherry"],
                    [UIImage imageNamed:@"lemon"],
                    [UIImage imageNamed:@"apple"]];
    
    [self p_configureWinLabel:NO];
}

#pragma mark - IBActions

- (IBAction)spin {
    
    BOOL win = NO;
    NSInteger numInRow = 1;
    NSInteger lastVal = -1;
    
    for (NSUInteger i = 0; i < 5; i++) {
        NSUInteger newValue = arc4random_uniform((uint)self.images.count);
        
        if (newValue == lastVal) {
            numInRow++; // для win нужны три одинаковые подряд
        } else {
            numInRow = 1;
        }
        lastVal = newValue;
        
        [self.picker selectRow:newValue inComponent:i animated:YES];
        [self.picker reloadComponent:i];
        if (numInRow >= 3) {
            win = YES;
        }
    }
    
    if (_crunchSoundID == 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"crunch" ofType:@"wav"];
        NSURL *soundURL = [NSURL fileURLWithPath:path];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &_crunchSoundID);
    }
    AudioServicesPlaySystemSound(_crunchSoundID);
    
    [self p_configureWinLabel:win];
}

#pragma mark - <UIPickerViewDataSource>

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 5;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.images.count;
}

#pragma mark - <UIPickerViewDelegate>

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UIImage *image = self.images[row];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    return imageView;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return ((UIImage *)self.images[0]).size.height;
}

#pragma mark - Private Methods

- (void)p_configureWinLabel:(BOOL)win {
    if (win) {
        [self performSelector:@selector(p_playWinSound) withObject:nil afterDelay:.5];
    } else {
        [self performSelector:@selector(p_showButton) withObject:nil afterDelay:.5];
    }
    self.button.hidden = YES;
    self.winLabel.text =  @" ";
}

- (void)p_showButton {
    self.button.hidden = NO;
}

- (void)p_playWinSound {
    if (_winSoundID == 0) {
        NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"win" withExtension:@"wav"];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &_winSoundID);
    }
    AudioServicesPlaySystemSound(_winSoundID);
    
    self.winLabel.text = @"WINNER!";
    [self performSelector:@selector(p_showButton) withObject:nil afterDelay:1.5];
}

@end
