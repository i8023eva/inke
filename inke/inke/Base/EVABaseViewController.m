//
//  EVABaseViewController.m
//  inke
//
//  Created by 李元华 on 2019/4/12.
//  Copyright © 2019 李元华. All rights reserved.
//

#import "EVABaseViewController.h"

@interface EVABaseViewController ()

@end

@implementation EVABaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255));
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
