//
//  MyAnnotation.m
//  Maps
//
//  Created by Vandad Nahavandipoor on 11-05-10.
//  Copyright 2011 All rights reserved.
//

#import "MyAnnotation.h"

NSString *const kReusablePinRed = @"pinRed";
NSString *const kReusablePinGreen = @"pinGreen";
NSString *const kReusablePinPurple = @"pinYellow";

@implementation MyAnnotation

+ (NSString *) reusableIdentifierforPinColor:(MKPinAnnotationColor)paramColor{
    
    NSString *result = nil;
    
    switch (paramColor){
        case MKPinAnnotationColorRed:{
            result = kReusablePinRed;
            break;
        }
        case MKPinAnnotationColorGreen:{
            result = kReusablePinGreen;
            break;
        }
        case MKPinAnnotationColorPurple:{
            result = kReusablePinPurple;
            break;
        }
    }
    
    return result;
}

- (instancetype) initWithCoordinates:(CLLocationCoordinate2D)paramCoordinates
                               title:(NSString*)paramTitle
                            subTitle:(NSString*)paramSubTitle{
    self = [super init];
    
    if (self != nil){
        _coordinate = paramCoordinates;
        _title = paramTitle;
        _subtitle = paramSubTitle;
        _pinColor = MKPinAnnotationColorGreen;
    }
    
    return self;
}

- (NSString *)pinNum{
    return _pinNum;
}

@end
