//
//  RootViewController.h
//  nav
//
//  Created by xuebing on 15/11/26.
//  Copyright (c) 2015年 xuebing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITabBarController
@property (nonatomic,strong)UIView *tabBarView;

- (void)showTabBar:(BOOL)show;

@end
