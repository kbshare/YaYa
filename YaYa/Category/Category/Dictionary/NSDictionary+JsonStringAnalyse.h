//
//  NSDictionary+JsonStringAnalyse.h
//  msqb
//
//  Created by administrator on 2017/8/29.
//  Copyright © 2017年 administrator. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JsonStringAnalyse)

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

+ (NSString *)dictionaryToJson:(NSDictionary *)dic;

+ (NSString *)stringToJson:(NSString *)string;
@end
