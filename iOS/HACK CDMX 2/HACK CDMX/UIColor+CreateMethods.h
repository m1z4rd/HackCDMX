//
//  UIColor+CreateMethods.h
//  Messenger
//
//  Created by Alejandro Omar Gutierrez Pallares on 26/05/14.
//  Copyright (c) 2014 Alejandro Omar Gutierrez Pallares. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CreateMethods)

// wrapper for [UIColor colorWithRed:green:blue:alpha:]
// values must be in range 0 - 255
+ (UIColor*)colorWith8BitRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha;

// Creates color using hex representation
// hex - must be in format: #FF00CC
// alpha - must be in range 0.0 - 1.0
+ (UIColor*)colorWithHex:(NSString*)hex alpha:(CGFloat)alpha;

@end
