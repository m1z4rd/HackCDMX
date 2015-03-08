//
//  DateMethods.m
//  TrackingPoint
//
//  Created by CIMM1 on 15/01/15.
//  Copyright (c) 2015 David Sinai Jiménez Jiménez. All rights reserved.
//

#import "DateMethods.h"

@implementation DateMethods

+(NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime
{
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&fromDate
                 interval:NULL forDate:fromDateTime];
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&toDate
                 interval:NULL forDate:toDateTime];
    
    NSDateComponents *difference = [calendar components:NSDayCalendarUnit
                                               fromDate:fromDate toDate:toDate options:0];
    
    return [difference day];
}

+(NSString*)dateToStr:(NSDate*)date withFormat:(NSString*)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSLocale *enUSPOSIXLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [formatter setLocale:enUSPOSIXLocale];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:date];
}

+(NSDate*)strToDate:(NSString*)string strFormat:(NSString*)strformat withFormat:(NSString*)format
{
    NSDateFormatter *datefor = [[NSDateFormatter alloc] init];
    [datefor setDateFormat:strformat];
    NSDate *date = [datefor dateFromString:string];
    [datefor setDateFormat:format];
    NSString *str=  [[NSString alloc] initWithString:[datefor stringFromDate:date]];
    NSDate *date_final = [datefor dateFromString:str];
    
    return date_final;
}

@end
