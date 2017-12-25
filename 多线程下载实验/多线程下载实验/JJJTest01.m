//
//  JJJTest01.m
//  多线程下载实验
//
//  Created by jinjiajian on 2017/8/29.
//  Copyright © 2017年 jjj. All rights reserved.
//

#import "JJJTest01.h"

@interface JJJTest01()

@property (nonatomic,strong)UIView *jinView;

@end

@implementation JJJTest01

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _gakki = @"我老婆";
        
        UIWindow *mainWindow = [self lastWindow];
        self.jinView = [UIView new];
        _jinView.backgroundColor = [UIColor blueColor];
        _jinView.frame = CGRectMake(0, 0, 200, 200);
        [mainWindow addSubview:_jinView];
        
    }
    
    return self;
    
}

- (void)say{
    
    
    [self sayWorld];
}

- (void)sayWorld{
    NSLog(@"hello world");
}

- (void)hahah{
    NSLog(@"%@",self.gakki);
}


- (UIWindow *)lastWindow
{
    NSArray *windows = [UIApplication sharedApplication].windows;
    for(UIWindow *window in [windows reverseObjectEnumerator]) {
        
        if ([window isKindOfClass:[UIWindow class]] &&
            CGRectEqualToRect(window.bounds, [UIScreen mainScreen].bounds))
            
            return window;
    }
    
    return [UIApplication sharedApplication].keyWindow;
}


@end
