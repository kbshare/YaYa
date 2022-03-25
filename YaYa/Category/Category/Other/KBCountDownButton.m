//
//  KBCountDownButton.m
//  Finance
//
//  Created by administrator on 2016/11/4.
//  Copyright © 2016年 MaShang Consumer Finance. All rights reserved.
//

#import "KBCountDownButton.h"

#define codeFontSize [UIFont systemFontOfSize:10.5]
#define disableImgName  @"按钮2灰色"
#define enableImgName  @"按钮2_"
@interface KBCountDownButton ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger countTime;
@property (nonatomic, strong) UIImage *disableImg;
@property (nonatomic, strong) UIImage *enableImg;

@end

@implementation KBCountDownButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self setup];
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setup];
    }
    return self;
}

- (void)setup {
    self.disableImg = [UIImage imageNamed:disableImgName];
    self.enableImg = [UIImage imageNamed:enableImgName];
    [self setTitle:@" 获取验证码 " forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:13];
    self.backgroundColor = [UIColor clearColor];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setBackgroundImage:self.enableImg forState:UIControlStateNormal];
    self.adjustsImageWhenHighlighted = NO;
    self.userInteractionEnabled = YES;
    /*
    self.layer.cornerRadius = 3.0;
    self.clipsToBounds = YES;
    self.layer.borderColor = [UIColor greenColor].CGColor;
    self.layer.borderWidth = 1.0;
     */
}

- (void)fireWithCountTime:(NSInteger)countTime{

    self.countTime = countTime;
    self.userInteractionEnabled = NO;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(reduceTime:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];

}

#pragma mark - 倒计时
- (void)reduceTime:(NSTimer *)codeTimer {
    
    

    if (self.countTime == 0) {
        [self setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.titleLabel.font = codeFontSize;
        [self setBackgroundImage:self.enableImg forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.userInteractionEnabled = YES;
        [self.timer invalidate];
    } else {
        NSString *str = [NSString stringWithFormat:@"%luS", (long)self.countTime];
        self.titleLabel.font = codeFontSize;
        [self setBackgroundImage:self.disableImg forState:UIControlStateNormal];
        [self setTitle:str forState:UIControlStateNormal];
        self.userInteractionEnabled = NO;
    }
    self.countTime--;
}
- (void)stopTimer{

    [self.timer  invalidate];
    self.timer = nil;
    [self setup];
    
}
- (void)dealloc{

    [self.timer  invalidate];
    self.timer = nil;
}

- (void)enableState{

    if (self.enabled == YES)[self setBackgroundImage:self.enableImg forState:UIControlStateNormal];
    if (self.enabled == NO)[self setBackgroundImage:self.disableImg forState:UIControlStateDisabled];

}

- (void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state{

/*
    UIImage *defaultImg = self.enableImg;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self setBackgroundImage:image?:defaultImg forState:state];
    });
   */  
}

@end
