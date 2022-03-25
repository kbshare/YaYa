//
//  Friednd.h
//  weixin
//
//  Created by zhiwei on 16/1/11.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Friednd : NSObject


//正文
@property (nonatomic,copy) NSString *content;

//头像
@property (nonatomic,copy) NSString *headImg;

//大图
@property (nonatomic,copy) NSString *picture;

//用户名
@property (nonatomic,copy) NSString *nickname;

-(instancetype)initWithDic:(NSDictionary *)dic;

+(instancetype)friendsModelWithDic:(NSDictionary *)dic;


@end
