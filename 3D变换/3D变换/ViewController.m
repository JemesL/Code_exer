//
//  ViewController.m
//  3D变换
//
//  Created by JL on 16/8/3.
//  Copyright © 2016年 JL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *layerView1;
@property (nonatomic, strong) UIView *layerView2;
@property (nonatomic, strong) UIView *containView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.containView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.containView];
    
    self.layerView1 = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    self.layerView1.backgroundColor = [UIColor orangeColor];
    [self.containView addSubview:self.layerView1];
    
    self.layerView2 = [[UIView alloc] initWithFrame:CGRectMake(150, 50, 50, 50)];
    self.layerView2.backgroundColor =  [UIColor orangeColor];
    [self.containView  addSubview:self.layerView2];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CATransform3D transfrom = CATransform3DIdentity;
    transfrom.m34 = - 1.0 / 500.0;
    
    [UIView animateWithDuration:1 animations:^{
        self.containView.layer.sublayerTransform = transfrom;
        
        self.layerView1.layer.doubleSided = NO;
        self.layerView1.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
        
        self.layerView2.layer.transform = CATransform3DMakeRotation(-M_PI_4, 0, 1, 0);

    }];
}

@end
