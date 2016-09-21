//
//  PopTransition.h
//  侧边会退
//
//  Created by JL on 9/21/16.
//  Copyright © 2016 JL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface PopTransition : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, strong) id<UIViewControllerContextTransitioning> transitionContext;

@end
