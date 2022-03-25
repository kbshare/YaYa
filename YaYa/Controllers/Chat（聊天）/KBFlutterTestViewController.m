//
//  KBFlutterTestViewController.m
//  YaYa
//
//  Created by KBMore on 2021/4/21.
//  Copyright © 2021 msxf. All rights reserved.
//

#import "KBFlutterTestViewController.h"
//#import <Flutter/Flutter.h>
#import "AppDelegate.h"
#import "CommonMacro.h"

@interface KBFlutterTestViewController ()

@end

@implementation KBFlutterTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithFrame:CGRectMake(40, 40, 300, 40)  buttonWithTitle:@"使用缓存flutter engine" KB_colortitleColorString:@"#ffffff" BackgroundImage:nil TitleFontSize:18 Target:self Action:@selector(huancunClick)];
    btn.backgroundColor = UIColor.blueColor;
    [self.view addSubview:btn];
    
    
    
    UIButton *btn1 = [UIButton buttonWithFrame:CGRectMake(40, 90, 300, 40)  buttonWithTitle:@"使用隐含的flutter engine" KB_colortitleColorString:@"#ffffff" BackgroundImage:nil TitleFontSize:18 Target:self Action:@selector(yinhanClick)];
    btn1.backgroundColor = UIColor.redColor;
    [self.view addSubview:btn1];
    // Do any additional setup after loading the view.
}
//
///// 这种是使用了缓存的FlutterEngine 需要调用flutter 的run方法
//- (void)huancunClick{
//
//
//    FlutterViewController *flutterVC =  [[FlutterViewController alloc]initWithEngine:APP.engine nibName:nil bundle:nil];
//    flutterVC.modalPresentationStyle = UIModalPresentationFullScreen;
//    [self  presentViewController:flutterVC animated:YES completion:nil];
//
//
//
//    // 和 flutter端 channel name 命名要相同,@"com.kbmore.yachannel"
//    FlutterMethodChannel* channel = [FlutterMethodChannel
//                                             methodChannelWithName:@"com.kbmore.yachannel"
//                                     binaryMessenger:(id<FlutterBinaryMessenger>) flutterVC];
//
//
//
//    __weak typeof(self) weakself  =self;
//    __weak typeof(channel) weakChannel  =channel;
///*  fluter端的调用原生方法   method_channel_page.dart文件中
// onPressed: () async {
//               var result = await YaMethodChannel()
//                   .closeFlutterChannel
//                   .invokeMethod('sendData', {'name': 'laomeng', 'age': 18});
//               var name = result['name'];
//               var age = result['age'];
//               setState(() {
//                 _data = '$name,$age';
//               });
//             },
// */
//
//    [channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
//        NSString *method = call.method; //解析flutter 调用的方法,, 根据名字调用不同的原生方法
//        id arguments = call.arguments; //解析flutter 调用的方法所传入的参数
//
//        if ([method isEqualToString: @"sendData"]) {
//            result(@{@"name":@"原生端传出的名字",@"age":@1}); //使用result进行回调给flutter
//        }
//
//        if ([method isEqualToString: @"closeFlutter"]) {
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [weakself dismissViewControllerAnimated:YES completion:nil];
//
//            });
//        }
//
//        [weakself newThread:weakChannel];
//
//    }];
//
//}
//
//- (void)newThread:(FlutterMethodChannel *)channel{
//    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//
//        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
//        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//
//        NSString *currentDate = [formatter stringFromDate:[NSDate date]];
//
//        [channel invokeMethod:@"timer" arguments:@{@"time":currentDate}];
//
///*  flutter 对应的接受方法   (method_channel_page.dart文件中)
// void initState() {
//     super.initState();
//     YaMethodChannel().closeFlutterChannel.setMethodCallHandler((call) {
//       setState(() {
//         if (call.method == 'timer') {
//           _time = call.arguments['time'];
//         } else {
//           print('其他方法');
//         }
//       });
//     });
// */
//
//    }];
//    [[NSRunLoop currentRunLoop] run];
//}
//
//
//
//#pragma mark -  BasicMessageChannel 交互方式
////(隐含的FlutterEngine 和 缓存FlutterEngine 对交互方式没关系, 这里只是例子)
//
///// 这种是使用隐含的FlutterEngine, 隐含的FlutterEngine会增加显示flutter ui的时间, 通常不建议这样做，如果很少显示 Flutter 屏幕，没有好的方法来确定何时启动Dart VM以及何时Flutter不需要在视图控制器之间保持状态  --    不需要调用flutter 的run方法
//- (void)yinhanClick{
//    FlutterViewController *flutterVC = [[FlutterViewController alloc]initWithProject:nil nibName:nil bundle:nil];
//    flutterVC.modalPresentationStyle = UIModalPresentationFullScreen;
//    [self  presentViewController:flutterVC animated:YES completion:nil];
//
//
//
//    FlutterBasicMessageChannel *msgChannel =
//    [FlutterBasicMessageChannel messageChannelWithName:@"com.kbmore.yamessagechannel" binaryMessenger:flutterVC.binaryMessenger];
//
//
//    __weak typeof(self) weakself  =self;
//    __strong typeof(msgChannel) weakMsgChannel  =msgChannel;
//
//    [msgChannel setMessageHandler:^(id  _Nullable message, FlutterReply  _Nonnull callback) {
//
//        NSLog(@"%@",message);
//
//
//        callback(@{@"name":@"原生端传出的名字",@"age":@1});
//        [weakself newThreadBasicChannel:weakMsgChannel];
//
//
//    }];
//
//
//
//
//
//}
//
//
//
//
//
//
//- (void)newThreadBasicChannel:(FlutterBasicMessageChannel *)channel{
//    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//
//        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
//        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//
//        NSString *currentDate = [formatter stringFromDate:[NSDate date]];
//
//        [channel sendMessage:@{@"msgtimer":currentDate}];
//
///*  flutter 对应的接受方法   (method_channel_page.dart文件中)
// void initState() {
//     super.initState();
//     YaMethodChannel().closeFlutterChannel.setMethodCallHandler((call) {
//       setState(() {
//         if (call.method == 'timer') {
//           _time = call.arguments['time'];
//         } else {
//           print('其他方法');
//         }
//       });
//     });
// */
//
//    }];
//    [[NSRunLoop currentRunLoop] run];
//}
//
//









@end
