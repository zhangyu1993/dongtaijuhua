//
//  ZYProgressHUD.m
//  dongtaijuhua
//
//  Created by LNXD1 on 16/8/15.
//  Copyright © 2016年 LNXD1. All rights reserved.
//

#import "ZYProgressHUD.h"

@interface ZYProgressHUD ()

@property (nonatomic, strong) UIImageView *animationImgview;
@property (nonatomic, strong) UILabel *textLab;
@property (nonatomic, strong) NSMutableArray *defaultImgArr;
@end


@implementation ZYProgressHUD

+ (ZYProgressHUD*)sharedView {
    static dispatch_once_t once;
    
    static ZYProgressHUD *sharedView;
#if !defined(SV_APP_EXTENSIONS)
    dispatch_once(&once, ^{
        sharedView = [[self alloc] initWithFrame:[[[UIApplication sharedApplication] delegate] window].bounds];
        sharedView.backgroundColor = [UIColor clearColor];
        
    });
#else
    dispatch_once(&once, ^{ sharedView = [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]]; });
#endif
    return sharedView;
}


+(void)showAnimationLoading:(NSArray *)imgArr
{
    [[self sharedView] showAnimationLoading:imgArr];
}

+(void)dismiss
{
    [[self sharedView] dismiss];
}

+(void)show
{
    [[self sharedView] show];
}

-(UIImageView *)animationImgview
{
    if (!_animationImgview) {
        _animationImgview = [[UIImageView alloc] init];
    }
    return _animationImgview;
}
-(UILabel *)textLab
{
    if (!_textLab) {
        _textLab = [[UILabel alloc] init];
    }
    return _textLab;
}

-(NSMutableArray *)defaultImgArr
{
    if (!_defaultImgArr) {
        _defaultImgArr = [NSMutableArray array];
        for (int i = 1; i <= 8; i++) {
            [_defaultImgArr addObject:[UIImage imageNamed:[NSString stringWithFormat:@"group_icon_%d",i]]];
        }
    }
    return _defaultImgArr;
}

-(void)showAnimationLoading:(NSArray *)imgArr
{
    __weak ZYProgressHUD *weakSelf = self;
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        if (weakSelf) {
       //     self.animationImgview.backgroundColor = [UIColor redColor];
            self.hidden = NO;
            self.animationImgview.center = self.center;
            self.animationImgview.bounds = CGRectMake(0, 0, 40, 60);
            if (imgArr == nil) {
                self.animationImgview.animationImages = self.defaultImgArr;
            }
            else
            {
                 self.animationImgview.animationImages = imgArr;
            }
            self.animationImgview.animationDuration = 0.5;
            [self.animationImgview startAnimating];
            [self addSubview:self.animationImgview];
            
            self.textLab.frame = CGRectMake(self.center.x - 20, self.center.y + 30, 40, 20);
            self.textLab.text = @"加载中...";
            self.textLab.textAlignment = NSTextAlignmentCenter;
            self.textLab.font = [UIFont systemFontOfSize:10];
       //     self.textLab.backgroundColor = [UIColor whiteColor];
            [self addSubview:self.textLab];
            [[UIApplication sharedApplication].keyWindow addSubview:self];
           // NSLog(@"%@", [UIApplication sharedApplication].keyWindow.subviews);
        }
    }];
}

-(void)dismiss
{
    self.hidden = YES;
}

-(void)show
{
    if (!_animationImgview) {
        [self showAnimationLoading:nil];
        NSLog(@"showAnimationLoading");
    }
    else
    {
        self.hidden = NO;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
