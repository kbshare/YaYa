//
//  KBCatogaryViewController.m
//  YaYa
//
//  Created by administrator on 2019/1/10.
//  Copyright © 2019年 msxf. All rights reserved.
//

#import "KBCatogaryViewController.h"
#import "UIDevice+Help.h"
#import "UIDevice+KBDeviceHelp2.h"

#import "NSString+Hash.h"
#import "NSString+Helpers.h"
#import "KBSon.h"

@interface KBCatogaryViewController ()
@property (nonatomic, strong) NSString *strongStr;
@property (nonatomic, copy) NSString *copysStr;
@property (nonatomic, copy) NSMutableString *mustr;
@end



@implementation KBCatogaryViewController

- (void)viewDidLoad {
    
    KBSon *son = [[KBSon alloc]init];
    
    
//    NSURL *requestUrl = [NSURL URLWithString: @"http://127.0.0.1:3002/api/fe/list"];
//    NSURLSession *session = [NSURLSession sharedSession];
//
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:requestUrl];
//
//    NSURLSessionTask *task = [session dataTaskWithRequest:request
//    completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        if (!error && data) {
//            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//            NSLog(@"response data: %@", dict);
//        }
//    }];
//    [task resume];

 
    [super viewDidLoad];
//    ALog(sfdsf);
//   NSString *s = [[UIDevice currentDevice] isJailbroken];
//    NSLog(@"%@",s);
//    
//    NSMutableDictionary <NSString *, NSString *> *dict = [NSMutableDictionary dictionary];
//    
//    NSLog(@"%@",dict);
    
    NSMutableString *str  =[NSMutableString stringWithFormat:@"测试文字"] ;
//    NSString *str  =@"测试文字";

    self.strongStr = str;
    self.copysStr = str;
    NSLog(@"str %p",str);
    NSLog(@"strong str %@== %p",self.strongStr,self.strongStr);
    NSLog(@"copy str %@==  %p",self.copysStr,self.copysStr);
    
    str = [NSMutableString stringWithFormat:@"该做的文字"] ;
    NSLog(@"str %@== %p",str,str);
    NSLog(@"strong str %@== %p",self.strongStr,self.strongStr);
      NSLog(@"copy str %@==  %p",self.copysStr,self.copysStr);
    self.mustr = [NSMutableString stringWithFormat:@"测试文字"] ;
    
    
    [self  addShadowView];
    
}

- (void)addShadowView{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 89)];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor redColor];
    [view.layer setShadowOpacity:0.6];
    [view.layer setShadowPath:[[UIBezierPath bezierPathWithRect:view.bounds] CGPath]];
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
