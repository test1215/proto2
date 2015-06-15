//
//  ContentViewController.m
//  Pickers
//
//  Created by M on 22.05.15.
//  Copyright (c) 2015 BID8. All rights reserved.
//

#import "ContentViewController.h"

#import "UIColor+ISHexColor.h"

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_configureTopBar];
}

#pragma mark - Private Methods

- (void)p_configureTopBar {
    self.topBarView.backgroundColor = [UIColor ISHexColor_colorFromHexRGB:0x00c3b7];
}

@end
