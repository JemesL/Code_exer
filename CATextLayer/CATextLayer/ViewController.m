//
//  ViewController.m
//  CATextLayer
//
//  Created by JL on 16/8/3.
//  Copyright © 2016年 JL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    CATextLayer *textLayer = [[CATextLayer alloc] init];
    textLayer.frame = CGRectMake(50, 50, 150, 550);
    textLayer.foregroundColor = [UIColor orangeColor].CGColor;
    textLayer.wrapped = YES;
    
    [self.view.layer addSublayer:textLayer];
    
    
    textLayer.string = @"xtLayer *textLayer = [[CATextLayer alloc] init];textLayer.frame = CGRectMake(50, 50, 150, 150);textLayer.foregroundColor = [UIColor or";
    textLayer.alignmentMode =  kCAAlignmentJustified;
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    
    UIFont *font = [UIFont systemFontOfSize:13];
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    
    textLayer.font = fontRef;
    textLayer.fontSize = 13;
    
    CGFontRelease(fontRef);
}

@end
