//
//  JLPercentDrivenInteractiveTransition.h
//  侧边会退
//
//  Created by JL on 9/21/16.
//  Copyright © 2016 JL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopTransition.h"
@interface JLPercentDrivenInteractiveTransition : UIPercentDrivenInteractiveTransition
@property (nonatomic, strong) PopTransition *popTransition;
@end
