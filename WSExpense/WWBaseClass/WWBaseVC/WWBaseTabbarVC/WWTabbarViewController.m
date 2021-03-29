//
//  WWTabbarViewController.m
//  WSExpense
//
//  Created by 王伟 on 2021/3/12.
//

#import "WWTabbarViewController.h"

@interface WWTabbarViewController ()<UITabBarControllerDelegate>

@end

@implementation WWTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createTabBarViewController];
}

- (void)createTabBarViewController {
    NSArray *titleArray = @[@"首页", @"任务", @"商城", @"我的"];   //标题数组
    NSArray *imageArray = @[[UIImage imageNamed:@"icon_tab_mine_normal"],
                            [UIImage imageNamed:@"icon_tab_mine_normal"],
                            [UIImage imageNamed:@"icon_tab_mine_normal"],
                            [UIImage imageNamed:@"icon_tab_mine_normal"]
                            ];
    
    NSArray *imageSelectArray = @[[UIImage imageNamed:@"icon_tab_mine_normal"],
                                  [UIImage imageNamed:@"icon_tab_mine_normal"],
                                  [UIImage imageNamed:@"icon_tab_mine_normal"],
                                  [UIImage imageNamed:@"icon_tab_mine_normal"]
                                  ];
    
    //首页
    WWHomePageController *homePageVC = [[WWHomePageController alloc]init];
    WWNavigationViewController *homePageNaViVC = [[WWNavigationViewController alloc] initWithRootViewController:homePageVC];
    homePageNaViVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:titleArray[0] image:[imageArray[0] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[imageSelectArray[0] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    //任务
    WWHomePageController *homePageVC2 = [[WWHomePageController alloc]init];
    WWNavigationViewController *homePageNaViVC2 = [[WWNavigationViewController alloc] initWithRootViewController:homePageVC2];
    homePageNaViVC2.tabBarItem = [[UITabBarItem alloc]initWithTitle:titleArray[1] image:[imageArray[1] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[imageSelectArray[1] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    //商城
    WWHomePageController *homePageVC3 = [[WWHomePageController alloc]init];
    WWNavigationViewController *homePageNaViVC3 = [[WWNavigationViewController alloc] initWithRootViewController:homePageVC3];
    homePageNaViVC3.tabBarItem = [[UITabBarItem alloc]initWithTitle:titleArray[2] image:[imageArray[2] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[imageSelectArray[2] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    //我的
    WWHomePageController *homePageVC4 = [[WWHomePageController alloc]init];
    WWNavigationViewController *homePageNaViVC4 = [[WWNavigationViewController alloc] initWithRootViewController:homePageVC4];
    homePageNaViVC4.tabBarItem = [[UITabBarItem alloc]initWithTitle:titleArray[3] image:[imageArray[3] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[imageSelectArray[3] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    self.viewControllers = @[homePageNaViVC, homePageNaViVC2, homePageNaViVC3, homePageNaViVC4];
    self.delegate = self;
    self.tabBar.tintColor = [UIColor blackColor];
    self.tabBar.translucent = NO;
}

@end
