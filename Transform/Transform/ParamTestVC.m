//
//  ParamTestVC.m
//  Transform
//
//  Created by sephilex on 2017/4/29.
//  Copyright © 2017年 sephilex. All rights reserved.
//

#import "ParamTestVC.h"

@interface ParamTestVC ()

@end

@implementation ParamTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)test:(NSString **)name {
    NSLog(@"%@", *name);
    *name = @"sephilex";
    NSLog(@"%@", *name);
    
//    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
