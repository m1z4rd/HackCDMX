//
//  DateMethods.h
//  TrackingPoint
//
//  Created by CIMM1 on 15/01/15.
//  Copyright (c) 2015 David Sinai Jiménez Jiménez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateMethods : NSObject

+(NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime;

+(NSString*)dateToStr:(NSDate*)date withFormat:(NSString*)format;

+(NSDate*)strToDate:(NSString*)string strFormat:(NSString*)strformat withFormat:(NSString*)format;

@end
