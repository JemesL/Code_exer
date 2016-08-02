//
//  ViewController.m
//  ViewOpacity
//
//  Created by JL on 16/8/2.
//  Copyright © 2016年 JL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    CALayer *one = [[CALayer alloc] init];
    one.frame = CGRectMake(50, 50, 50, 50);
    one.shouldRasterize = YES;
//    one.rasterizationScale = [UIScreen mainScreen].scale;
    one.backgroundColor = [UIColor whiteColor].CGColor;
    
    CALayer *two = [[CALayer alloc] init];
    two.frame = CGRectMake(50, 50, 20, 50);
    two.backgroundColor = [UIColor whiteColor].CGColor;
    
    one.opacity = 0.5;
//    two.opacity = 0.5;
    
    
    [self.view.layer addSublayer:one];
    [self.view.layer addSublayer:two];
//    [one addSublayer:two];
    
    self.view.layer.shouldRasterize = YES;
//    self.view.layer.rasterizationScale = [UIScreen mainScreen].scale;
}


@end
