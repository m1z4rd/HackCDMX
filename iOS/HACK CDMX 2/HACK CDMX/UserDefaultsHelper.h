//
//  Constants.h
//  
//
//  Created by Sachel Hernandez Perez <sachel.hernandez@gmail.com>
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface UserDefaultsHelper : NSObject

+(void)setInt:(int)value key:(NSString*)key;
+(int)getInt:(NSString*)key;
+(void)setBool:(bool)value key:(NSString*)key;
+(BOOL)getBool:(NSString*)key;
+(void)setString:(NSString*)str key:(NSString*)key;
+(NSString*)getString:(NSString*)key;
+(void)setDate:(NSDate*)date key:(NSString*)key;
+(NSDate*)getDate:(NSString*)key;
+(void)setArray:(NSMutableArray*)array key:(NSString*)key;
+(NSMutableArray*)getArray:(NSString*)key;
+(void)setDictionary:(NSMutableDictionary*)dict key:(NSString*)key;
+(NSMutableDictionary*)getDictionary:(NSString*)key;

@end
