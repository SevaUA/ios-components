//
//  UIImage+Additions.m
//  resizeble
//
//  Created by sergey.pulyaev on 6/14/13.
//  Copyright (c) 2013 PI. All rights reserved.
//

#import "UIImage+Stretchable.h"

@implementation UIImage (Stretchable)

- (UIImageView *)stretchableImageViewWithCapInsets:(UIEdgeInsets)capInsets {
    CGRect frame = CGRectZero;
    frame.size = self.size;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    [self addCornersWithCapInsets:capInsets onView:imageView];
    [self addBottomAndTopWithCapInsets:capInsets onView:imageView];
    [self addLeftAndRightWithCapInsets:capInsets onView:imageView];
    [self addCenterWithCapInsets:capInsets onView:imageView];
    return imageView;
}

- (void)addCornersWithCapInsets:(UIEdgeInsets)capInsets onView:(UIView *)view {
    CGFloat selfWidth = self.size.width;
    CGFloat selfHeight = self.size.height;
    
    CGRect leftTop = CGRectMake(0, 0, capInsets.left, capInsets.top);
    [self addToView:view autoresizing:(UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin) frame:leftTop];
    
    CGRect rightTop = CGRectMake(selfWidth - capInsets.right, 0, capInsets.left, capInsets.top);
    [self addToView:view autoresizing:(UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin) frame:rightTop];
    
    CGRect leftBottom = CGRectMake(0, selfHeight - capInsets.bottom, capInsets.left, capInsets.top);
    [self addToView:view autoresizing:(UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin) frame:leftBottom];
    
    CGRect rightBottom = CGRectMake(selfWidth - capInsets.right, selfHeight - capInsets.bottom, capInsets.left, capInsets.top);
    [self addToView:view autoresizing:(UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin) frame:rightBottom];
}

- (void)addBottomAndTopWithCapInsets:(UIEdgeInsets)capInsets onView:(UIView *)view {
    CGFloat selfWidth = self.size.width;
    CGFloat selfHeight = self.size.height;
    
    CGRect top = CGRectMake(capInsets.left, 0, selfWidth - capInsets.right - capInsets.left, capInsets.top);
    [self addToView:view autoresizing:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin) frame:top];
    
    CGRect bottom = CGRectMake(capInsets.left, selfHeight - capInsets.bottom, selfWidth - capInsets.right - capInsets.left, capInsets.bottom);
    [self addToView:view autoresizing:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin) frame:bottom];
}

- (void)addLeftAndRightWithCapInsets:(UIEdgeInsets)capInsets onView:(UIView *)view {
    CGFloat selfWidth = self.size.width;
    CGFloat selfHeight = self.size.height;
    
    CGRect left = CGRectMake(0, capInsets.top, capInsets.left, selfHeight - capInsets.top - capInsets.bottom);
    [self addToView:view autoresizing:(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin) frame:left];
    
    CGRect right = CGRectMake(selfWidth - capInsets.right, capInsets.top, capInsets.right, selfHeight - capInsets.top - capInsets.bottom);
    [self addToView:view autoresizing:(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin) frame:right];
}

- (void)addCenterWithCapInsets:(UIEdgeInsets)capInsets onView:(UIView *)view {
    CGFloat selfWidth = self.size.width;
    CGFloat selfHeight = self.size.height;
    
    CGRect center = CGRectMake(capInsets.left, capInsets.top, selfWidth - capInsets.left - capInsets.right, selfHeight - capInsets.top - capInsets.bottom);
    [self addToView:view autoresizing:(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth) frame:center];
}

- (void)addToView:(UIView *)view autoresizing:(UIViewAutoresizing)autoresizing frame:(CGRect)fromRect {
    UIImageView *part = [self getPartFrom:fromRect];
    part.autoresizingMask = autoresizing;
    [view addSubview:part];
}

- (UIImageView *)getPartFrom:(CGRect)fromRect {
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], fromRect);
    UIImage* subImage = [UIImage imageWithCGImage: imageRef];
    CGImageRelease(imageRef);
    UIImageView *imageView = [[UIImageView alloc] initWithImage:subImage];
    imageView.frame = fromRect;
    return imageView;
}

@end
