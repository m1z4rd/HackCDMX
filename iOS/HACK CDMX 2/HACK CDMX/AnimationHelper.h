//
//  AnimationHelper.h
//  Eweclid
//
//  Created by iOS developer on 9/14/12.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AnimationHelper : NSObject



+(void)fadeOut:(UIView*)viewToDissolve withDuration:(NSTimeInterval)duration   andWait:(NSTimeInterval)wait;

+(void)fadeIn:(UIView*)viewToFadeIn withDuration:(NSTimeInterval)duration         andWait:(NSTimeInterval)wait;

+(void)fadeOutTransparent:(UIView*)viewToDissolve withDuration:(NSTimeInterval)duration   andWait:(NSTimeInterval)wait;

+(void)fadeInTransparent:(UIView*)viewToFadeIn withDuration:(NSTimeInterval)duration         andWait:(NSTimeInterval)wait;

+(void)flashView:(UIView*)viewToFadeIn withDuration:(NSTimeInterval)duration;

+(void)flashViewTime:(UIView*)viewToFadeIn withDuration:(NSTimeInterval)duration andWait:(NSTimeInterval)wait;

+(void)popIn:(UIView*)viewPopIn withDuration:(NSTimeInterval)duration         andWait:(NSTimeInterval)wait andScaleFactor:(float)scaleFactor;

+(void)popInReb:(UIView*)viewPopIn andWait:(NSTimeInterval)wait;

+(void)changeViewSize:(UIView*)viewPopIn withFrame:(CGRect)frame withDuration:(NSTimeInterval)duration         andWait:(NSTimeInterval)wait;

+(void)changeViewImage:(UIImageView*)imageView withImage:(UIImage *)img withDuration:(NSTimeInterval)duration         andWait:(NSTimeInterval)wait;

+(void)rotation:(UIView*)viewRotate withDuration:(NSTimeInterval)duration withDirection:(NSTimeInterval)direction repeatCount:(NSTimeInterval)repeat;

+(float) randFloatBetween:(float)low and:(float)high;


@end
