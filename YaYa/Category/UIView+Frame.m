//
//  UIView+Frame.h

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)bottom
{
    return self.frame.size.height + self.frame.origin.y;
}

//合成属性，先不实现
- (void)setBottom:(CGFloat)bottom
{
    self.frame = CGRectMake(self.frame.origin.x, bottom - self.frame.size.height, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)right
{
    return self.frame.size.width + self.frame.origin.x;
}

- (void)setRight:(CGFloat)right
{
      self.frame = CGRectMake(right - self.width, self.y, self.width, self.height);
}

- (CGFloat)centerX
{
    return self.frame.origin.x + self.frame.size.width/2;
}

- (void)setCenterX:(CGFloat)centerX
{
    self.frame = CGRectMake(centerX - self.width/2, self.y, self.width, self.height);
}

- (CGFloat)centerY
{
    return self.frame.origin.y + self.frame.size.height/2;
}

- (void)setCenterY:(CGFloat)centerY
{
    self.frame = CGRectMake(self.x, centerY - self.height/2, self.width, self.height);
}

- (void)configCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}
@end
