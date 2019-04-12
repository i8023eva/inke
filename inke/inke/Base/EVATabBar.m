//
//  EVATabBar.m
//  inke
//
//  Created by 李元华 on 2019/4/11.
//  Copyright © 2019 李元华. All rights reserved.
//

#import "EVATabBar.h"

@interface EVATabBar()
@property (nonatomic, strong) UIButton *launchButton;
@end

@implementation EVATabBar

- (UIButton *)launchButton {
    if (!_launchButton) {
        _launchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_launchButton setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
        [_launchButton addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.launchButton sizeToFit];
        [self addSubview:_launchButton];
    }
    return _launchButton;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSInteger count = self.items.count;
    CGFloat btnW = self.bounds.size.width / (count + 1);
    CGFloat btnH = 49;
    //    NSLog(@"eva_height - %f", self.eva_height);
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    int i = 0;
    for (UIControl *objc in self.subviews) {
        if ([objc isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == 1) {
                i++;
            }
            btnX = i * btnW;
            objc.frame = CGRectMake(btnX, btnY, btnW, btnH);
            i++;
        }
    }
    self.launchButton.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2 - 34);
}

- (void)itemClick:(UIButton *)button {
    if (self.block) {
        self.block(self);
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    if (view == nil) {
        CGPoint tp = [self.launchButton convertPoint:point fromView:self];
        if (CGRectContainsPoint(self.launchButton.bounds, tp)) {
            view = self.launchButton;
        }
    }
    return view;
}

@end
