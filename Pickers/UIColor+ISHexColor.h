//
//  UIColor+ISHexColor.h
//  Braer
//
//  Created by M on 26.03.15.
//  Copyright (c) 2015 IAS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ISHexColor)

+ (UIColor *)ISHexColor_colorFromHexRGB:(NSUInteger)hexValue;

@end
