//
//  ChatController.m
//  weixin
//
//  Created by zhiwei on 16/1/11.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "ChatController.h"
#import "KBGuaGuaLeViewController.h"
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
#define PopViewW 100
#define PopViewH 200
#define Margin   10
#import "KBCAShapeLayerViewController.h"
#import "KBNSEnumeratorViewController.h"
#import "KBPlistFileViewController.h"
#import "H5ViewController.h"
#import "KBCatogaryViewController.h"
#import "KBStaticViewController.h"
#import "KBStaticOtherViewController.h"
#import "KBBlockViewController.h"
#import "KBThreadViewController.h"

#import "KBGCDViewController.h"
#import "KBAttributeViewController.h"
#import <objc/runtime.h>
#import "KBSon.h"
#import "KBFPSLabel.h"
#import "KBStringReverseViewController.h"
#import "UIButton+KBEnlargeTouchArea.h"
#import "KBEqualViewController.h"
#import "KBSVProgressController.h"
#import "YaYa-Bridging-Header.h"
#import "YaYa-Swift.h"
#import "KBYYModelViewController.h"
@interface ChatController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak)UIView *coverView;
@property (nonatomic,weak)UIView *popView;

@property (nonatomic, strong) UITableView *tabView;
@property (nonatomic, strong) NSArray<NSDictionary *> *viewCotrollersData;
@end

@implementation ChatController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableView];
    
    [self setUpNav];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 200)];
    [self.view addSubview:btn];
    btn.backgroundColor = UIColor.redColor;
        [self.view insertSubview:btn atIndex:0];
    [btn addTarget:self action:@selector(tapbtn) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 300, 100, 200)];
    [self.view addSubview:btn1];
    btn.backgroundColor = UIColor.blueColor;
        [self.view insertSubview:btn1 atIndex:0];
    [btn addTarget:self action:@selector(tapbtn) forControlEvents:UIControlEventTouchUpInside];
    
    NSDictionary *deic = @{@"key1":@"value1", @"key2":@""};
    NSMutableDictionary *dict2 = [NSMutableDictionary dictionary];
    
    [dict2 addEntriesFromDictionary:deic];
    NSLog(@"%@",dict2);
    
    NSString *em = @"";
    if (em) {
        NSLog(@"");
    }
    
    //    unsigned int count = 0;
    //    Ivar *ivars = class_copyIvarList([self class], &count);
    //    for (int i = 0; i < count; i++) {
    //        Ivar ivar = ivars[i];
    //        const char *name = ivar_getName(ivar);
    //        NSLog(@"%s",name);
    //    }
    
    //    KBFPSLabel *label = [[KBFPSLabel alloc]initWithFrame:CGRectMake(0, 100, 80,80 )];
    //    [self.view addSubview:label];
    //
    //    [self presentViewController:[[KBCAShapeLayerViewController alloc]init] animated:NO completion:nil];
    //    [self.navigationController pushViewController: [[KBStringReverseViewController alloc]init] animated:YES];
    
    
    //    [self transmitMsg];
    SwiftPerson *person = [[SwiftPerson alloc]init];
    NSString * name = [person getPersonName];
    NSLog(@"%@",name);
    
}


- (void)tapbtn{
    
    KBCAShapeLayerViewController *vc = [[KBCAShapeLayerViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

//KVC实现高阶消息传递

- (void)transmitMsg{
    NSArray *arrStr = @[@"english", @"franch", @"chinese",@"taiwan"];
    NSArray *arrCapStr = [arrStr valueForKey:@"capitalizedString"];
    
    for (NSString *str in arrCapStr) {
        NSLog(@"%@", str);
    }
    
    NSArray *arrCapStrLength = [arrCapStr valueForKeyPath:@"capitalizedString.length"];
    for (NSNumber *length in arrCapStrLength) {
        NSLog(@"%ld", (long)length.integerValue);
    }
}

//********打印结果********
//2020-10-27 11:33:43.377672+0800 CJLCustom[60035:6380757] English
//2020-10-27 11:33:43.377773+0800 CJLCustom[60035:6380757] Franch
//2020-10-27 11:33:43.377860+0800 CJLCustom[60035:6380757] Chinese
//2020-10-27 11:33:43.378233+0800 CJLCustom[60035:6380757] 7
//2020-10-27 11:33:43.378327+0800 CJLCustom[60035:6380757] 6
//2020-10-27 11:33:43.378417+0800 CJLCustom[60035:6380757] 7

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)setUpNav{
    
    //NSString *s = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor greenColor]}];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightBarbutttonClick)];
    self.navigationItem.rightBarButtonItem = rightItem;
}
//获取可变颜色图片
-(UIImage *)imageWithBgColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}

- (void)setUpTableView{
    _tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH-64) style:UITableViewStylePlain];
    _tabView.delegate =(id <UITableViewDelegate>) self;
    _tabView.dataSource = (id <UITableViewDataSource>) self;
    [self.view addSubview:_tabView];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.viewCotrollersData.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell  = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"d"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",self.viewCotrollersData[indexPath.row][@"title"] ];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIViewController *vc = [[NSClassFromString(self.viewCotrollersData[indexPath.row][@"vc"]) alloc]init];
    vc.title = self.viewCotrollersData[indexPath.row][@"title"];
    NSString *tip = [NSString stringWithFormat:@"🆘self.viewCotrollersData中第%ld个的VC不存在🆘",indexPath.row];
    NSAssert(vc, tip);
    
    [self.navigationController pushViewController:vc animated:YES];
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSLog(@"%f",_tabView.contentOffset.y);
    
    [self.navigationController.navigationBar setBackgroundImage:[self imageWithBgColor:[UIColor colorWithRed:1 green:0 blue:0 alpha:_tabView.contentOffset.y/30]] forBarMetrics:UIBarMetricsDefault];
    
}



-(void)rightBarbutttonClick{
    
    //添加蒙板
    UIView *coverView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    coverView.backgroundColor = [UIColor whiteColor];
    coverView.alpha = 0.02;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    [coverView addGestureRecognizer:tap];
    [self.tabBarController.view addSubview:coverView];
    self.coverView = coverView;
    
    //添加气泡view
    UIView *popView = [[UIView alloc] init];
    popView.backgroundColor = [UIColor blackColor];
    //气泡X值
    CGFloat popViewX = ScreenW - PopViewW - Margin;
    //设置frame
    popView.frame = CGRectMake(popViewX, Margin+64, PopViewW, PopViewH);
    [self.tabBarController.view addSubview:popView];
    self.popView = popView;
    
    //添加气泡上的button
    UIButton *popBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    popBtn.backgroundColor = [UIColor redColor];
    popBtn.frame = CGRectMake(10, 50, 80, 10);
    [popBtn addTarget:self action:@selector(tapClick) forControlEvents:UIControlEventTouchUpInside];
    [popView addSubview:popBtn];
    
}


-(void)tapClick{
    [self.coverView removeFromSuperview];
    [self.popView removeFromSuperview];
}
#pragma mark - getters and setters
- (NSArray<NSDictionary *> *)viewCotrollersData{
    
    if (!_viewCotrollersData) {
        NSArray *arr = [NSArray array];
        arr = @[
            @{
                @"title":@"Flutter使用",
                @"vc":@"KBFlutterTestViewController"
            },
            @{
                @"title":@"SVProgress使用",
                @"vc":@"KBSVProgressController"
            },
            @{
                @"title":@"YYModel使用",
                @"vc":@"KBYYModelViewController"
            },
            
            @{
                @"title":@"RAC使用",
                @"vc":@"KBRACController"
            },
            
            @{
                @"title":@"textfiled使用",
                @"vc":@"KBTestTextfiledControllerViewController",
            },
            @{
                @"title":@"多线程使用",
                @"vc":@"KBThreadViewController",
            },
            
            @{
                @"title":@"equalto 和 ==",
                @"vc":@"KBEqualViewController",
            },
            @{
                @"title":@"YYCache使用",
                @"vc":@"KBYYcacheViewController",
            },
            
            @{
                @"title":@"字符串反转",
                @"vc":@"KBStringReverseViewController",
                
            },
            @{
                @"title":@"ShapeLayer效果",
                @"vc":@"KBCAShapeLayerViewController"
            },
            
            @{
                @"title":@"刮刮卡效果",
                @"vc":@"KBCAShapeLayerViewController"
            },
            @{
                @"title":@"NSEnumerator遍历使用",
                @"vc":@"KBNSEnumeratorViewController"
            },
            @{
                @"title":@"Plist文件读写",
                @"vc":@"KBPlistFileViewController"
            },
            @{
                @"title":@"H5aviableStatus",
                @"vc":@"H5ViewController"
            },
            @{
                @"title":@"KBCatogaryViewControllert调用顺序",
                @"vc":@"KBCatogaryViewController"
            },
            @{
                @"title":@"static使用",
                @"vc":@"KBStaticViewController"
            },
            @{
                @"title":@"js",
                @"vc":@"H5ViewController"
            },
            @{
                @"title":@"KVO",
                @"vc":@"KBKVOController"
            },
            @{
                @"title":@"GCD使用",
                @"vc":@"KBGCDViewController"
            },
            @{
                @"title":@"MBProgress使用",
                @"vc":@"KBMBProgressViewController"
            },
            @{
                @"title":@"定时器循环引用",
                @"vc":@"KBStaticOtherViewController",
            },
            @{
                @"title":@"通知异步还是同步",
                @"vc":@"KBNotificationViewController",
            },
            @{
                @"title":@"Block使用及原理",
                @"vc":@"KBBlockViewController",
            },
            @{
                @"title":@"富文本使用",
                @"vc":@"KBAttributeViewController",
            },
            @{
                @"title":@"定时器使用",
                @"vc":@"KBTimerViewController",
            },
            
            
        ];
        
        
        
        _viewCotrollersData= arr;
    }
    return _viewCotrollersData;
}
- (CGRect)rectForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGRect cellRect = [self.tabView rectForRowAtIndexPath:indexPath];
    
    BOOL visible =  cellRect.origin.y - self.tabView.contentOffset.y >self.tabView.bounds.size.height;
    
    return cellRect;
}
- (NSArray *)indexPathsForVisibleRows{
    
    NSLog(@"");
    return nil;
}



@end
