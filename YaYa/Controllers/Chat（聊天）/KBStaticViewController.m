//
//  KBStaticViewController.m
//  YaYa
//
//  Created by administrator on 2019/3/19.
//  Copyright © 2019年 msxf. All rights reserved.
//

#import "KBStaticViewController.h"
#import "KBStaticOtherViewController.h"

#import <objc/runtime.h>
//static int e = 555;

static NSString * const key = @"firstKey"; //修饰的是 key 指针指向的值 key不可变;

static NSString const *ke7 = @"secondkey"; //修饰的是 *key 这个地址  ke7的地址还是可以变的


@interface KBStaticViewController (){
    NSString *_name;
}
//@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, copy) NSString *name;
@end


@implementation KBStaticViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self printAllIvar];
}

// 利用runtime获取所有成员变量
- (void)printAllIvar {
    unsigned int outCount;
    Ivar *ivarList = class_copyIvarList([self class], &outCount);
    for (unsigned int i = 0; i < outCount; i++) {
        Ivar ivar = ivarList[i];
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSLog(@"%@",ivarName);
    }
}



- (void)initTimer{

    //    self.name = @"aaa";
    //    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    //    [btn addTarget:self action:@selector(printfFun) forControlEvents:UIControlEventTouchUpInside];
    //    [self.view addSubview:btn];
    //    btn.backgroundColor = [UIColor redColor];
    //    [btn setTitle:@"打印" forState:UIControlStateNormal];
    //        __weak typeof(self) weakSelf = self;
    //   self.timer = [NSTimer timerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
    //        [weakSelf timerRun];
    //    }];
    //    self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
    //       [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    //
    //    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
    //        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
         
        
    
}



- (void)printfFun{

    
    [self.navigationController pushViewController:[[KBStaticOtherViewController alloc]init] animated:YES];
    
}

- (void)timerRun {
    NSLog(@"%s", __func__);
}

- (void)dealloc {
//    [self.timer invalidate];
    NSLog(@"%s", __func__);
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
