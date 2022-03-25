//
//  KBCountDownButton.h
//  Finance
//
//  Created by administrator on 2016/11/4.
//  Copyright © 2016年 MaShang Consumer Finance. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KBCountDownButton : UIButton
- (void)fireWithCountTime:(NSInteger)countTime;
- (void)stopTimer;
@end
