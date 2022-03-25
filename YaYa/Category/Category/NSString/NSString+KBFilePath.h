//
//  NSString+KBFilePath.h
//  HMObjcSugar
//
//  Created by administrator on 2016/11/4.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (KBFilePath)
/// 拼接了`文档目录`的全路径
@property (nullable, nonatomic, readonly) NSString *kb_documentDirectory;
/// 拼接了`缓存目录`的全路径
@property (nullable, nonatomic, readonly) NSString *kb_cacheDirecotry;
/// 拼接了临时目录的全路径
@property (nullable, nonatomic, readonly) NSString *kb_tmpDirectory;
@end
