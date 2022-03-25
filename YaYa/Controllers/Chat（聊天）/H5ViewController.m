//
//  H5ViewController.m
//  project-1
//
//  Created by administrator on 2018/12/26.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import "H5ViewController.h"
#import <WebKit/WebKit.h>
#import "KBJS.h"
#import "FriendsController.h"
#import <objc/runtime.h>
@interface H5ViewController ()<UIWebViewDelegate,WKNavigationDelegate, KBJS>
@property(nonatomic,strong)JSContext *context;
@property (nonatomic, strong) UIButton *botBtn;
@property (nonatomic, strong) UILabel *lab;
@end

@implementation H5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//
//    CGRect rect = CGRectMake(0, 0, 375, 667);
//    WKWebView *webView = [[WKWebView alloc] initWithFrame:rect];
//    // 设置导航代理，监听网页加载进程
//    webView.navigationDelegate = self;
//    // 将 webView 对象添加到视图
//    [self.view addSubview:webView];
//    // 根据URL发起网络请求
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"www.google.com"]];
//    [webView loadRequest:request];
//
    
    
    UIWebView *v = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 375, 667)];
    [self.view addSubview:v];
//    [v loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://vayh5.msxf.lotest/active/commonEnter?activityType=ngMultActs&retain=aid.20061&activityUrl=1&channel=AYH-APP&vtoken=apph5_cb3c1200-c144-4858-ad0a-81caf06a169c"]]];
//    v.navigationDelegate = self;
//    NSString *pathStr = [[NSBundle mainBundle] pathForResource:@"day5demo" ofType:@"html" inDirectory:nil];
//    NSURL *url = [NSURL fileURLWithPath:pathStr];
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080//day5demo.html"];
    [v loadRequest:[NSURLRequest requestWithURL:url]];
    v.delegate = self;

    
    UIButton*btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 667, 150, 100)];
//    [btn setTitle:@"fssdfasdfasfd" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    class_addProtocol([UIButton class], @protocol(KBJS));
    [self.view addSubview:btn];
    self.botBtn = btn;

    [btn addTarget:self action:@selector(gogo) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(160, 667, 100, 100)];
    [self.view addSubview:lab];
    class_addProtocol([UILabel class], @protocol(KBJS));

    lab.text= @"wenben";
    lab.backgroundColor = [UIColor greenColor];
    self.lab = lab;

}
- (void)toAppLogin:(id)sender{
    NSLog(@"d");
}
-(void)multiplyA:(id)sender andB:(id)sender2{
    NSInteger a = sender;
    NSInteger b = sender2;
    NSInteger c = a * b;
    NSLog(@"%@x%@=%ld",sender,sender2,(long)c );

}
- (void)gogo{
    [self.context evaluateScript:@"_OC_label.text = '啦啦啦啦啦'"];
    [self.context evaluateScript:@"_OC_btn.border = 'yellow'"];
//  FriendsController *vc = [[FriendsController alloc]init];
//    [self.navigationController pushViewController:vc animated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}


-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *url  = request.URL.absoluteString;
    
    
    return  YES;
    
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
  
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
   self.context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    self.context.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue) {
        context.exception = exceptionValue; NSLog(@"%@", exceptionValue);
    };
    
    
    self.context[@"appNative"] =self;

    self.context[@"_OC_btn"] = self.botBtn;

    // 把 label 导出到 JS 环境，在 JS 执⾏行行环境中 label 的名字为 _OC_label，通过这个名 字来调⽤用 label 的 text 属性
    self.context[@"_OC_label"] = self.lab;
    // 通过 JS 修改 label 的 text 属性，执⾏行行完成后 label 的 text 被修改为 '关注知识⼩小 集公众号'
//    [self.context evaluateScript:@"_OC_label.text='关注知识⼩小集公众号'"];
//    self.context[@"_oc_label"] =lab;

}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}
-(void)viewWillDisAppear:(BOOL)animated{
    [super viewWillAppear:animated];
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
