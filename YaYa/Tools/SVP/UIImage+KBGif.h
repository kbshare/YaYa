//
//  UIImage+KBGif.h
//  YaYa
//
//  Created by a58 on 2022/1/12.
//  Copyright © 2022 msxf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (KBGif)
/**
 根据图片名字创建gif图片

 @param name 图片名字
 @return UIImage*
 */
+ (UIImage *)animatedGIFNamed:(NSString *)name;

/**
 根据NSData* 创建gif图片

 @param data NSData *
 @return UIImage *
 */
+ (UIImage *)animatedGIFWithData:(NSData *)data;

/**
 根据大小裁剪图片

 @param size 裁剪大小
 @return UIImage*
 */
- (UIImage *)animatedImageByScalingAndCroppingToSize:(CGSize)size;
@end

NS_ASSUME_NONNULL_END
