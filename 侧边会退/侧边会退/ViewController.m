//
//  ViewController.m
//  侧边会退
//
//  Created by JL on 9/20/16.
//  Copyright © 2016 JL. All rights reserved.
//

#import "ViewController.h"
#import "PushTransition.h"
#import "SecondViewController.h"
#import "PopTransition.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor =[UIColor orangeColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    SecondViewController *vc = [[SecondViewController alloc] init];
    vc.title = @"test";
//    vc.view.backgroundColor =[UIColor purpleColor];
//
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush){  // 就是在这里判断是哪种动画类型
        return [[PushTransition alloc] init]; // 返回push动画的类
    }else if (operation == UINavigationControllerOperationPop){  // 就是在这里判断是哪种动画类型
        return [[PopTransition alloc] init]; // 返回pop动画的类{
    }else{
        return nil;
    }
}


@end
