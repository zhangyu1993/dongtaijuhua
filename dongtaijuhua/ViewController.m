//
//  ViewController.m
//  dongtaijuhua
//
//  Created by LNXD1 on 16/8/15.
//  Copyright © 2016年 LNXD1. All rights reserved.
//

#import "ViewController.h"
#import "ZYProgressHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView * v = [UIView new];
    v.frame = CGRectMake(100, 100, 100, 100);
    v.backgroundColor = [UIColor redColor];
    [self.view addSubview:v];
    
    NSMutableArray * imgArr = [NSMutableArray array];
    for (int i = 1; i <= 8; i++) {
        [imgArr addObject:[UIImage imageNamed:[NSString stringWithFormat:@"group_icon_%d",i]]];
    }
    [ZYProgressHUD show];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [ZYProgressHUD dismiss];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [ZYProgressHUD show];
        });
    });
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
