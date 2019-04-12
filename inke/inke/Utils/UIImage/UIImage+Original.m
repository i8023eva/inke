//
//  UIImage+Original.m
//  inke
//
//  Created by 李元华 on 2019/4/12.
//  Copyright © 2019 李元华. All rights reserved.
//

#import "UIImage+Original.h"

@implementation UIImage (Original)

- (UIImage *)eva_renderOriginalName {
    return [self imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
