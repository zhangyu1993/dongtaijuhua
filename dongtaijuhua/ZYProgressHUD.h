//
//  ZYProgressHUD.h
//  dongtaijuhua
//
//  Created by LNXD1 on 16/8/15.
//  Copyright © 2016年 LNXD1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYProgressHUD : UIView
+(void)showAnimationLoading:(NSArray *)imgArr;
+(void)dismiss;
+(void)show;
@end
