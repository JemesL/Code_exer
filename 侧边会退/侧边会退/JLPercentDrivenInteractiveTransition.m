//
//  JLPercentDrivenInteractiveTransition.m
//  侧边会退
//
//  Created by JL on 9/21/16.
//  Copyright © 2016 JL. All rights reserved.
//

#import "JLPercentDrivenInteractiveTransition.h"

@implementation JLPercentDrivenInteractiveTransition

- (void)finishInteractiveTransition
{
    
    
    [super finishInteractiveTransition];
    
//    [self.popTransition.transitionContext completeTransition:YES];
//    
//    self.popTransition = nil;
}

- (void)cancelInteractiveTransition
{
//    [self updateInteractiveTransition:0];
//    [super cancelInteractiveTransition];
    
    
    
    
    [super cancelInteractiveTransition];
    
//    [self updateInteractiveTransition:0];
    
//    [self.popTransition.transitionContext completeTransition:false];
//    NSLog(@"l");
//    if (self.percentComplete > 0.1) {
//        [self updateInteractiveTransition:0];
//        [self.popTransition.transitionContext completeTransition:NO];
//        [super cancelInteractiveTransition];
//    } else {
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [self updateInteractiveTransition:0];
//            [self.popTransition.transitionContext completeTransition:NO];
//            [super cancelInteractiveTransition];
//            
//        });
//        
//    }
    
}

@end
