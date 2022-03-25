//
//  KBTimerViewController.m
//  YaYa
//
//  Created by yawei.zhang on 2020/12/30.
//  Copyright © 2020 msxf. All rights reserved.
//

#import "KBTimerViewController.h"
#import "KBTargetProxy.h"
#import "NSTimer+KBCycleHelper.h"
@interface KBTimerViewController ()
@property (nonatomic, strong) NSTimer *timer5;

@property (nonatomic, strong) NSTimer *timer4;

@property (nonatomic, strong) NSTimer *timer3;
@property (nonatomic, strong) NSTimer *timer2;
@end

@implementation KBTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    NSTimer *timer = [NSTimer timerWithTimeInterval:3 repeats:YES block:^(NSTimer * _Nonnull timer) {
    //        NSLog(@"打印 timer  timerWithTimeInterval");
    //    }];
    //    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    
    //   self.timer2 = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(secTimerAction:) userInfo:nil repeats:YES];
    
    
    
    //  self.timer3 = [NSTimer scheduledTimerWithTimeInterval:3 target:[KBTargetProxy proxyWithTarget:self] selector:@selector(secTimerAction222:) userInfo:nil repeats:YES];
    //
    //    self.timer4 = [NSTimer scheduledTimerWithTimeInterval:3 target:[[KBTargetProxy alloc]initWithTarget:self] selector:@selector(secTimerAction222:) userInfo:nil repeats:YES];
//    self.timer5 = [NSTimer kb_scheduledTimerWithTimeInterval:3 repeats:YES block:^() {
//        NSLog(@"Timer55555555555555")
//
//    }];
    
    
    //     CADisplayLink 同NSTimer 也会造成循环引用无法释放问题
//    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:[KBTargetProxy proxyWithTarget:self] selector:@selector(linkFunc:)];
//    link.frameInterval = 180;
//    [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
//
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        CADisplayLink *link = [CADisplayLink displayLinkWithTarget:[KBTargetProxy proxyWithTarget:self] selector:@selector(linkFunc2222:)];
//        link.frameInterval =120;
//        [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
//        NSLog(@"%@",[NSThread currentThread]);
//        [[NSRunLoop currentRunLoop] run];
//    });
//
//    NSThread *pthread = [[NSThread alloc]initWithTarget:self selector:@selector(creadThread) object:nil];
//
//    [pthread start];
    

//
//    dispatch_source_t time = dispatch_source_create(&_dispatch_source_type_timer, 0,0, dispatch_get_main_queue());
//    dispatch_source_set_timer(time, DISPATCH_TIME_NOW, 1.0, 0);
//
//    dispatch_source_set_event_handler(time, ^{
//
//        NSLog(@"%@",[NSThread currentThread]);
//    });
//    dispatch_resume(time);
    
    dispatch_queue_t queue = dispatch_get_main_queue();
      
    dispatch_source_t timer = dispatch_source_create(&_dispatch_source_type_timer, 0, 0, queue);
      
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
      
    dispatch_source_set_event_handler(timer, ^{
          NSLog(@"%@",[NSThread currentThread]);
      });
      
    dispatch_resume(timer);
    
    
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    dispatch_queue_t queue = dispatch_get_main_queue();
      
    dispatch_source_t timer = dispatch_source_create(&_dispatch_source_type_timer, 0, 0, queue);
      
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
      
    dispatch_source_set_event_handler(timer, ^{
          NSLog(@"%@",[NSThread currentThread]);
      });
      
    dispatch_resume(timer);
    
    
}
- (void)creadThread{
    //  self.timer3 = [NSTimer scheduledTimerWithTimeInterval:3 target:[KBTargetProxy proxyWithTarget:self] selector:@selector(secTimerAction222:) userInfo:nil repeats:YES];
    
    
//    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:[KBTargetProxy proxyWithTarget:self] selector:@selector(linkFunc2222:)];
//    link.frameInterval = 180;
//    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
//
//    [link addToRunLoop:runloop forMode:NSRunLoopCommonModes];
//    [runloop run];
//    NSLog(@"%@",[NSThread currentThread]);
//
}



- (void)linkFunc2222:(CADisplayLink *)link{
    NSLog(@"刷新22222222222");
}


- (void)linkFunc:(CADisplayLink *)link{
    NSLog(@"刷新");
}

- (void)secTimerAction:(NSTimer *)timer{
    NSLog(@"打印 secTimer scheduledTimerWith");
}


- (void)secTimerAction222:(NSTimer *)timer{
    NSLog(@"打印 secTimer2222 scheduledTimerWith");
    
}

- (void)dealloc{
    [self.timer5 invalidate];
    self.timer5 = nil;
    
    //        [self.timer4 invalidate];
    //        self.timer4 = nil;
    
    //    [self.timer3 invalidate];
    //    self.timer3 = nil;
    
    //    [self.timer2 invalidate];
    //    self.timer2 = nil;
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
