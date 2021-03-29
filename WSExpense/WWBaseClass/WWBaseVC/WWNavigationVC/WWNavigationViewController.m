//
//  WWNavigationViewController.m
//  WSExpense
//
//  Created by 王伟 on 2021/3/12.
//

#import "WWNavigationViewController.h"

@interface WWNavigationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation WWNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 获取系统手势的target对象
    id tagart = self.interactivePopGestureRecognizer.delegate;
    // 创建手势调用系统的方法
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget: tagart action:@selector(handleNavigationTransition:)];
    // 添加手势
    [self.view addGestureRecognizer:pan];
    // 设置手势的代理
    pan.delegate = self;
    // 禁用系统的手势
    self.interactivePopGestureRecognizer.enabled = NO;
}



@end
