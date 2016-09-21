//
//  PushTransition.m
//  侧边会退
//
//  Created by JL on 9/21/16.
//  Copyright © 2016 JL. All rights reserved.
//

#import "PushTransition.h"
#import "ViewController.h"
#import "SecondViewController.h"
@implementation PushTransition


#pragma mark -UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
      return 0.5;
}



- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    ViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    SecondViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *container = transitionContext.containerView;
    
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.alpha = 0;
    
    [container addSubview:toVC.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        
        toVC.view.alpha = 1;
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:YES];
        
    }];
    
}

@end
