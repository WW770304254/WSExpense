//
//  WWBaseViewController.h
//  WSExpense
//
//  Created by 王伟 on 2021/3/15.
//

#import <UIKit/UIKit.h>

#import "WWNavigationBar.h"     //导航栏

NS_ASSUME_NONNULL_BEGIN

@interface WWBaseViewController : UIViewController

@property (strong, nonatomic) WWNavigationBar *navigationBar;

- (void)showBackBtn;               //显示返回按钮


@end

NS_ASSUME_NONNULL_END
