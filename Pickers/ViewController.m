//
//  ViewController.m
//  Pickers
//
//  Created by M on 21.05.15.
//  Copyright (c) 2015 BID8. All rights reserved.
//

#import "ViewController.h"

#import "AppDelegate.h"

#import "UIColor+ISHexColor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_configureStatusBar];
    [self p_configureTabBar];
}

#pragma mark - Private Methods

- (void)p_configureStatusBar {
    // status bar background #00c3b7
    
    // http://stackoverflow.com/a/21044718/4205475
    
    UIView *statusBarAreaView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
    statusBarAreaView.backgroundColor = [UIColor ISHexColor_colorFromHexRGB:0x00c3b7];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.window.rootViewController.view addSubview:statusBarAreaView];
    
    // Set the UIViewControllerBasedStatusBarAppearance (View controller-based status bar appearance) to NO in the .plist file
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent]; // http://stackoverflow.com/a/19065448/4205475
}

- (void)p_configureTabBar {
    self.tabBar.tintColor = [UIColor ISHexColor_colorFromHexRGB:0x00b0a5];
    [self.tabBar setClipsToBounds:YES]; // http://stackoverflow.com/a/18786414/4205475
}

@end
