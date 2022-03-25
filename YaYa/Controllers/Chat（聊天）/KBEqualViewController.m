//
//  KBEqualViewController.m
//  YaYa
//
//  Created by yawei.zhang on 2021/2/23.
//  Copyright © 2021 msxf. All rights reserved.
//

#import "KBEqualViewController.h"

@interface KBEqualViewController ()

@end

@implementation KBEqualViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *str = @"12345";
    NSString *str1 = @"12345";
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSString *str = @"12345";
   const NSString *str1 = @"12345";
    BOOL a = (str == str1);
    NSLog(@"%d",a);
    
    BOOL b = [str isEqual:str1];
    NSLog(@"%d",b);
    
    BOOL c = [str isEqualToString:str1];
    NSLog(@"%d",c);
    
    BOOL d = [self isPowerTarget:16];
    NSLog(@"%d",d);
    [self test];
    [self semaphoreTest];
}

- (BOOL)isPowerTarget:(NSInteger )a{
    
    return (a &(a-1) == 0);
}


#pragma mark -  信号量使用
- (void)semaphoreTest{
    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"任务1");
        dispatch_semaphore_signal(sem);
    });
    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);//sem <=0 会阻塞后续任务
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"任务2");
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"任务3");
    });
    NSLog(@"任务4");
    
    //最后执行顺序 1 4 (2 3或3 2)

}


- (void)test{
    dispatch_queue_t serQueue = dispatch_queue_create("com.msxf.ayh", NULL);
    dispatch_sync(serQueue, ^{
        NSLog(@"lkkkkk");
        dispatch_async(serQueue, ^{
            NSLog(@"fsdfdssssssss");
        });
    });
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
