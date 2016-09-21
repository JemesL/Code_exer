//
//  PopTransition.m
//  侧边会退
//
//  Created by JL on 9/21/16.
//  Copyright © 2016 JL. All rights reserved.
//

#import "PopTransition.h"
#import "ViewController.h"
#import "SecondViewController.h"
@implementation PopTransition
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    self.transitionContext = transitionContext;
    NSLog(@"123");
    SecondViewController * fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    ViewController * toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *container = transitionContext.containerView;

    [container addSubview:toVC.view];
    [container addSubview:fromVC.view];

    toVC.view.transform = CGAffineTransformMakeScale(0.8, 0.8);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        
        fromVC.view.alpha = 1;
        fromVC.view.frame = CGRectMake(fromVC.view.frame.size.width, 0, fromVC.view.frame.size.width, fromVC.view.frame.size.height);
        
        toVC.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
        if (transitionContext.transitionWasCancelled) {
            [transitionContext completeTransition:NO];
        } else {
            [transitionContext completeTransition:YES];
        }
        
    }];
    
}

@end
