//
//  KBNotificationViewController.m
//  YaYa
//
//  Created by KBMore on 2020/8/20.
//  Copyright © 2020 msxf. All rights reserved.
//

#import "KBNotificationViewController.h"
#import "KBSon.h"
extern NSString *noti = @"KBNotificationViewControllerNOTI";
@interface KBNotificationViewController ()

@end

@implementation KBNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(log) name:noti object:nil];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

//    [[NSNotificationCenter defaultCenter ] postNotificationName:noti object:nil];
//    NSLog(@"已经发送通知");
    [self log];

}


- (void)log{

    KBSon *son = [[KBSon alloc]init];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:@"aaa" forKey:@"aaakey"];
    
    [dict setValue:@"ddd" forKey:son];
    
    NSDictionary *aaadict = [dict copy];
    
    [dict setObject:@"sonstring" forKey:son];
    
    KBSon *son2 =  [[KBSon alloc]init];
    
    KBSon *son3 =   dict[son2];

    
    NSString *sst = dict[aaadict];
        [[NSUserDefaults standardUserDefaults] setObject:dict forKey:@"testKey"];
        [[NSUserDefaults standardUserDefaults] synchronize];
  
}





//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
////    dispatch_async(dispatch_get_global_queue(0, 0), ^{
////        [[NSNotificationCenter defaultCenter ] postNotificationName:noti object:nil];
//    NSNotificationQueue *queue = [[NSNotificationQueue alloc]initWithNotificationCenter:[NSNotificationCenter defaultCenter]];
//    NSNotification *notify = [[NSNotification alloc]initWithName:noti object:nil userInfo:nil];
//
//
//    [queue enqueueNotification:notify postingStyle:NSPostASAP];
//
////    });
//    NSLog(@"已经发送通知");
//}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
