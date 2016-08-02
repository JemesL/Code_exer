//
//  ViewController.m
//  frame_exer
//
//  Created by JL on 16/8/2.
//  Copyright © 2016年 JL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *smallVIew;

@property (nonatomic, strong) CALayer *one;
@property (nonatomic, strong) CALayer *two;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CALayer *one = [[CALayer alloc] init];
    one.backgroundColor = [UIColor orangeColor].CGColor;
    one.frame = CGRectMake(50, 50, 100, 100);
 
    CALayer *two = [[CALayer alloc] init];
    two.backgroundColor = [UIColor blueColor].CGColor;
    two.frame = CGRectMake(50, 50, 100, 100);
    
    [self.view.layer addSublayer:one];
    [self.view.layer addSublayer:two];

    self.one = one;
    self.two = two;
    
    self.one.zPosition = 0.1;
    self.two.zPosition = 0.2;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //get touch position
    CGPoint point = [[touches anyObject] locationInView:self.view];
    //get touched layer
    CALayer *layer = [self.view.layer hitTest:point];
    //get layer using hitTest
    if (layer == self.one) {
        [[[UIAlertView alloc] initWithTitle:@"Inside orangeColor Layer"
                                    message:nil
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    } else if (layer == self.two) {
        [[[UIAlertView alloc] initWithTitle:@"Inside blueColor Layer"
                                    message:nil
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
}

@end
