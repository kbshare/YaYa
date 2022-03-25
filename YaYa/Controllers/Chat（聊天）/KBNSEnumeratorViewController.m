//
//  KBNSEnumeratorViewController.m
//  YaYa
//
//  Created by administrator on 2018/11/30.
//  Copyright © 2018年 msxf. All rights reserved.
//

#import "KBNSEnumeratorViewController.h"
#import "UIButton+KBEnlargeTouchArea.h"
@interface KBNSEnumeratorViewController ()

@end

@implementation KBNSEnumeratorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WHITE_COLOR;
    //https://www.jianshu.com/p/5fe6d1b4d4b2
    [self addArrayBtn];
    [self addDictionaryBtn];
    [self addSetBtn];
}
- (void)addArrayBtn{
    UIButton *btn = [[UIButton alloc]init];
    btn.frame = CGRectMake(0, 200, 300, 50);
    CGPoint btnCenter = CGPointMake(self.view.center.x, btn.frame.origin.y + 25);
    btn.center = btnCenter; btn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:btn]; [btn setTitle:@"NSArray中NSEnumerator用法" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(didClickArrayBtn) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didClickArrayBtn{
    /* - (NSEnumerator<ObjectType> *)objectEnumerator;
     //正向遍历数组 - (NSEnumerator<ObjectType> *)reverseObjectEnumerator;
     //反向遍历数组 */
    NSArray *array = @[@"hehe",@"xixi",@"heihei",@"wuwu",@"lala",@"haha"];
    NSEnumerator *enumerator = [array objectEnumerator];
    NSString *obj;
    while (obj = [enumerator nextObject]) {
        NSLog(@"数组正序值开始打印：%@\n",obj);
        
    }
    NSLog(@"✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅");

    NSEnumerator *reverseEnumerator = [array reverseObjectEnumerator];
    id reverseObj;
    while (reverseObj = [reverseEnumerator nextObject]) { NSLog(@"数组逆序值开始打印：%@\n",reverseObj);
        
    }
    
}
- (void)addDictionaryBtn{
    UIButton *btn = [[UIButton alloc]init];
    btn.frame = CGRectMake(0, 300, 300, 50);
    CGPoint btnCenter = CGPointMake(self.view.center.x, btn.frame.origin.y + 25);
    btn.center = btnCenter;
    btn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:btn];
    [btn setTitle:@"NSDictionary中NSEnumerator用法" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(didClickDictionaryBtn) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)didClickDictionaryBtn{
    /* - (NSEnumerator<KeyType> *)keyEnumerator;
     //获取所有key值 - (NSEnumerator<ObjectType> *)objectEnumerator;
     //获取所有value值 */
    NSDictionary *dict = @{@"name":@"zhangsan",@"age":@(18),@"height":@(173.5)};
    NSEnumerator *keyEnumerator = [dict keyEnumerator];
    NSString *key;
    while (key = [keyEnumerator nextObject]) {
        NSLog(@"字典key值开始打印：%@\n",key);
        
    }
    NSEnumerator *objEnumerator = [dict objectEnumerator];
    id obj;
    while (obj = [objEnumerator nextObject]) {
        NSLog(@"字典value值开始打印：%@\n",obj);
        
    }
    
}
- (void)addSetBtn{ UIButton *btn = [[UIButton alloc]init]; btn.frame = CGRectMake(0, 400, 300, 50); CGPoint btnCenter = CGPointMake(self.view.center.x, btn.frame.origin.y + 25); btn.center = btnCenter; btn.backgroundColor = [UIColor orangeColor]; [self.view addSubview:btn]; [btn setTitle:@"NSSet中NSEnumerator用法" forState:UIControlStateNormal]; [btn addTarget:self action:@selector(didClickSetBtn) forControlEvents:UIControlEventTouchUpInside]; }
- (void)didClickSetBtn{ /* - (NSEnumerator<ObjectType> *)objectEnumerator; //获取所有元素的值，并且是无序的 */ NSSet *set = [[NSSet alloc]initWithObjects:@"hehe",@"xixi",@"heihei",@"wuwu",@"lala",@"haha",nil]; NSEnumerator *enumerator = [set objectEnumerator]; id obj; while (obj = [enumerator nextObject]) { NSLog(@"NSSet中value值开始打印：%@\n",obj); } }



@end
