//
//  KBStaticOtherViewController.m
//  YaYa
//
//  Created by administrator on 2019/3/19.
//  Copyright © 2019年 msxf. All rights reserved.
//

#import "KBStaticOtherViewController.h"
#import "KBStaticViewController.h"
#import "KBCatogaryViewController.h"

@interface KBStaticOtherViewController ()
@property (nonatomic, weak) NSTimer *timer;
@property (nonatomic, strong) NSThread *thread1;
@end

@implementation KBStaticOtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];

   NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(playInput) userInfo:nil repeats:YES];
    self.timer = timer;
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];


//    extern int c; //全局变量, 可以使用extern来引用
//    NSLog(@"extern c ++++++%d", c);
//
////    extern int d;
////    NSLog(@"extern d ++++++%d", d); d 是用static 修饰, 在生命的文件之外不能使用
//
//    extern int e; // b为局部变量, 不能使用extern 引用
//    NSLog(@"extern e ++++++%d", e);

    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    btn.backgroundColor = [UIColor redColor];

    [btn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:btn];

}

- (void)push{

    
    KBStaticViewController *vc = [[KBStaticViewController alloc]init];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc animated:YES completion:nil];

}
- (void)playInput{
    NSLog(@"ddddd");
}

- (void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
//    [self.timer invalidate];
}


- (void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:animated];
    [self.timer invalidate];
}
- (void)dealloc{

    NSLog(@"delloc");

}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    self.thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(performTask) object:nil];
//    [self.thread1 start];
//}
//
//- (void)performTask
//{
//    __weak typeof(self) weakSelf = self;
//    // 使用下面的方式创建定时器虽然会自动加入到当前线程的RunLoop中，但是除了主线程外其他线程的RunLoop默认是不会运行的，
//    //必须手动调用
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        if ([NSThread currentThread].isCancelled){
//            [weakSelf.timer invalidate];
//        }
//        NSLog(@"timer...");
//    }];
//
//    NSLog(@"runloop before performSelector:%@",[NSRunLoop currentRunLoop]);
//
//    // 区分直接调用和「performSelector:withObject:afterDelay:」区别,下面的直接调用无论是否运行RunLoop一样可以执行，但是后者则不行。
//    //[self caculate];
//    [self performSelector:@selector(caculate) withObject:nil afterDelay:2.0];
//
//    // 取消当前RunLoop中注册测selector（注意：只是当前RunLoop，所以也只能在当前RunLoop中取消）
//    // [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(caculate) object:nil];
//    NSLog(@"runloop after performSelector:%@",[NSRunLoop currentRunLoop]);
//
//    // 非主线程RunLoop必须手动调用
//    [[NSRunLoop currentRunLoop] run];
//
//    NSLog(@"注意：如果RunLoop不退出（运行中），这里的代码并不会执行，因为前面一直在循环，RunLoop本身就是一个循环.");
//}
//
//- (void)caculate
//{
//    for (int i = 0;i < 10;i++)
//    {
//        NSLog(@"%i,%@",i,[NSThread currentThread]);
//        if ([NSThread currentThread].isCancelled)
//        {
//            return;
//        }
//    }
//}

@end
