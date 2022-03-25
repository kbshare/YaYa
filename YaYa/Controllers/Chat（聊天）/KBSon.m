//
//  KBSon.m
//  YaYa
//
//  Created by KBMore on 2020/2/22.
//  Copyright © 2020 msxf. All rights reserved.
//

#import "KBSon.h"
#import "NSObject+KBTest.h"

@implementation KBSon

+(void)initialize{
    NSLog(@"KBSon class initialize");
}
- (id)copyWithZone:(NSZone *)zone{
    
    return  self;
}

+ (void)testdemo{
    [self test];
}

- (void)testAssign{
    
    NSLog(@"testAssign");
}
@end
