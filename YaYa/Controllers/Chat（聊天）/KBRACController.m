//
//  KBRACController.m
//  YaYa
//
//  Created by KBMore on 2021/3/18.
//  Copyright © 2021 msxf. All rights reserved.
//

#import "KBRACController.h"
#import "ReactiveObjC.h"
#import <AudioToolbox/AudioToolbox.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
//#import "NSString+KBEncodeString.m"
#ifndef kScreenFrame
#define kScreenFrame                ([[UIScreen mainScreen] bounds])
#endif
#ifndef kScreenWidth
#define kScreenWidth                (kScreenFrame.size.width)
#endif

#ifndef kScreenHeight
#define kScreenHeight               (kScreenFrame.size.height)
#endif
@interface KBRACController ()

@end

@implementation KBRACController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *labell = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    labell.font = [UIFont systemFontOfSize:22];
    labell.text = @"密码登录";
    [self.view addSubview:labell];
    
    
    
    UIButton *btn = [UIButton buttonWithImage:nil HighImg:nil Title:@"跳数学" TitleFontSize:20 Target:self Action:@selector(btnClick)];
    [btn setFrame:CGRectMake(100, 220, 100, 100)];
    [self.view addSubview:btn];
    btn.backgroundColor = UIColor.blueColor;
    
    [[btn rac_signalForSelector:@selector(btnClick)] subscribeNext:^(RACTuple * _Nullable x) {
        
        NSLog(@"labell 使用rac===");
        
    }];
    
    
    UIButton *btn1 = [UIButton buttonWithImage:nil HighImg:nil Title:@"跳绘本" TitleFontSize:15 Target:self Action:@selector(redClick)];
    [btn1 setFrame:CGRectMake(100, 320, 100, 100)];
    [self.view addSubview:btn1];
    btn1.backgroundColor = UIColor.redColor;
    
    [[btn1 rac_signalForSelector:@selector(redClick)] subscribeNext:^(RACTuple * _Nullable x) {
        
        NSLog(@"labell 使用rac===");
        
    }];
    
    
    
}

- (void)labellClick{
    NSLog(@"labellClick");
}


- (void)btnClick{
    NSURL * url = [NSURL URLWithString:@"palfish-math://"];
    UIApplication *application = [UIApplication sharedApplication];
    
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        
        [application openURL:url options:@{} completionHandler:^(BOOL success) {
            NSLog(@"数学成功");
        }];
        
    }else{
        NSLog(@"数学不可跳转");
    }
    
}

- (void)redClick{
    NSURL * url = [NSURL URLWithString:@"palfish-read://"];
    UIApplication *application = [UIApplication sharedApplication];
    
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        
        [application openURL:url options:@{} completionHandler:^(BOOL success) {
            NSLog(@"绘本成功");
        }];
        
    }else{
        NSLog(@"绘本不可跳转");
    }
}







- (RACSignal *)creatSignal{
    //1、创建信号量
    RACSignal * signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        NSLog(@"创建信号量");
        
        //3、发布信息
        [subscriber sendNext:@"I'm send next data"];
        
        NSLog(@"那我啥时候运行");
        
        return nil;
    }];
    
    return  signal;
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [[self creatSignal] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    CGRect frame = kScreenFrame;
    
    NSLog(@"frame");
    
    RACSignal *singnal =  [self creatSignal];
    
    //元祖,相当于数组
    RACTuple *tuple = [RACTuple tupleWithObjects:@"Tome",@"MIke",@"Jack", nil];
    NSString *t1 = tuple[0];
    NSLog(@"%@",t1);
    
    NSArray *arr = @[@1, @2,@3,@100];
    RACTuple *tu2 = [RACTuple tupleWithObjectsFromArray:arr];
    NSLog(@"%@",tu2);
    
    //    NSString *nilStr;
    //    NSArray *arr11 = @[@1, @2,@3,@100,nilStr];
    //    RACTuple *tu11 = [RACTuple tupleWithObjectsFromArray:arr11 convertNullsToNils:YES];
    //    NSLog(@"%@",tu11);
    
    [tu2.rac_sequence.signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", [NSThread currentThread]);
        NSLog(@"%@", x);
    }];
    
    
    [self demo3];
    [self demo4];
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setMode:AVAudioSessionModeVoiceChat error:nil];
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    
    
    
}
#pragma mark -  字典
- (void)demo3 {
    NSDictionary *dict = @{
        @"name" : @"jack",
        @"age" : @18,
    };
    //    [dict.rac_sequence.signal subscribeNext:^(id  _Nullable x) {
    //        NSLog(@"%@", x);
    //    }];
    //    [dict.rac_sequence.signal subscribeNext:^(RACTuple * _Nullable x) {
    //        NSLog(@"%@", x);
    //
    //    }];
    //    [dict.rac_keySequence.signal subscribeNext:^(id  _Nullable x) {
    //        NSLog(@"rac_keySequence==========%@", x);
    //
    //    }];
    //    [dict.rac_valueSequence.signal subscribeNext:^(id  _Nullable x) {
    //        NSLog(@"%@", x);
    //
    //    }];
    
    [dict.rac_sequence.signal subscribeNext:^(RACTuple * _Nullable x) {
        RACTupleUnpack(NSString *key, NSString *value) = x;
        NSLog(@"%@----%@",key,value);  // name, jack
    }];
    
    
}


#pragma mark -  demo4  字典转模型

- (void)demo4{
    NSArray *arr = @[
        @{@"nikeName" : @"jack",
          @"age" : @18,
          @"city":@"beijing"
        },
        @{@"nikeName" : @"Tome",
          @"age" : @999,
          @"city":@"shanghai"
          
        }
    ];
    
    [[arr.rac_sequence.signal map:^id _Nullable(id  _Nullable value) {
        NSLog(@"%@",value);
        return nil;
    }] toArray];
    
    
    
}



- (void)test{
    /*
     /util/open?scheme=palfish-read://?route=/web?url=
     
     https://test.ipalfish.com/auth-center/app-auth?
     target_atype=13
     &target_src=14
     &target_key=e6a47bf853a80d07
     &target_icon=https://s03.cdn.ipalfish.com/static/app-auth/icons/math.png
     &icon=https://s03.cdn.ipalfish.com/static/app-auth/icons/picturebook.png
     &target_scheme=util/open?scheme=palfish-math://login?from=huiben&type=palfish-math
     
     
     //     */
    //    NSString *target_atype = @"13";
    //    NSString *target_src = @"14";
    //    NSString *target_key = @"e6a47bf853a80d07";
    //    NSString *target_icon = [@"https://s03.cdn.ipalfish.com/static/app-auth/icons/math.png" m80StringByURLEncoding];
    //    NSString *icon = [@"https://s03.cdn.ipalfish.com/static/app-auth/icons/picturebook.png" m80StringByURLEncoding];
    //    NSString *target_scheme = [@"util/open?scheme=palfish-math://login?from=huiben&type=palfish-math" m80StringByURLEncoding];
    //
    //    NSString *subUrl = @"https://test.ipalfish.com/auth-center/app-auth?";
    //    NSString *url = [NSString stringWithFormat:@"%@target_atype=%@&target_src=%@&target_key=%@&target_icon=%@&icon=%@target_scheme=%@",subUrl,target_atype,target_src,target_key,target_icon,icon,target_scheme];
    //
    //
    //    NSString *webUrl = [[NSString stringWithFormat:@"/web?url=%@",url] m80StringByURLEncoding];
    //    NSString *schemeUrl = [[NSString stringWithFormat:@"palfish-read://?route=%@", webUrl] m80StringByURLEncoding];
    //    NSString *route = [NSString stringWithFormat:@"/util/open?scheme=%@",schemeUrl];
    
    
    //    NSURL *url = [NSURL URLWithString:@"palfish-math://login?from=huiben&type=palfish-math"];
    
    NSURL * url = [NSURL URLWithString:@"palfish-math://"];
    UIApplication *application = [UIApplication sharedApplication];
    
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        
        [application openURL:url options:@{} completionHandler:^(BOOL success) {
            NSLog(@"");
        }];
        
    }else{
        NSLog(@"");
    }
    
    
    
    
    
    
    
    
    
    
    
    //    NSString *arg1 = @"/util/open?" ;
    //    NSString *arg2 = @"scheme=palfish-read://" ;
    //    NSString *arg3 = [@"?" m80StringByURLEncoding];
    //    NSString *arg4 = [@"route=/web?url=" m80StringByURLEncoding];
    //    NSString *openScheme = [NSString stringWithFormat:@"%@%@%@%@",arg1,arg2,arg3,arg4];
    //
    //
    //    //https://test.ipalfish.com/auth-center/app-auth/?
    //    NSString *rootUrl = [@"https://test.ipalfish.com/auth-center/app-auth/?" m80StringByURLEncoding];
    //
    //    //&target_atype=13&target_src=14&target_key=e6a47bf853a80d07
    //    NSString *args = [@"&target_atype=13&target_src=14&target_key=e6a47bf853a80d07" m80StringByURLEncoding];
    //
    //
    //    ///&target_scheme=util/open?scheme=palfish-math://login?from=huiben&type=palfish-math
    //    NSString *util = [@"&target_scheme=/util/open?" m80StringByURLEncoding];
    //    NSString *orignAppScheme = [@"scheme=palfish-math://login?"  m80StringByURLEncoding];
    //    NSString *orignAppSchemeArg = [@"from=huiben&type=palfish-math"  m80StringByURLEncoding];
    //
    //    ///&target_scheme=util/open?scheme=palfish-math://login?from=huiben&type=palfish-math
    //    NSString *back_scheme = [NSString stringWithFormat:@"%@%@%@",util,orignAppScheme,orignAppSchemeArg];
    //
    //    //targetIcon  &target_icon=https://s03.cdn.ipalfish.com/static/app-auth/icons/math.png
    //    NSString *targetIcon = [@"&target_icon=https://s03.cdn.ipalfish.com/static/app-auth/icons/math.png" m80StringByURLEncoding];
    //
    //    //thrid icon &icon=https://s03.cdn.ipalfish.com/static/app-auth/icons/picturebook.png
    //    NSString *icon = [@"&icon=https://s03.cdn.ipalfish.com/static/app-auth/icons/picturebook.png" m80StringByURLEncoding];
    //    NSString *route1 = [NSString stringWithFormat:@"%@%@%@%@%@%@%@",openScheme,rootUrl,args,util,back_scheme,targetIcon,icon];
    //
    
    
    
}


@end
