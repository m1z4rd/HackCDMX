//
//  Constants.h
//  
//
//  Created by Sachel Hernandez Perez <sachel.hernandez@gmail.com>
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UserDefaultsHelper.h"


@implementation UserDefaultsHelper



#pragma mark -
#pragma mark For basic data types

+(void)setInt:(int)value key:(NSString*)key
{
	NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
	[userdefaults setInteger:value forKey:key];
	[userdefaults synchronize];
}
+(int)getInt:(NSString*)key
{
	NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    return (int)[userdefaults integerForKey:key];
}

+(void)setBool:(bool)value key:(NSString*)key
{
	NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
	[userdefaults setBool:value forKey:key];
	[userdefaults synchronize];
}
+(BOOL)getBool:(NSString*)key
{
	NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    return [userdefaults boolForKey:key];
}

+(void)setString:(NSString*)str key:(NSString*)key
{
	NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
	[userdefaults setValue:str forKey:key];
	[userdefaults synchronize];
}
+(NSString*)getString:(NSString*)key
{
	NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    return [userdefaults stringForKey:key];
}

+(void)setDate:(NSDate*)date key:(NSString*)key
{
	NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
	[userdefaults setValue:date forKey:key];
	[userdefaults synchronize];
}
+(NSDate*)getDate:(NSString*)key
{
	NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    return [userdefaults valueForKey:key];
}

+(void)setArray:(NSMutableArray*)array key:(NSString*)key
{
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
	[userdefaults setValue:array forKey:key];
	[userdefaults synchronize];
}
+(NSMutableArray*)getArray:(NSString*)key
{
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *result=[[NSMutableArray alloc] initWithArray:[userdefaults valueForKey:key]];
    return result;
}

+(void)setDictionary:(NSMutableDictionary*)dict key:(NSString*)key
{
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
	[userdefaults setValue:dict forKey:key];
	[userdefaults synchronize];
}
+(NSMutableDictionary*)getDictionary:(NSString*)key
{
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *result=[[NSMutableDictionary alloc] initWithDictionary:[userdefaults valueForKey:key]];
    return result;
}

+(void)setData:(NSData*)data key:(NSString*)key
{
	NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    [userdefaults setObject:data forKey:key];
	[userdefaults synchronize];
}

+(NSData*)getData:(NSString*)key
{
	NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    return [userdefaults objectForKey:key];
}
@end
