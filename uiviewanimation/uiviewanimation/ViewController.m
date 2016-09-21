//
//  ViewController.m
//  uiviewanimation
//
//  Created by JL on 9/18/16.
//  Copyright © 2016 JL. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
@interface ViewController ()
@property (nonatomic, strong) UIView *grayView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *grayView = [[UIView alloc] initWithFrame:CGRectZero];
    self.grayView = grayView;
    grayView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:grayView];
    [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@100);
        make.height.equalTo(@0);
        make.top.equalTo(self.view);
        make.centerX.equalTo(self.view);
    }];
    [grayView layoutIfNeeded];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [UIView animateWithDuration:1 delay:0 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        [self.grayView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@100);
            make.height.equalTo(@100);
            make.top.equalTo(self.view);
            make.centerX.equalTo(self.view);
        }];
        [self.view layoutIfNeeded];
    } completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    

}


@end
