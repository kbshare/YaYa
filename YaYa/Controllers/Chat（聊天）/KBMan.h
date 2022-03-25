//
//  KBMan.h
//  YaYa
//
//  Created by yawei.zhang on 2021/1/28.
//  Copyright © 2021 msxf. All rights reserved.
//

#import "KBPerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface KBMan : KBPerson
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *nikeName;
@property (nonatomic, assign) NSInteger age;

@end

NS_ASSUME_NONNULL_END
