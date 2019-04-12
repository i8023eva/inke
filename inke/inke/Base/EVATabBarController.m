//
//  EVATabBarController.m
//  inke
//
//  Created by 李元华 on 2019/4/11.
//  Copyright © 2019 李元华. All rights reserved.
//

#import "EVATabBarController.h"
#import "EVABaseNavController.h"
#import "EVALaunchViewController.h"
#import "EVATabBar.h"
#import "UIImage+Original.h"

@interface EVATabBarController ()<UITabBarControllerDelegate>
@property (nonatomic, strong) EVATabBar *evaTabBar;
@end

@implementation EVATabBarController

- (EVATabBar *)evaTabBar {
    if (!_evaTabBar) {
        _evaTabBar = [[EVATabBar alloc] init];
    }
    return _evaTabBar;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.tabBar.translucent = NO;
//    [self.tabBar addSubview:self.evaTabBar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildViewController];
    [self setValue:self.evaTabBar forKey:@"tabBar"];
    self.delegate = self;
    
    __weak typeof(self) weakSelf = self;
    self.evaTabBar.block = ^(EVATabBar * _Nonnull tabBar) {
        EVALaunchViewController *vc = [[EVALaunchViewController alloc] init];
        [weakSelf presentViewController:vc animated:YES completion:nil];
    };
}

- (void)setupChildViewController {
    NSArray<NSString *> *vcName_Arr = @[@"EVAMainViewController",
                                     @"EVAMeViewController"];
    NSArray<NSString *> *image_Arr = @[@"tab_live", @"tab_me"];
    NSArray<NSString *> *selectedImage_Arr = @[@"tab_live_p", @"tab_me_p"];
    
    for (int i = 0; i < vcName_Arr.count; i++) {
        UIViewController *vc = [[NSClassFromString(vcName_Arr[i]) alloc] init];
        EVABaseNavController *nav = [[EVABaseNavController alloc] initWithRootViewController:vc];
        nav.tabBarItem.image = [UIImage imageNamed:image_Arr[i]].eva_renderOriginalName;
        nav.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage_Arr[i]].eva_renderOriginalName;
        [self addChildViewController:nav];
    }
}

#pragma mark - UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    NSInteger index = [tabBarController.childViewControllers indexOfObject:viewController];
    UIButton *button = tabBarController.tabBar.subviews[index + 1];
    
    [UIView animateWithDuration:0.2 animations:^{
        button.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            button.transform = CGAffineTransformIdentity;
        }];
    }];
    return YES;
}


@end
