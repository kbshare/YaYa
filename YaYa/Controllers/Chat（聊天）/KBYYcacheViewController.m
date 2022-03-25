//
//  KBYYcacheViewController.m
//  YaYa
//
//  Created by yawei.zhang on 2021/1/28.
//  Copyright © 2021 msxf. All rights reserved.
//

#import "KBYYcacheViewController.h"
#import <YYCache/YYCache.h>
#import "KBMan.h"
#import "KBPerson.h"
#import "KBView.h"
#import "KBTextV.h"
#import "KBTapGes.h"


typedef void(^perBlock)(void);
@interface KBYYcacheViewController ()<UITextViewDelegate>
@property (nonatomic, strong) UIImageView *imgV;

@property (nonatomic, strong) UIView *vv;

@property (nonatomic, assign) KBPerson *person;
@property (nonatomic, copy) perBlock perblock;
@end

@implementation KBYYcacheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    id obj = [[NSObject alloc]init];
    void *p = (__bridge void *)obj;
    
    id obj2 = (__bridge id)(p);
    

    
    
//   _person = [[KBPerson alloc] init];
//    _person.name = @"hxg";
//    _person.address = @"11";
    
    //用assign 会立即释放, 造成野指针,访问崩溃
    

    YYCache *personCache = [YYCache cacheWithName:@"personCache"];

     KBPerson *person = [[KBPerson alloc] init];
     person.name = @"hxg";
     person.address = @"11";
    
    //block 引用对象可以对对象进行修改
//    perBlock blk = ^{
//        NSLog(@"%@",blk);
//        person.name = @"fffffff";
//        NSLog(@"%@",person.name);
//    };
//    blk();
//    
//   __block int a11 = 2;
//    perBlock blk2 = ^{
//        a11 = 3;
//    };
//    blk2();
    
    int a = 10;
   void(^block)(void) = ^{
       NSLog(@"CJL - %d", a);
   };
   NSLog(@"%@", ^{
       NSLog(@"CJL - %d", a);
   });

//
//
//
//     [personCache setObject:person
//                     forKey:@"personInfo"];
//
//     NSLog(@"%@",[(KBPerson *)[personCache objectForKey:@"personInfo"] name] );
//
//    YYCache *manCache = [YYCache cacheWithName:@"manCache"];
//
//    KBMan *man= [KBMan new];
//
//    man.city = @"中华人民过河go";
//    [manCache setObject:man forKey:@"man"];
//
//
//    KBMan *man222 = [manCache objectForKey:@"man"];
//    NSLog(@"%@%@",man222,man222.city);
//
//    NSArray * arr = @[@"1",@"2",person];
//
//    NSInteger index = [arr indexOfObject:@"1"];
//
//
//    NSDictionary *dict = [NSDictionary dictionary];
//    [dict setValue:person forKey:@"p"];
//
//
//
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 40,40)];
    [self.view addSubview:imageV];

    UIImage *im1 = kGetImage(@"avatar_man_center");
    UIImage *im2 = kGetImage(@"icon_youxuan");
    //合成图片
    UIGraphicsBeginImageContext(CGSizeMake(40, 40));
    [im1 drawInRect:CGRectMake(0, 0, 40, 40)];
    [im2 drawInRect:CGRectMake(0, 0, 40, 40)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    imageV.image = image;
    self.imgV = imageV;
    
    
    UIView *vv = [[UIView alloc]initWithFrame:CGRectMake(100, 160, 40, 40)];
    [self.view addSubview:vv];
    vv.backgroundColor = [UIColor blueColor];
    self.vv = vv;
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 230, 100, 100)];
    imageView.image = [UIImage imageNamed:@"head2"];

    UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, 1.0);
    [[UIBezierPath bezierPathWithRoundedRect:imageView.bounds cornerRadius:imageView.frame.size.width] addClip];
    [imageView drawRect:imageView.bounds];
    imageView.image = UIGraphicsGetImageFromCurrentImageContext(); //结束画图
    UIGraphicsEndImageContext();
    
    [self.view addSubview:imageView];
    
    
    
    
    KBTextV *textV = [[KBTextV alloc]initWithFrame:CGRectMake(100, 340, 200, 200)];
    textV.text = @"asdflajsdfoijaopfji[qojiweporiqaopfji[qojiweporiqaopfji[qojiweporiqaopfji[qojiweporiquwerrrrrrrrrupoiuseropuapoiseupoiauopsifupoi";
    textV.delegate = self;
    [self.view addSubview:textV];
    
    
    
    KBView *kbV = [[KBView alloc]initWithFrame:CGRectMake(100, 340, 200, 200)];
    [self.view addSubview:kbV];
    kbV.backgroundColor = [UIColor colorWithRed:234/256 green:34/256 blue:23/256 alpha:0.2];

    KBTapGes *tap = [[KBTapGes alloc]initWithTarget:self action:@selector(click)];
    [kbV addGestureRecognizer:tap];
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        NSLog(@"%@",[NSThread currentThread]);
    });
    
    


    [self additionOfString:@"123456" AndString:@"789"];
    
    
    [_imgV addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
    
    
    
    
}

- (void)click{
    NSLog(@"视图点");
}

- (void)textViewDidChange:(UITextView *)textView{
    
    NSLog(@"");
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    NSLog(@"%@",change);
}

- (id)returnData{
    return nil;
}

- (void)kvo{
    CGRect frame = self.imgV.frame;
    CGRect layerFrame = self.vv.layer.presentationLayer.frame;
    CGFloat layX = layerFrame.origin.x;
    CGFloat layY = layerFrame.origin.y;
    NSLog(@"X值%f----Y值%f",layX,layY);
    
}


- (void)shakeAnimationForView:(UIView *)view{
    CALayer *viewLayer = view.layer;
    CGPoint position = viewLayer.position;
    CGPoint left = CGPointMake(position.x - 8, position.y);
    CGPoint right = CGPointMake(position.x + 8, position.y);
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [animation setFromValue:[NSValue valueWithCGPoint:left]];
    [animation setToValue:[NSValue valueWithCGPoint:right]];
    [animation setAutoreverses:YES]; // 平滑结束
    [animation setDuration:0.08];
    [animation setRepeatCount:CGFLOAT_MAX];
    [viewLayer addAnimation:animation forKey:nil];
}


//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//
////    [self shakeAnimationForView:self.imgV];
//  NSString *str =  [self additionOfString:@"123456" AndString:@"789"];
//
//    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(kvo) userInfo:nil repeats:YES];
//
//    NSLog(@"%@",str);
//
//
//    [UIView animateWithDuration:5 animations:^{
//
//        self.vv.frame = CGRectMake(350, 350, 30, 30);
//    }];
//
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


//-  (NSString *)mutiNum1:(NSString *)num1 num2:(NSString *)num2{
//
//    NSArray *arr1 = [self splitString:num1];  //123456
//    NSArray *arr2 = [self splitString:num2];  //4567
//
//
//    for (<#initialization#>; <#condition#>; <#increment#>) {
//        <#statements#>
//    }
//
//
//}


- (NSString*)additionOfString:(NSString*)strOne AndString:(NSString*)strTwo{
    
    NSMutableString *One = [NSMutableString stringWithFormat:@"%@",strOne ];
    NSMutableString *Two = [NSMutableString stringWithFormat:@"%@",strTwo ];
    NSInteger longerLength =0;
    NSInteger t= 0;//两位大数长度差值
    int jin =0;
    NSMutableString *strJ = [NSMutableString new];
    NSMutableString *sum = [NSMutableString new];
// 补位：位数少的用0补齐，使两个字符串位数相等
    if(One.length> Two.length) {
        t = One.length- Two.length;
        for(NSInteger i =0;i < t;i++) {
           [Two insertString:[NSString stringWithFormat:@"0"] atIndex:0];
        }
    }else if(One.length< Two.length) {
        NSInteger t = Two.length- One.length;
        for(NSInteger i =0;i < t;i++) {
           [One insertString:[NSString stringWithFormat:@"0"] atIndex:0];
        }
    }
    longerLength = One.length;
    for(NSInteger i = longerLength -1; i >=0;i--) {
//        NSString *str1 = [One substringWithRange:NSMakeRange(i - 1, 1)];
//        NSString *str2 = [Two substringWithRange:NSMakeRange(i - 1, 1)];
//
//        int int1 = [str1 intValue];
//        int int2 = [str2 intValue];
        
        
        
        unichar onenum = [One characterAtIndex:i];
        unichar twonum = [Two characterAtIndex:i];
        int onum = [[NSString stringWithFormat:@"%c",onenum] intValue];
        int tnum = [[NSString stringWithFormat:@"%c",twonum] intValue];
        int c = onum + tnum +jin;
        int z = c%10; //保留相加的个位
        jin = c/10; //相加的十位
        if(i !=0) {
            [strJ appendFormat:@"%d",z];
        }else{  // 注意是不是最后一位，别把进位数丢了
            [strJ appendFormat:@"%d",c%10];
            if(c/10!=0) {
                [strJ appendFormat:@"%d",c/10];
            }
        }
    }

    // 上面得到的是一个倒序字符串，需要变成正序
    for(NSInteger i = strJ.length-1; i>=0;i--) {
        unichar k = [strJ characterAtIndex:i];
        [sum appendFormat:@"%c",k];
    }
    return sum;
}


-(NSString *)bidnumbstring:(NSString*)a multibyaBignumString:(NSString*)b{
    
    if (a.length==0 || b.length==0) {
        return @"0";
    }
     
    
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:a.length+ b.length];
     
    NSMutableArray *n1 = [NSMutableArray arrayWithCapacity:a.length];

    NSMutableArray *n2 = [NSMutableArray arrayWithCapacity:b.length];
    
    //把char转换成int数组。
    
    for (int i =0; i < a.length; i++){
        NSString *abb = [a substringWithRange:NSMakeRange(i,1)];
        n1[i] = @([abb intValue]);
    }
    for (int i =0; i < b.length; i++){
        NSString *bcc = [b substringWithRange:NSMakeRange(i,1)];
        n2[i] = @([bcc intValue]);
    }

    for (int i = 0; i< a.length; i++) {
        for (int j = 0; j< b.length; j++) {
            result[i+j] =@( [n1[i] intValue]  *[ n2[j] intValue]);
        }
    }

    for (int i = result.count- 1; i > 0; i--) {
        result[i-1]  = @( [result[i-1] intValue] + [result[i] intValue] /10);
        result[i] = @( [result[i] intValue] % 10);
    }

    
    NSString* resultStr = @"";

    for (int i = 0; i < result.count - 1; i++) {

         resultStr = [NSString stringWithFormat:@"%@%@",resultStr,result[i]];

    }

    return resultStr;
    
    return  @"";
}






- (NSArray *)splitString:(NSString *)str{
    NSUInteger length = str.length;

    if (length < 1) {
        return nil;
    }
    NSMutableArray *mArr = [NSMutableArray array];
    for (int i =0; i < str.length; i ++) {
        NSString *charter = [str substringWithRange:NSMakeRange(length, 1)];
        [mArr addObject:charter];
    }
    return mArr;
    
}


@end
