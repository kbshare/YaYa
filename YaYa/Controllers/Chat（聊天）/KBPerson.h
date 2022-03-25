//
//  KBPerson.h
//  YaYa
//
//  Created by KBMore on 2019/11/27.
//  Copyright © 2019 msxf. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KBPerson : NSObject<NSCoding>
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *address;

@property (nonatomic, assign) NSInteger currentData;
@property (nonatomic, assign) NSInteger totalData;
@property (nonatomic, assign) NSInteger currentProcess;


@end

NS_ASSUME_NONNULL_END
