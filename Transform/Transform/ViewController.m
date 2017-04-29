//
//  ViewController.m
//  Transform
//
//  Created by sephilex on 2017/4/28.
//  Copyright © 2017年 sephilex. All rights reserved.
//

#import "ViewController.h"
#import "ParamTestVC.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *headImageView;
@property (nonatomic, strong) UIImageView *imageView1;
@property (nonatomic, strong) UIImageView *imageView2;
@property (nonatomic, strong) UIImageView *imageView3;
@property (nonatomic, strong) UIImageView *imageView4;
@property (nonatomic, strong) UIImageView *imageView5;
@property (nonatomic, strong) UIImageView *imageView6;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ParamTestVC *VC = [[ParamTestVC alloc] init];
    NSMutableString *name = [[NSMutableString alloc] initWithString:@"lawliet"];
    VC.name = name;
    [name appendString:@"sephilex"];
    NSLog(@"%@", name);
    // Do any additional setup after loading the view, typically from a nib.
    
    _headImageView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
//    [_headImageView setBackgroundColor:[UIColor redColor]];
//    
//    [_headImageView setTransform:CGAffineTransformMakeScale(0, 0)];
//    
//    [self.view addSubview:_headImageView];
//    
    UIButton *leftrotatebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftrotatebtn.frame = CGRectMake(125, 450, 80, 40);
    [leftrotatebtn setTitle:@"向左旋转" forState:UIControlStateNormal];
    [leftrotatebtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [leftrotatebtn setTag:1];
    [self.view addSubview:leftrotatebtn];
//
//    //添加按钮的单击事件
//    [leftrotatebtn addTarget:self action:@selector(rotate:) forControlEvents:UIControlEventTouchUpInside];
//
//       //向右旋转按钮
//    UIButton *rightrotatebtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    rightrotatebtn.frame = CGRectMake(125, 500, 80, 40);
//    [rightrotatebtn setTitle:@"向右旋转" forState:UIControlStateNormal];
//    [rightrotatebtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    [rightrotatebtn setTag:0];
//    [self.view addSubview:rightrotatebtn];
//       //添加按钮的单击事件
//    [rightrotatebtn addTarget:self action:@selector(rotate:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)rotate:(id)sender{
    
    
//        UIButton *button = (UIButton *)sender;
//        if (button.tag) {
//            //self.headImageView.transform = CGAffineTransformMakeRotation(-M_PI_4);
//            //逆时针旋转
////            [UIView animateWithDuration:1 animations:^{
////                self.headImageView.transform = CGAffineTransformRotate(self.headImageView.transform, -M_1_PI);
////            }];
//            [UIView animateWithDuration:1 animations:^{
//                self.headImageView.transform = CGAffineTransformMakeScale(0, 0);
//            }];
//        } else {
//            //顺时针旋转
////            [UIView animateWithDuration:1 animations:^{
//                [self.headImageView setTransform:CGAffineTransformMakeScale(1, 1)];
////            }];
//    
//        }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
