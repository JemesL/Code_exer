//
//  ViewController.m
//  layer_exer
//
//  Created by JL on 16/8/1.
//  Copyright © 2016年 JL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) CALayer *blueLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIView *viewview = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 150, 150)];
    viewview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:viewview];
    
    CALayer *blueLayer = [CALayer layer];
    self.blueLayer = blueLayer;
    blueLayer.frame = CGRectMake(25, 25, 100, 100);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    self.blueLayer.contentsScale = [UIScreen mainScreen].scale;
    self.blueLayer.delegate = self;
    [viewview.layer addSublayer:blueLayer];
    viewview.layer.delegate = self;
    [viewview.layer display];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.blueLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"wallhaven-178943"].CGImage);
    
    self.blueLayer.contentsGravity = kCAGravityResizeAspectFill;
    self.blueLayer.masksToBounds = YES;
    self.blueLayer.contentsCenter = CGRectMake(0.25, 0.25, -0.25, -0.25);
    self.blueLayer.delegate = self;
    
//    [self.blueLayer display];
}

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    CGContextSetLineWidth(ctx, 10.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}

//-(void)displayLayer:(CALayer *)layer
//{
//}


@end
