//
//  AnimationHelper.m
//  Eweclid
//
//  Created by iOS developer on 9/14/12.
//
//

#import "AnimationHelper.h"

@implementation AnimationHelper



+(void)fadeOut:(UIView*)viewToDissolve withDuration:(NSTimeInterval)duration   andWait:(NSTimeInterval)wait
{
    [UIView beginAnimations: @"Fade Out" context:nil];
    [UIView setAnimationDelay:wait];
    [UIView setAnimationDuration:duration];
    viewToDissolve.alpha = 0.0;
    [UIView commitAnimations];
}

+(void)fadeIn:(UIView*)viewToFadeIn withDuration:(NSTimeInterval)duration         andWait:(NSTimeInterval)wait
{
    [UIView beginAnimations: @"Fade In" context:nil];
    [UIView setAnimationDelay:wait];
    [UIView setAnimationDuration:duration];
    viewToFadeIn.alpha = 1;
    [UIView commitAnimations];
    
}

+(void)fadeOutTransparent:(UIView*)viewToDissolve withDuration:(NSTimeInterval)duration   andWait:(NSTimeInterval)wait
{
    [UIView beginAnimations: @"Fade Out" context:nil];
    [UIView setAnimationDelay:wait];
    [UIView setAnimationDuration:duration];
    viewToDissolve.alpha = 0.0;
    [UIView commitAnimations];
}

+(void)fadeInTransparent:(UIView*)viewToFadeIn withDuration:(NSTimeInterval)duration         andWait:(NSTimeInterval)wait
{
    [UIView beginAnimations: @"Fade In" context:nil];
    [UIView setAnimationDelay:wait];
    [UIView setAnimationDuration:duration];
    viewToFadeIn.alpha = .7;
    [UIView commitAnimations];
}

+(void)flashView:(UIView*)viewToFadeIn withDuration:(NSTimeInterval)duration 
{
    [AnimationHelper fadeOut:viewToFadeIn withDuration:duration andWait:0.0];
    [AnimationHelper fadeIn:viewToFadeIn withDuration:duration andWait:duration];
}

+(void)flashViewTime:(UIView*)viewToFadeIn withDuration:(NSTimeInterval)duration andWait:(NSTimeInterval)wait
{
    [AnimationHelper fadeOut:viewToFadeIn withDuration:duration andWait:wait];
    [AnimationHelper fadeIn:viewToFadeIn withDuration:duration andWait:(duration + wait)];
}


+(void)popIn:(UIView*)viewPopIn withDuration:(NSTimeInterval)duration         andWait:(NSTimeInterval)wait andScaleFactor:(float)scaleFactor
{
    [UIView beginAnimations: @"Fade In" context:nil];
    [UIView setAnimationDelay:wait];
    [UIView setAnimationDuration:duration];
    viewPopIn.transform = CGAffineTransformMakeScale(scaleFactor, scaleFactor);
    [UIView commitAnimations];
}

+(void)popInReb:(UIView*)viewPopIn andWait:(NSTimeInterval)wait
{
     viewPopIn.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    
    [UIView animateWithDuration:0.3/1.5 delay:wait options:0 animations:^{
        viewPopIn.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 delay:wait options:0 animations:^{
            viewPopIn.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
           
            [UIView animateWithDuration:0.3/2 delay:wait options:0 animations:^{
                viewPopIn.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished){}];
        }];
    }];

}

+(void)changeViewSize:(UIView*)viewPopIn withFrame:(CGRect)frame withDuration:(NSTimeInterval)duration         andWait:(NSTimeInterval)wait
{
    [UIView
     animateWithDuration:duration
     delay:wait
     options:UIViewAnimationOptionCurveEaseInOut
     animations:^{
         [viewPopIn setFrame:frame];
     }
     completion:^(BOOL completed) {}
     ];
}

+(void)changeViewImage:(UIImageView*)imageView withImage:(UIImage *)img withDuration:(NSTimeInterval)duration         andWait:(NSTimeInterval)wait;
{
    [UIView beginAnimations: @"Change Image" context:nil];
    [UIView setAnimationDelay:wait];
    [UIView setAnimationDuration:duration];
    [imageView setImage:img];
    [UIView commitAnimations];

}

+(void)rotation:(UIView*)viewRotate withDuration:(NSTimeInterval)duration withDirection:(NSTimeInterval)direction repeatCount:(NSTimeInterval)repeat{
    
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: direction * M_PI * 2.0];//directioin vaules 1 and -1
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat;
    [viewRotate.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

+(float) randFloatBetween:(float)low and:(float)high
{
    float diff = high - low;
    return (((float) rand() / RAND_MAX) * diff) + low;
}



@end
