//
//  SecondViewController.m
//  侧边会退
//
//  Created by JL on 9/21/16.
//  Copyright © 2016 JL. All rights reserved.
//

#import "SecondViewController.h"
#import "PopTransition.h"
#import "JLPercentDrivenInteractiveTransition.h"
@interface SecondViewController ()<UINavigationControllerDelegate>
@property (nonatomic, strong) JLPercentDrivenInteractiveTransition *percentDrivenTransition;
@end

@implementation SecondViewController


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    UIScreenEdgePanGestureRecognizer *edgePan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(edgePanGesture:)];
    edgePan.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:edgePan];
}

- (void)edgePanGesture:(UIScreenEdgePanGestureRecognizer *)edgePan
{
    CGFloat progress = [edgePan translationInView:self.view].x / self.view.bounds.size.width;
    if (edgePan.state == UIGestureRecognizerStateBegan) {
        self.percentDrivenTransition = [[JLPercentDrivenInteractiveTransition alloc] init];
        [self.navigationController popViewControllerAnimated:YES];
        NSLog(@"UIGestureRecognizerStateBegan");
    } else if(edgePan.state == UIGestureRecognizerStateChanged){
        [self.percentDrivenTransition updateInteractiveTransition:progress];
      NSLog(@"UIGestureRecognizerStateChanged");
    } else if(edgePan.state == UIGestureRecognizerStateCancelled){
        
        if (progress > 0.5) {
            [self.percentDrivenTransition finishInteractiveTransition];
        } else {
            [self.percentDrivenTransition cancelInteractiveTransition];
        }
//        self.percentDrivenTransition = nil;
        NSLog(@"UIGestureRecognizerStateCancelled");
    } else if(edgePan.state == UIGestureRecognizerStateEnded){
        
        if (progress > 0.5) {
            [self.percentDrivenTransition finishInteractiveTransition];
        } else {
            [self.percentDrivenTransition cancelInteractiveTransition];
        }
        NSLog(@"UIGestureRecognizerStateEnded");
    }else if(edgePan.state == UIGestureRecognizerStatePossible){
        NSLog(@"UIGestureRecognizerStatePossible");
    }else if(edgePan.state == UIGestureRecognizerStateFailed){
        NSLog(@"UIGestureRecognizerStateFailed");
    }
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    if ([animationController isKindOfClass:[PopTransition class]]) {
        
        return self.percentDrivenTransition;
    } else {
        return nil;
    }
}

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPop) {
        PopTransition *popTransition = [[PopTransition alloc] init];
        self.percentDrivenTransition.popTransition = popTransition;
        return popTransition;
    } else {
        return nil;
    }
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self popoverPresentationController];
}
@end
