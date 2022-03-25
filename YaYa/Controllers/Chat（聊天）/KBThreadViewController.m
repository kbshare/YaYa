//
//  KBThreadViewController.m
//  YaYa
//
//  Created by yawei.zhang on 2021/1/7.
//  Copyright © 2021 msxf. All rights reserved.
//

#import "KBThreadViewController.h"
#import <pthread.h>
@interface KBThreadViewController ()
@property (nonatomic, strong) UIImage *image1;
@property (nonatomic, strong) UIImage *image2;

@end

@implementation KBThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self cjl_testApply];
//    [self groupNotify];
    [self cjl_testSemaphore];
    return;
    pthread_t thread;
    /*
       pthread 属于POSIX 多线程开发框架
       参数
       1：指向线程的指针
       2：线程属性
       3：指向函数的指针
       4：传递给函数的参数

       返回值：特别在C语言框架，非常常见
       如果是0，表示正确 noErr
       如果是非0，表示错误代码


       void * (*)     (void *)
       void * demo    (void  *param)
       返回值  函数指针   参数

       void * 等价于 OC id
    */
    NSString *str = @"我是参数";
    int result = pthread_create(&thread, NULL, &run,(__bridge void *)(@"我是参数"));

    if (result == 1) {
         // 可以把1 换为 noErr
         NSLog(@"OK");
    }else{

         NSLog(@"error: %d",result);
    }


    NSThread *thread1 =[[NSThread alloc]initWithTarget:self selector:@selector(threadTest:) object:@"NSThreadinitWithTarget"];
    [thread1 start];
    return;
    
    
    
    
    thread1.name = @"线程";
    thread1.qualityOfService = NSQualityOfServiceDefault;

    [NSThread detachNewThreadWithBlock:^{
        NSLog(@"%@",[NSThread currentThread]);
    }];

    [NSThread detachNewThreadSelector:@selector(threadTest:) toTarget:self withObject:@"detachNewThreadSelector"];

    [self performSelectorInBackground:@selector(threadTest:) withObject:@"performSelectorInBackground"];

    dispatch_queue_t queue = dispatch_queue_create(0, 0);

    dispatch_async(queue, ^{
        NSLog(@"GCD+++++++%@",[NSThread currentThread]);

    });
//https://www.jianshu.com/p/a26e46d04b32
    
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue1 = dispatch_queue_create("com.kbmore", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_async(group, queue1, ^{
        
        //异步操作1,获取图片
        self.image1 = [UIImage imageNamed:@"head1"];
    });
    
    dispatch_group_async(group, queue1, ^{
        
        //异步操作1,获取图片
        self.image2 = [UIImage imageNamed:@"head2"];

    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        //合成图片
        UIGraphicsBeginImageContext(CGSizeMake(200, 200));
        [self.image1 drawInRect:CGRectMake(0, 0, 200, 100)];
        [self.image2 drawInRect:CGRectMake(0, 100, 200, 100)];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
        [self.view addSubview:imageV];
        imageV.image = image;
    });
 
    
    
    //单例, 一次性执行
    static dispatch_once_t token;
    static KBBaseViewController *vc;
    dispatch_once(&token, ^{
        //创建
    });
    
    
    //栅栏函数
    dispatch_queue_t queue2 = dispatch_queue_create("com.kbmore.zhang", DISPATCH_QUEUE_CONCURRENT);
    
    
    dispatch_async(queue2, ^{
        sleep(1);
        NSLog(@"任务一");

    });
    dispatch_async(queue2, ^{
        NSLog(@"任务二");

    });
    
    dispatch_barrier_sync(queue2, ^{//同步栅栏函数会等待函数中的任务(三)执行完之后才执行后面的任务(四 五)
        sleep(1);
        NSLog(@"任务三");
        
    });
    
    dispatch_async(queue2, ^{
        NSLog(@"任务四");

    });

    NSLog(@"任务五");

    
    dispatch_sync(dispatch_queue_create("ss", DISPATCH_QUEUE_SERIAL), ^{
        NSLog(@"%@ ===== %@",[NSThread currentThread],@"串行队列, 同步函数");
    });
    
}


- (void)groupNotify{
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_queue_t queue1 = dispatch_queue_create(0, 0);//全局并发队列
    dispatch_queue_t queue2 = dispatch_queue_create("ddd", NULL); //串行队列
    dispatch_queue_t queue3 = dispatch_queue_create("sfsf", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue4 = dispatch_queue_create("sfsf", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t quequeMain = dispatch_get_main_queue();
    dispatch_queue_t queue5 = dispatch_get_global_queue(0, 0);//全局并发队列
    
    dispatch_group_enter(group);
    dispatch_async(queue3, ^{
        NSLog(@"dispatch_group_enter任务一");
        dispatch_group_leave(group);
    });
    dispatch_group_enter(group);

    dispatch_async(queue3, ^{
        NSLog(@"dispatch_group_enter任务二");
        dispatch_group_leave(group);
    });
    
    dispatch_group_notify(group, queue3, ^{
        NSLog(@"dispatch_group_notify 任务三");
    });
    
    
    
    
    
    
}

- (void)cjl_testSemaphore{
    /*
     应用场景：同步当锁, 控制GCD最大并发数

     - dispatch_semaphore_create()：创建信号量
     - dispatch_semaphore_wait()：等待信号量，信号量减1。当信号量< 0时会阻塞当前线程，根据传入的等待时间决定接下来的操作——如果永久等待将等到信号（signal）才执行下去
     - dispatch_semaphore_signal()：释放信号量，信号量加1。当信号量>= 0 会执行wait之后的代码

     */
    dispatch_queue_t queue = dispatch_queue_create("CJL", DISPATCH_QUEUE_CONCURRENT);
    
    for (int i = 0; i < 10; i++) {
        dispatch_async(queue, ^{
            NSLog(@"当前 - %d， 线程 - %@", i, [NSThread currentThread]);
        });
    }
    
    //利用信号量来改写
    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    
    for (int i = 0; i < 10; i++) {
        dispatch_async(queue, ^{
            NSLog(@"当前 - %d， 线程 - %@", i, [NSThread currentThread]);
            
            dispatch_semaphore_signal(sem);
        });
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    }
    
}




- (void)cjl_testApply{
    /*
     dispatch_apply将指定的Block追加到指定的队列中重复执行，并等到全部的处理执行结束——相当于线程安全的for循环

     应用场景：用来拉取网络数据后提前算出各个控件的大小，防止绘制时计算，提高表单滑动流畅性
     - 添加到串行队列中——按序执行
     - 添加到主队列中——死锁
     - 添加到并发队列中——乱序执行
     - 添加到全局队列中——乱序执行
     */
    
    dispatch_queue_t queue = dispatch_queue_create("CJL", DISPATCH_QUEUE_SERIAL);
    NSLog(@"dispatch_apply前");
    /**
         param1：重复次数
         param2：追加的队列
         param3：执行任务
         */
    dispatch_apply(10, queue, ^(size_t index) {
        NSLog(@"dispatch_apply 的线程 %zu - %@", index, [NSThread currentThread]);
    });
    NSLog(@"dispatch_apply后");
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSInvocationOperation *op = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(threadTest:) object:@"NSInvocaionOperation"];
   
    NSOperationQueue *opqu = [[NSOperationQueue alloc]init];
    [opqu addOperation:op];
    
    NSBlockOperation *opblock = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"%@ ===== %@",[NSThread currentThread],@"blockOperation");

    }];
    [opqu addOperation:opblock];
}


- (void)threadTest:(id)object{
    NSLog(@"%@ ===== %@",[NSThread currentThread],object);
    
    [self performSelector:@selector(refreshUI:) onThread:[NSThread mainThread] withObject:@"2333" waitUntilDone:YES];  //为yes时, 需要等 onThread的任务执行任务执行完  为NO时, 会直接执行
    NSLog(@"立即执行");
}


- (void)refreshUI:(id)object{
    NSLog(@"主线程刷新UI%@",object);
    sleep(3);
}



void *run(void *param)
{
       for (NSInteger i = 0; i<5; i++)
      {
        NSLog(@"-----buttonClick-----%zd",i);
      }
      return NULL;
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
