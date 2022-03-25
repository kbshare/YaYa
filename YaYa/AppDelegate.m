//
//  AppDelegate.m
//  weixin
//
//  Created by zhiwei on 16/1/11.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "AppDelegate.h"
#import "CZTabbarController.h"
//#import "AYHUMShareManager.h"
#import "iRate.h"
//#import "GeneratedPluginRegistrant.h"

@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    [iRate sharedInstance].daysUntilPrompt = 1;
    [iRate sharedInstance].usesUntilPrompt = 1;
    
    self.window = [[UIWindow alloc] init];
    
    CZTabbarController *tabbarVC = [[CZTabbarController alloc] init];
    self.window.rootViewController = tabbarVC;
    
    [self.window makeKeyAndVisible];
#if DEBUG
  //iOS
  [[NSBundle bundleWithPath:@"/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle"] load];
 //同时还支持tvOS和MacOS，配置时只需要在/Applications/InjectionIII.app/Contents/Resources/目录下找到对应的bundle文件,替换路径即可
   #endif


//    FlutterEngine *engine = [[FlutterEngine alloc]initWithName:@"delegateEngine"];
//    self.engine = engine;
//    [engine runWithEntrypoint:@"connactsAPPEntry" initialRoute:@"mine"];
////    [engine run];
//    [GeneratedPluginRegistrant registerWithRegistry:engine];
    return YES;
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
   
//    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
//    if (!result) {
//        // 其他如支付等SDK的回调
//    }
    return YES;
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
