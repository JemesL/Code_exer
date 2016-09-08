//
//  ViewController.m
//  Cube
//
//  Created by JL on 16/8/3.
//  Copyright © 2016年 JL. All rights reserved.
//

#import "ViewController.h"
#import <GLKit/GLKEffectPropertyLight.h>
#define colorRandom [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1]

#define LIGHT_DIRECTION 0, 1, -0.5
#define AMBIENT_LIGHT 0.5

@interface ViewController ()
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) NSMutableArray *faces;
@end

@implementation ViewController


- (NSMutableArray *)faces
{
    if (_faces == nil) {
        _faces = [[NSMutableArray alloc] init];
        
        for (int i = 0;  i < 6; i++) {
            UIView *face = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
            face.backgroundColor = colorRandom;
            
            [_faces addObject:face];
        }
    }
    
    return _faces;
}

- (void)addFace:(NSInteger)index withTransform:(CATransform3D)transform
{
    //get the face view and add it to the container
    UIView *face = self.faces[index];
    [self.containerView addSubview:face];
    //center the face view within the container
    CGSize containerSize = self.containerView.bounds.size;
    face.center = CGPointMake(containerSize.width / 2.0, containerSize.height / 2.0);
    // apply the transform
    face.layer.transform = transform;
    
    [self applyLightingToFace:face.layer];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.containerView = [[UIView alloc] initWithFrame:self.view.bounds];
     [self.view addSubview:self.containerView];
    
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0 / 500.0;
    perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
    perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);
    self.containerView.layer.sublayerTransform = perspective;
//    perspective = CATransform3DRotate(perspective, M_PI_4, 1, 0, 0);
//    perspective = CATransform3DRotate(perspective,  -M_PI_4, 0, 1, 0);
    
//    self.containerView.layer.sublayerTransform = perspective;
   
    
    //set up the container sublayer transform
////    CATransform3D perspective = CATransform3DIdentity;
//    perspective.m34 = -1.0 / 500.0;
//    self.containerView.layer.sublayerTransform = perspective;
    //add cube face 1
    CATransform3D transform = CATransform3DMakeTranslation(0, 0, 100);
    [self addFace:0 withTransform:transform];
    //add cube face 2
    transform = CATransform3DMakeTranslation(100, 0, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
    [self addFace:1 withTransform:transform];
    //add cube face 3
    transform = CATransform3DMakeTranslation(0, -100, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
    [self addFace:2 withTransform:transform];
    //add cube face 4
    transform = CATransform3DMakeTranslation(0, 100, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
    [self addFace:3 withTransform:transform];
    //add cube face 5
    transform = CATransform3DMakeTranslation(-100, 0, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
    [self addFace:4 withTransform:transform];
    //add cube face 6
    transform = CATransform3DMakeTranslation(0, 0, -100);
    transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
    [self addFace:5 withTransform:transform];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CATransform3D perspective = self.containerView.layer.sublayerTransform;
    perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
    perspective = CATransform3DRotate(perspective,  M_PI_4, 0, 1, 0);
    
    self.containerView.layer.sublayerTransform = perspective;
}


-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    
    CGPoint newPoint = [touch locationInView:self.view];
    CGPoint oldPoint = [touch previousLocationInView:self.view];
    
    CGFloat offsetV = newPoint.y - oldPoint.y;
    CGFloat offsetH = newPoint.x - oldPoint.x;
    
    CATransform3D perspective = self.containerView.layer.sublayerTransform;
    perspective = CATransform3DRotate(perspective, -offsetV / 180 * M_PI, 1, 0, 0);
    perspective = CATransform3DRotate(perspective, offsetH /180 * M_PI, 0, 1, 0);
    
    self.containerView.layer.sublayerTransform = perspective;
}

- (void)applyLightingToFace:(CALayer *)face
{
    //add lighting layer
    CALayer *layer = [CALayer layer];
    layer.frame = face.bounds;
    [face addSublayer:layer];
    //convert the face transform to matrix
    //(GLKMatrix4 has the same structure as CATransform3D)

    CATransform3D transform = face.transform;
    GLKMatrix4 matrix4 = *(GLKMatrix4 *)&transform;
    GLKMatrix3 matrix3 = GLKMatrix4GetMatrix3(matrix4);
    //get face normal
    GLKVector3 normal = GLKVector3Make(0, 0, 1);
    normal = GLKMatrix3MultiplyVector3(matrix3, normal);
    normal = GLKVector3Normalize(normal);
    //get dot product with light direction
    GLKVector3 light = GLKVector3Normalize(GLKVector3Make(LIGHT_DIRECTION));
    float dotProduct = GLKVector3DotProduct(light, normal);
    //set lighting layer opacity
    CGFloat shadow = 1 + dotProduct - AMBIENT_LIGHT;
    UIColor *color = [UIColor colorWithWhite:0 alpha:0.2];
    layer.backgroundColor = color.CGColor;
}
@end
