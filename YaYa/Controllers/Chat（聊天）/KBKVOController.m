//
//  KBKVOController.m
//  YaYa
//
//  Created by KBMore on 2019/11/27.
//  Copyright © 2019 msxf. All rights reserved.
//

#import "KBKVOController.h"
#import "KBPerson.h"
#import <objc/runtime.h>
#import "NSObject+kb_MethodSwizzling.h"
#import "KBMan.h"
@interface KBKVOController ()

@property (nonatomic, strong) NSMutableArray *array;

@property (nonatomic, strong) KBPerson *person;
@property (nonatomic, strong) KBMan *man;
@end

@implementation KBKVOController

void *nameContext = "nameContext";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.person = [[KBPerson alloc]init];
    self.man = [[KBMan alloc]init];
    [self.person addObserver:self forKeyPath:@"currentProcess" options:(NSKeyValueObservingOptionNew) context:NULL];
//
    [self.man addObserver:self forKeyPath:@"city" options:NSKeyValueObservingOptionNew context:nameContext];
//    [self.array addObserver:self forKeyPath:@"array" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
//    [self addObserver:self forKeyPath:NSStringFromSelector(@selector(array)) options:(NSKeyValueObservingOptionNew) context:nil];
    
    
    UIScrollView *scv = [[UIScrollView alloc]init];
    [self.view addSubview:scv];
    
    [scv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(FIT(100));
        
        make.bottom.equalTo(self.view.mas_bottom).offset(-FIT(100));
    }];
    
    scv.backgroundColor= [UIColor redColor];
    //    [scv setContentSize:CGSizeMake(100, 400)];
    
    UILabel *label= [[UILabel alloc]init];
    [scv addSubview:label];
    label.font = AYHFont(25);
    label.textColor = BLACK_COLOR;
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor yellowColor];
    label.text = @"asdfasflsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖lsdfjl拉三等奖";
    [scv addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(scv);
        make.left.right.equalTo(self.view);
        
        //        make.height.equalTo(@FIT(100));
    }];
    
    [label setNeedsLayout];
    [label layoutIfNeeded];
    CGSize size = [self sizeWithText:label.text font:AYHFont(25) maxSize:CGSizeMake(SCREEN_WIDTH, MAXFLOAT)];
    scv.contentSize = CGSizeMake(label.frame.size.width, size.height) ;
    
    
    [scv setNeedsLayout];
    [scv layoutIfNeeded];
    
    //    KBPerson *person = [[KBPerson alloc]init];
    //    NSLog(@"class-withOutKVO: %@ \n", object_getClass(person));
    //     NSLog(@"setterAdress-withOutKVO: %p \n", [person methodForSelector:@selector(setName:)])
    //    NSLog(@"setterAdress-withOutKVO: %p \n", [person methodForSelector:@selector(setAddress:)])
    //
    //    [person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    //    NSLog(@"class-KVO: %@ \n", object_getClass(person));
    //     NSLog(@"setterAdress-KVO: %p \n", [person methodForSelector:@selector(setName:)])
    //    NSLog(@"setterAdress-KVO: %p \n", [person methodForSelector:@selector(setAddress:)])
    
    
}


- (NSMutableArray *)array {
    if (!_array) {
        _array = [NSMutableArray array];
    }
    return _array;
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //    [self.array addObject:@"3"];
    //    NSLog(@"%@",self.array);
//    static NSInteger a = 0;
//    a++;
//
//    //这一步特别重要
//    NSMutableArray *tempArray = [self mutableArrayValueForKey:NSStringFromSelector(@selector(array))];
//    if (1 == a) {//插入一条
//        [tempArray addObject:[NSString stringWithFormat:@"NewData- %tu",a]];
//    } else if (2 == a) {//修改一条
//        tempArray[0] = [NSString stringWithFormat:@"NewData- %tu",a];
//    } else if (3 == a) {
//        [tempArray removeAllObjects];
//    }
//
//    self.person.currentProcess += 10;
//    self.person.currentData += 10;
//    self.person.totalData  += 1;
    
    [self.man willChangeValueForKey:@"city"];
    _man.city = @"ddddddd";
    [self.man didChangeValueForKey:@"city"];

}


/**
 计算文字的尺寸
 */
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName: font};
    return  [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == nameContext) {
        NSLog(@"");
        
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

//1、合二为一的观察方法
+ (NSSet<NSString *> *)keyPathsForValuesAffectingValueForKey:(NSString *)key{
    
    
    NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
    if ([key isEqualToString:@"currentProcess"]) {
        NSArray *affectingKeys = @[@"totalData", @"currentData"];
        keyPaths = [keyPaths setByAddingObjectsFromArray:affectingKeys];
    }
    return keyPaths;
}

//2、注册KVO观察

//3、触发属性值变化


//4、移除观察者
- (void)dealloc{
    [self.person removeObserver:self forKeyPath:@"currentProcess"];
}








@end
