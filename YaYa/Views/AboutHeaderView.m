//
//  AboutHeaderView.m
//  weixin
//
//  Created by zhiwei on 16/1/11.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "AboutHeaderView.h"

@implementation AboutHeaderView


- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"AboutHeaderView" owner:self options:nil].firstObject;
    }
    return self;
}




@end
