//
//  KBSon.h
//  YaYa
//
//  Created by KBMore on 2020/2/22.
//  Copyright © 2020 msxf. All rights reserved.
//

#import "KBPerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface KBSon : KBPerson<NSCopying>
@property (nonatomic, copy) NSString *name;

+ (void)testdemo;

- (void)testAssign;
@end

NS_ASSUME_NONNULL_END
