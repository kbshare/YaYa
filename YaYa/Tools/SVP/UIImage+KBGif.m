//
//  UIImage+KBGif.m
//  YaYa
//
//  Created by a58 on 2022/1/12.
//  Copyright © 2022 msxf. All rights reserved.
//

#import "UIImage+KBGif.h"

@implementation UIImage (KBGif)
+ (UIImage *)animatedGIFWithData:(NSData *)data {
   if (!data) {
       return nil;
   }
   
   CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
   
   size_t count = CGImageSourceGetCount(source);
   
   UIImage *animatedImage;
   
   if (count <= 1) {
       animatedImage = [[UIImage alloc] initWithData:data];
   }
   else {
       NSMutableArray *images = [NSMutableArray array];
       
       NSTimeInterval duration = 0.0f;
       
       for (size_t i = 0; i < count; i++) {
           CGImageRef image = CGImageSourceCreateImageAtIndex(source, i, NULL);
           if (!image) {
               continue;
           }
           
           duration += [self frameDurationAtIndex:i source:source];
           
           [images addObject:[UIImage imageWithCGImage:image scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp]];
           
           CGImageRelease(image);
       }
       
       if (!duration) {
           duration = (1.0f / 10.0f) * count;
       }
       
       animatedImage = [UIImage animatedImageWithImages:images duration:duration];
   }
   
   CFRelease(source);
   
   return animatedImage;
}

+ (float)frameDurationAtIndex:(NSUInteger)index source:(CGImageSourceRef)source {
   float frameDuration = 0.1f;
   CFDictionaryRef cfFrameProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil);
   NSDictionary *frameProperties = (__bridge NSDictionary *)cfFrameProperties;
   NSDictionary *gifProperties = frameProperties[(NSString *)kCGImagePropertyGIFDictionary];
   
   NSNumber *delayTimeUnclampedProp = gifProperties[(NSString *)kCGImagePropertyGIFUnclampedDelayTime];
   if (delayTimeUnclampedProp) {
       frameDuration = [delayTimeUnclampedProp floatValue];
   }
   else {
       
       NSNumber *delayTimeProp = gifProperties[(NSString *)kCGImagePropertyGIFDelayTime];
       if (delayTimeProp) {
           frameDuration = [delayTimeProp floatValue];
       }
   }
   
   if (frameDuration < 0.011f) {
       frameDuration = 0.100f;
   }
   
   CFRelease(cfFrameProperties);
   return frameDuration;
}

+ (UIImage *)animatedGIFNamed:(NSString *)name {
   CGFloat scale = [UIScreen mainScreen].scale;
   
   if (scale > 1.0f) {
       NSString *retinaPath = @"";
       if (![name containsString:@".gif"]) {
           retinaPath = [[NSBundle mainBundle] pathForResource:[name stringByAppendingString:@"@2x"] ofType:@"gif"];
       }else{
           retinaPath = [[NSBundle mainBundle] pathForResource:[name stringByAppendingString:@"@2x"] ofType:nil];
       }
       
       NSData *data = [NSData dataWithContentsOfFile:retinaPath];
       
       if (data) {
           return [UIImage animatedGIFWithData:data];
       }
       
       NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"gif"];
       
       data = [NSData dataWithContentsOfFile:path];
       
       if (data) {
           return [UIImage animatedGIFWithData:data];
       }
       
       return [UIImage imageNamed:name];
   }
   else {
       NSString *path;
       if (![name containsString:@".gif"]) {
           path = [[NSBundle mainBundle] pathForResource:name ofType:@"gif"];
       }else{
           path = [[NSBundle mainBundle] pathForResource:name ofType:@"nil"];
       }
       
       
//       NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"gif"];
       
       NSData *data = [NSData dataWithContentsOfFile:path];
       
       if (data) {
           return [UIImage animatedGIFWithData:data];
       }
       
       return [UIImage imageNamed:name];
   }
}

- (UIImage *)animatedImageByScalingAndCroppingToSize:(CGSize)size {
   if (CGSizeEqualToSize(self.size, size) || CGSizeEqualToSize(size, CGSizeZero)) {
       return self;
   }
   
   CGSize scaledSize = size;
   CGPoint thumbnailPoint = CGPointZero;
   
   CGFloat widthFactor = size.width / self.size.width;
   CGFloat heightFactor = size.height / self.size.height;
   CGFloat scaleFactor = (widthFactor > heightFactor) ? widthFactor : heightFactor;
   scaledSize.width = self.size.width * scaleFactor;
   scaledSize.height = self.size.height * scaleFactor;
   
   if (widthFactor > heightFactor) {
       thumbnailPoint.y = (size.height - scaledSize.height) * 0.5;
   }
   else if (widthFactor < heightFactor) {
       thumbnailPoint.x = (size.width - scaledSize.width) * 0.5;
   }
   
   NSMutableArray *scaledImages = [NSMutableArray array];
   
   for (UIImage *image in self.images) {
       UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
       
       [image drawInRect:CGRectMake(thumbnailPoint.x, thumbnailPoint.y, scaledSize.width, scaledSize.height)];
       UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
       
       [scaledImages addObject:newImage];
       
       UIGraphicsEndImageContext();
   }
   
   return [UIImage animatedImageWithImages:scaledImages duration:self.duration];
}

@end
