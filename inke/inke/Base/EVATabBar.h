//
//  EVATabBar.h
//  inke
//
//  Created by 李元华 on 2019/4/11.
//  Copyright © 2019 李元华. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class EVATabBar;

typedef void(^EVATabBarBlock) (EVATabBar *tabBar);

@interface EVATabBar : UITabBar

@property (nonatomic, copy) EVATabBarBlock block;

@end

NS_ASSUME_NONNULL_END
