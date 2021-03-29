//
//  WWBaseViewController.m
//  WSExpense
//
//  Created by 王伟 on 2021/3/15.
//

#import "WWBaseViewController.h"

@interface WWBaseViewController ()

@end

@implementation WWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //在iOS 11上运行tableView向下偏移64px或者20px
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.view.backgroundColor = [UIColor whiteColor];
    [self createrBaseUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

#pragma mark - 创建基础UI
- (void)createrBaseUI {
//    self.navigationController.navigationBar.hidden=YES;
    
    self.navigationBar = [[WWNavigationBar alloc] initWithFrame:CGRectMake(0, 0, SCRWIDTH, NavHeight)];
    [self.view addSubview:self.navigationBar];
    [self.navigationBar setNaviTitle:@""];
    self.navigationBar.backgroundColor = [UIColor whiteColor];
    self.navigationBar.titleLabel.textColor = [UIColor WWColorWithHex:0x333333];
    self.navigationBar.hidden = YES;
}

- (void)showBackBtn {
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [leftBtn setImage:[UIImage imageNamed:@"icon_base_back"] forState:UIControlStateNormal];
    [[leftBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        if (self.presentingViewController) {
            [self dismissViewControllerAnimated:YES completion:nil];
        } else{
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
    [self.navigationBar setCustomLeftButtons:@[leftBtn]];
}


@end
