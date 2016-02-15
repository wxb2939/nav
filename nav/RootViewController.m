//
//  RootViewController.m
//  nav
//
//  Created by xuebing on 15/11/26.
//  Copyright (c) 2015年 xuebing. All rights reserved.
//

#import "RootViewController.h"
#import "ProfileViewController.h"
#import "MessageViewController.h"
#import "ColaViewController.h"
#import "UserViewController.h"
#import "MoreViewController.h"



#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
CGFloat const tabViewHeight = 49;
CGFloat const btnWith = 64;
CGFloat const btnHeight = 45;


@interface RootViewController ()
@property(nonatomic,strong)UIImageView *selectView;


@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.hidden = YES;
    [self initViewController];
    [self initTabBarView];
}

//初始化视图控制器
- (void)initViewController{
    ProfileViewController *profileVC = [[ProfileViewController alloc]init];
    MessageViewController *messageVC = [[MessageViewController alloc]init];
    ColaViewController *colaVC = [[ColaViewController alloc]init];
    MoreViewController *moreVC = [[MoreViewController alloc]init];
    UserViewController *userVC = [[UserViewController alloc]init];
    NSArray *vcArray = @[profileVC,messageVC,colaVC,moreVC,userVC];
    NSMutableArray *tabArray = [NSMutableArray arrayWithCapacity:vcArray.count];
    
    //初始化导航控制器
    for (int i = 0; i<vcArray.count; i++) {
        UINavigationController *navCtrl = [[UINavigationController alloc]initWithRootViewController:vcArray[i]];
        [tabArray addObject:navCtrl];
    }
    //将导航控制器给标签控制器
    self.viewControllers = tabArray;
}

//自定义标签工具栏
-(void) initTabBarView{
    //初始化标签工具栏视图
    _tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight-tabViewHeight, kScreenWidth, tabViewHeight)];
    _tabBarView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mask_navbar"]];
    [self.view addSubview: _tabBarView];
    //新语法创建数组，拉到图片
    NSArray *imgArray = @[@"home_tab_icon_1",@"home_tab_icon_2",@"home_tab_icon_3",@"home_tab_icon_4",@"home_tab_icon_5"];
    //创建button
    for (int i=0; i <imgArray.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:imgArray[i]] forState:UIControlStateNormal];
        btn.frame = CGRectMake(btnWith*i, (tabViewHeight-btnHeight)/2, btnWith, btnHeight);
        btn.tag = 100+i;
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBarView addSubview:btn];
    }
    
    //初始化选中图片视图
    _selectView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, btnWith, btnHeight)];
    _selectView.image = [UIImage imageNamed:@"home_bottom_tab_arrow"];
    [_tabBarView addSubview:_selectView];
}

- (void) btnAction:(UIButton *) button{
    //根据tag值判断当前索引
    self.selectedIndex = button.tag - 100;
    [UIView animateWithDuration:0.2 animations:^{
        _selectView.center = button.center;
    }completion:nil];
}

- (void)showTabBar:(BOOL)show{
    CGRect frame = self.tabBarView.frame;
    if (show) {
        frame.origin.x = 0;
    }else{
        frame.origin.x = -kScreenWidth;
    }
    [UIView animateWithDuration:0.2 animations:^{
        self.tabBarView.frame = frame;
    }completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
