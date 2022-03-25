//
//  UIImage+Tool.h
//
//
//  Created by Jsfu on 14-10-21.
//  Copyright (c) 2014年 jsfu All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Tool)

/**
 按指定大小缩放图片
 @param newSize 缩放大小
 @return 缩放后图片对象
 */
-(UIImage*)scaleToSize:(CGSize)newSize;

/**
 按指定位置大小裁剪图片
 @param corpRect 指定位置大小
 @return 裁剪后图片对象
 */
-(UIImage *)cropByRect:(CGRect)cropRect;

/**
 按指定压缩率压缩图片
 @param quality 指定压缩率 （质量最差）0-1（质量最高）
 @return 压缩后图片对象
 */
-(UIImage *)compressByQuality:(CGFloat)quality;

/**
 *用相机拍摄出来的照片含有EXIF信息，UIImage的imageOrientation属性指的就是EXIF中的orientation信息。
 *如果我们忽略orientation信息，而直接对照片进行像素处理或者drawInRect等操作，得到的结果是翻转或者旋转90之后的样子。这是因为我们执行像素处理或者drawInRect等操作之后，imageOrientaion信息被删除了，imageOrientaion被重设为0，造成照片内容和imageOrientaion不匹配。
 所以，在对照片进行处理之前，先将照片旋转到正确的方向，并且返回的imageOrientaion为0。
 * 修正拍摄产生的图片的方向
 */
- (UIImage *)fixOrientation;

/**
 * 用颜色值创建图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

+ (UIImage *)imageWithColor:(UIColor *)color;
@end