//
//  ProfileViewController.m
//  nav
//
//  Created by xuebing on 15/11/26.
//  Copyright (c) 2015年 xuebing. All rights reserved.
//

#import "ProfileViewController.h"
#import "ModalViewController.h"
#import "PushViewController.h"
#import "RootViewController.h"

CGFloat const writeBtnWidth = 33;
CGFloat const writBtnHeight = 32;


@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [self initNavButton];
}

//自定义导航栏按钮
- (void) initNavButton{
    UIButton *writeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    writeBtn.frame = CGRectMake(0, 0, writeBtnWidth, writBtnHeight);
    [writeBtn setBackgroundImage:[UIImage imageNamed:@"write"] forState:UIControlStateNormal];
    [writeBtn addTarget:self action:@selector(presentAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:writeBtn];
    self.navigationItem.leftBarButtonItem = item;
}

- (void) presentAction{
    ModalViewController *modalVC = [[ModalViewController alloc]init];
    //模态视图
    [self presentViewController:modalVC animated:YES completion:nil];
}

- (void) initPushBtn{
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    pushBtn.frame = CGRectMake(100, 100, 200,40);
    [pushBtn setTitle:@"push" forState:UIControlStateNormal];
    [pushBtn addTarget:self action:@selector(pushAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
}

- (void)pushAction{
     PushViewController *pushVC = [[PushViewController alloc]init];
    [self.navigationController pushViewController:pushVC animated:YES];
    RootViewController *rootVC = (RootViewController *)self.tabBarController;
    [rootVC showTabBar:NO];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    RootViewController *rootVC = (RootViewController *)self.tabBarController;
    [rootVC showTabBar:YES];
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
