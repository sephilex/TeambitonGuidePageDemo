//
//  ParamTestVC.h
//  Transform
//
//  Created by sephilex on 2017/4/29.
//  Copyright © 2017年 sephilex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParamTestVC : UIViewController

@property (nonatomic, strong) NSString *name;

- (void)test:(NSString **)name;
@end
