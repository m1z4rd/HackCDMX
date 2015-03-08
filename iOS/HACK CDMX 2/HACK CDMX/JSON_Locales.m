//
//  JSON_Locales.m
//  TrackingPoint
//
//  Created by David Sinai Jiménez Jiménz on 06/03/15.
//  Copyright (c) 2015 David Sinai Jiménez Jiménez. All rights reserved.
//

#import "JSON_Locales.h"

@implementation JSON_Locales

+(NSMutableArray*)CentrosDeSalud
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"csvtojson" ofType:@"json"];
    NSError *error;
    NSString *fileContent = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    NSMutableArray *dTmp = [NSJSONSerialization JSONObjectWithData:[fileContent dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    return dTmp;
}

+(NSMutableDictionary*)Task
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Task" ofType:@"json"];
    NSError *error;
    NSString *fileContent = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    NSMutableDictionary *dTmp = [NSJSONSerialization JSONObjectWithData:[fileContent dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    return dTmp;
}

@end
