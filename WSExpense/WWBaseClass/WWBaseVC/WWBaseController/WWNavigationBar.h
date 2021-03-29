//
//  WWNavigationBar.h
//  WSExpense
//
//  Created by 王伟 on 2021/3/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, WWNavigationBarStyle) {
    WWNavigationBarStyleNormal = 0,
    WWNavigationBarStyleTransparent,
    WWNavigationBarStyleWhite
};

@interface WWNavigationBar : UIView

@property (nonatomic, strong)UILabel *leftLabel;                      //左侧标题
@property (nonatomic, strong)UILabel *titleLabel;                     //中间标题
@property (nonatomic, assign)BOOL showNavigationBarBottomLine;        //显示底部线条  默认是NO不显示

/** 导航栏左右按钮返回事件*/
- (void)setBackButtonWithTarget:(id)target selector:(SEL)selector;    //返回事件
- (void)setCustomButtonWithButton:(UIButton *)button target:(id)target selector:(SEL)selector;   //基础方法
- (void)setCustomLeftButtons:(NSArray<UIButton *> *)buttons;          //左侧按钮事件
- (void)setCustomRightButtons:(NSArray<UIButton *> *)buttons;         //右侧按钮事件

- (void)setLeftTitle:(NSString *)leftTitle withFontSize:(CGFloat)fontSize;     //设置左侧标题
- (void)setNaviTitle:(NSString *)title;                                //设置中间标题

/** 导航栏titleView*/
- (void)setCustomTitleView:(UIView *)titleView;
- (void)setWWNavigationBarStyle:(WWNavigationBarStyle)barStyle;
- (void)setNavightionBarBackgroundColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
