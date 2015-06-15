//
//  UIColor+ISHexColor.m
//  Braer
//
//  Created by M on 26.03.15.
//  Copyright (c) 2015 IAS. All rights reserved.
//

// http://stackoverflow.com/a/3532264/4205475

#import "UIColor+ISHexColor.h"

@implementation UIColor (ISHexColor)

+ (UIColor *)ISHexColor_colorFromHexRGB:(NSUInteger)hexValue {
    return [UIColor colorWithRed:((CGFloat)((hexValue & 0xff0000) >> 16)) / 255.0
                           green:((CGFloat)((hexValue & 0xff00) >> 8)) / 255.0
                            blue:((CGFloat)(hexValue & 0xff)) / 255.0
                           alpha:1.0];
}

@end
