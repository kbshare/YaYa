//
//  UIView+Frame.h

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property (nonatomic, assign) CGFloat  x;
@property (nonatomic, assign) CGFloat  y;
@property (nonatomic, assign) CGFloat  width;
@property (nonatomic, assign) CGFloat  height;
@property (nonatomic, assign) CGFloat  bottom;
@property (nonatomic, assign) CGFloat  right;
@property (nonatomic, assign) CGSize   size;
@property (nonatomic, assign) CGFloat  centerX;
@property (nonatomic, assign) CGFloat  centerY;

- (void)configCornerRadius:(CGFloat)cornerRadius;
@end
