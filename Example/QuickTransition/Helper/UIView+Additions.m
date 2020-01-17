//
//  UIView+Additions.m
//  Meeting
//
//  Created by Aslan on 8/6/16.
//  Copyright © 2016 Aslan. All rights reserved.
//

@implementation UIView (Additions)

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    if (frame.origin.x != x) {
        frame.origin.x = x;
        self.frame = frame;
    }
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    if (frame.origin.y != y) {
        frame.origin.y = y;
        self.frame = frame;
    }
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    if (frame.origin.x != right - frame.size.width) {
        frame.origin.x = right - frame.size.width;
        self.frame = frame;
        
    }
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    if (frame.origin.y != bottom - frame.size.height) {
        frame.origin.y = bottom - frame.size.height;
        self.frame = frame;
        
    }
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    if (frame.size.width != width) {
        frame.size.width = width;
    }
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    if (frame.size.height != height) {
        frame.size.height = height;
        self.frame = frame;
    }
}

- (CGFloat)screenX {
    CGFloat x = 0;
    for (UIView* view = self; view; view = view.superview) {
        x += view.left;
    }
    return x;
}

- (CGFloat)screenY {
    CGFloat y = 0;
    for (UIView* view = self; view; view = view.superview) {
        y += view.top;
    }
    return y;
}

- (CGFloat)screenViewX {
    CGFloat x = 0;
    for (UIView* view = self; view; view = view.superview) {
        x += view.left;
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            x -= scrollView.contentOffset.x;
        }
    }
    
    return x;
}

- (CGFloat)screenViewY {
    CGFloat y = 0;
    for (UIView* view = self; view; view = view.superview) {
        y += view.top;
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            y -= scrollView.contentOffset.y;
        }
    }
    return y;
}

- (CGRect)screenFrame {
    return CGRectMake(self.screenViewX, self.screenViewY, self.width, self.height);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGPoint)offsetFromView:(UIView*)otherView {
    CGFloat x = 0, y = 0;
    for (UIView* view = self; view && view != otherView; view = view.superview) {
        x += view.left;
        y += view.top;
    }
    return CGPointMake(x, y);
}

- (void)removeAllSubviews
{
    while (self.subviews.count) {
        UIView *child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

- (void)hideAllSubViews
{
    for (UIView *view in self.subviews) {
        view.hidden = YES;
    }
}

- (void)IDDAddSubView:(UIView *)view
{
    if (![self.subviews containsObject:view]) {
        [self addSubview:view];
    }
}

- (void)setAspectRatio:(CGFloat)aspectRatio andWidth:(CGFloat)width
{
    CGRect rect = self.frame;
    rect.size.width = width;
    rect.size.height = width / aspectRatio;
    self.frame = rect;
}

- (void)setAspectRatio:(CGFloat)aspectRatio andHeight:(CGFloat)height
{
    CGRect rect = self.frame;
    rect.size.height = height;
    rect.size.width = aspectRatio * height;
    self.frame = rect;
}

@end
