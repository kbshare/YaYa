//
//  KBBlockViewController.m
//  YaYa
//
//  Created by KBMore on 2020/8/20.
//  Copyright © 2020 msxf. All rights reserved.
//

#import "KBBlockViewController.h"
#import "KBSon.h"

typedef void(^MyBlock)();
int height = 10;
@interface KBBlockViewController ()
@property (nonatomic, strong) KBSon *son;
@property (nonatomic, assign) KBSon* assignSon;

@property (nonatomic, strong) MyBlock propertyBlk;
@end

@implementation KBBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    NSLog(@"%@", ^{
        NSLog(@"2222");
    });
    
    int a = 0;
    NSLog(@"%@", ^{
        
        NSLog(@"%@",a);
    });
    
    
    KBSon *son = [[KBSon alloc]init];
    son.name = @"son1";
   __block KBSon *sonB = [[KBSon alloc]init];
    sonB.name = @"sonB";
    
        void (^block)(void) = ^{
            son.name = @"son1111111";
            sonB.name = @"sonBBBBBBB";

        };
    block();
    NSLog(@"son1 %@== sonB %@",son.name, sonB.name);
    //son1 son1111111== sonB sonBBBBBBB
    [KBSon testdemo];// 类方法->[self test]->son元类查找-> 父类(根元类)-> 类方法在根元类中也是实例方法
    
    self.assignSon = nil;
    [self.assignSon testAssign];
    
//    NSMutableArray * marr = [[NSMutableArray alloc] init];
//    NSLog(@"\n 123marr =  %@ \n %p \n %p",marr, marr, &marr);
//    __weak typeof(self) weakSelf = self;
//    void (^block)(void) = ^{
//        [marr addObject:@"2"];
//        NSLog(@"\n %@ \n %p \n %p",marr, marr, &marr);
//    };
//
//    block();
//    NSLog(@"\n marr =  %@ \n %p \n %p",marr, marr, &marr);
//    return;
//
//    KBSon *son = [[KBSon alloc]init];
////    NSLog(@"%lu",(unsigned long)son.retainCount);
////
////    self.son = son;
////    NSLog(@"%lu",(unsigned long)son.retainCount);
////
////    [son release];
////    NSLog(@"%lu",(unsigned long)son.retainCount);
//
//    static NSString * name = @"name";
//
//    MyBlock blck = ^{
//        NSLog(@"%@",height);
//    };
//    NSLog(@"%@",blck);
//
//    int a = 10;
//    MyBlock stackblck = ^{
//        NSLog(@"age = %d",a);
//    };
//    NSLog(@"%@",stackblck);
//
//
//
//    MyBlock kblck = ^{
//        son.name = @"张三";
//    };
//    NSLog(@"-------------------");
//
//    NSLog(@"%@",kblck);
//
//    self.propertyBlk = kblck;
//
//    NSLog(@"%@",kblck);
//
//    NSLog(@"%@",self.propertyBlk);
//    NSLog(@"-------------------");
//
//
//
//    void(^block1)(void)  = ^ {
//        NSLog(@"hello world");
//    };
//    NSLog(@"%@",[block1 class]);
//
//
//    int age = 10;
//    void(^block2)(void) = ^{
//        NSLog(@"age = %d",age);
//    };
//    NSLog(@"%@",[block2 class]);
//
//    void(^block3)(void) = [block2 copy];
//    NSLog(@"%@",[block2 class]);
//
//    NSLog(@"%@",[block3 class]);

//    NSLog(@"%@",[^{
//        NSLog(@"height = %d",height);
//    } copy]);
    


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
