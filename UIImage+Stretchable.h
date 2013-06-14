//
//  UIImage+Additions.h
//  resizeble
//
//  Created by sergey.pulyaev on 6/14/13.
//  Copyright (c) 2013 PI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Stretchable)

- (UIImageView *)stretchableImageViewWithCapInsets:(UIEdgeInsets)capInsets;

@end
