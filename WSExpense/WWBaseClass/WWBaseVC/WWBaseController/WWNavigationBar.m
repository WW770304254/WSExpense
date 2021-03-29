//
//  WWNavigationBar.m
//  WSExpense
//
//  Created by 王伟 on 2021/3/15.
//

#import "WWNavigationBar.h"

static const float NavigationBar_Title_Font_Size = 18.0f;
static NSString *const Font_Default_Medium = @"PingFangSC-Medium";

@interface WWNavigationBar () {
    NSArray<UIButton *> *_leftButtons;
    BOOL                _isCustomTitleView;
    UIView             *_titleView;
    UILabel            *_titleLabel;
    NSArray<UIButton*> *_rightButtons;
    UIImageView        *_bgImageV;
    UIView             *_bottomLine;
}

@end

@implementation WWNavigationBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _isCustomTitleView = NO;
        [self drawView];
    }
    return self;
}

#pragma mark - 绘制导航栏
- (void)drawView {
    _bgImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    _bgImageV.hidden = YES;
    [self addSubview:_bgImageV];
    
    self.backgroundColor = [UIColor whiteColor];
    
    _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 1)];
    _bottomLine.backgroundColor = WWLineColor;
    [self addSubview:_bottomLine];
    _bottomLine.hidden = YES;
}

#pragma mark - 返回事件
- (void)setBackButtonWithTarget:(id)target selector:(SEL)selector {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = CGRectMake(0, 0, 44.0f, 44.0f);
    button.frame = CGRectMake(0, StatusBarHeight, 44.0f, 44.0f);
    [button setImage:[UIImage imageNamed:@"icon_base_back"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"icon_base_back"] forState:UIControlStateHighlighted];
    
    [self setCustomButtonWithButton:button target:target selector:selector];
}

#pragma mark - 基础方法
- (void)setCustomButtonWithButton:(UIButton *)button target:(id)target selector:(SEL)selector {
    if (!button) {
        _leftButtons = nil;
        [self layoutElement];
        return;
    }
    
    _leftButtons = @[button];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [self setCustomLeftButtons:_leftButtons];
}


#pragma mark - 设置左侧按钮
- (void)setCustomLeftButtons:(NSArray<UIButton *> *)buttons {
    for (UIButton *button in _leftButtons) {
        [button removeFromSuperview];
    }
    _leftButtons = buttons;
    
    [self layoutElement];
}

#pragma mark - 设置右侧按钮
- (void)setCustomRightButtons:(NSArray<UIButton *> *)buttons {
    for (UIButton* button in _rightButtons) {
        [button removeFromSuperview];
    }
    
    _rightButtons = buttons;
    
    for (UIButton* button in _rightButtons) {
        [self addSubview:button];
    }
    
    [self layoutElement];
}

#pragma mark - 设置左侧标题
- (void)setLeftTitle:(NSString *)leftTitle withFontSize:(CGFloat)fontSize {
    self.hidden=NO;
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont fontWithName:Font_Default_Medium size:fontSize];
    label.textColor = [UIColor WWColorWithHex:0x333333];
    label.text = leftTitle;
    [label sizeToFit];
    label.frame = CGRectMake(10, NavHeight - 44 + (44 - label.height)/2, label.width, label.height);
    _leftLabel = label;
    [self addSubview:_leftLabel];
    [self layoutElement];
}

#pragma mark - 设置中间标题
- (void)setNaviTitle:(NSString *)title {
    self.hidden=NO;
    [_titleView removeFromSuperview];
    _titleView = nil;
    
    _titleView = [[UIView alloc] init];
    _titleView.backgroundColor = [UIColor clearColor];
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont fontWithName:Font_Default_Medium size:NavigationBar_Title_Font_Size];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor colorWithHexString:@"#25262A"];
    label.text = title;
    _titleLabel = label;
    [_titleView addSubview:label];
    [self addSubview:_titleView];
    _isCustomTitleView = NO;
    [self layoutElement];
}

#pragma mark - 设置titleView
- (void)setCustomTitleView:(UIView *)titleView {
    [_titleView removeFromSuperview];
    _titleView = titleView;
    [self addSubview:_titleView];
    _isCustomTitleView = YES;
    [self layoutElement];
}

#pragma mark - 设置导航栏类型
- (void)setWWNavigationBarStyle:(WWNavigationBarStyle)barStyle {
    switch (barStyle) {
        case WWNavigationBarStyleNormal:
        {
            self.backgroundColor = [UIColor WWColorWithHex:0xffee00 alpha:1.0f];
            _bgImageV.hidden = YES;
        }
            break;
        case WWNavigationBarStyleTransparent:
        {
            self.backgroundColor = [UIColor clearColor];
            _bgImageV.hidden = NO;
        }
            break;
        case WWNavigationBarStyleWhite:
        {
            self.backgroundColor = [UIColor WWColorWithHex:0xffffff alpha:1.0f];
            _bgImageV.hidden = YES;
        }
            break;
        default:
            
            break;
    }
}

#pragma mark - 导航栏颜色
- (void)setNavightionBarBackgroundColor:(UIColor *)color {
    self.backgroundColor = color;
    _bgImageV.hidden = YES;
}

#pragma mark - 私有方法
- (void)layoutElement {
    CGFloat x = FitSize(0);
    for (NSInteger index = 0; index < _leftButtons.count; index ++) {
        UIButton* button = _leftButtons[index];
        button.frame = CGRectMake(x, StatusBarHeight+22-button.height/2, button.width, button.height);
        [self addSubview:button];
        x += button.width;
    }
    
    x = self.width;
    
    for (NSInteger index = _rightButtons.count - 1; index >= 0; index --) {
        UIButton* button = _rightButtons[index];
        x = x - button.width - FitSize(15);
        button.frame = CGRectMake(x, StatusBarHeight+22-button.height/2, button.width, button.height);
    }
    
    // 两边都有按钮
    if (_leftButtons.count > 0 && _rightButtons.count > 0) {
        _titleView.frame = CGRectMake(_leftButtons[_leftButtons.count - 1].right, StatusBarHeight, _rightButtons[0].x - _leftButtons[_leftButtons.count - 1].right, 44.0f);
    }
    // 只有左侧有按钮
    else if (_leftButtons.count > 0 && (_rightButtons.count == 0 || !_rightButtons ))
    {
        _titleView.frame = CGRectMake(_leftButtons[_leftButtons.count - 1].right, StatusBarHeight,self.width - _leftButtons[_leftButtons.count - 1].width * 2, 44.0f);
    }
    // 只有右侧有按钮
    else if ((!_leftButtons || _leftButtons.count == 0) && _rightButtons.count > 0)
    {
        CGFloat leftWidth = self.width - _rightButtons[0].x;
        _titleView.frame = CGRectMake(leftWidth, StatusBarHeight, self.width - leftWidth * 2, 44.0f);
    }
    // 两边都没有按钮
    else
    {
        _titleView.frame = CGRectMake(0, StatusBarHeight, self.width, 44.0f);
    }
    
    if (!_isCustomTitleView) {
        
        CGFloat titleViewDistanceFromLeft = _titleView.x;
        CGFloat titleViewDistanceFromRight = self.width - _titleView.right;
        CGFloat titleLabelShouldWidth = 0;
        if (titleViewDistanceFromLeft > titleViewDistanceFromRight) {
            titleLabelShouldWidth = (self.width / 2.0f - titleViewDistanceFromLeft) * 2;
        }
        else
        {
            titleLabelShouldWidth = (self.width / 2.0f - titleViewDistanceFromRight) * 2;
        }
        
        _titleLabel.width = titleLabelShouldWidth;
        _titleLabel.x = 0;
        _titleLabel.y = 0;
        CGFloat titleLabelShouldXOnSelf = (self.width - titleLabelShouldWidth) / 2.0f;
        CGFloat titleLabelX = [_titleLabel convertRect:_titleLabel.bounds toView:self].origin.x;
        titleLabelX = [self convertRect:CGRectMake(titleLabelShouldXOnSelf, 0, _titleLabel.width, _titleLabel.height) toView:_titleView].origin.x;
        _titleLabel.x = titleLabelX;
        _titleLabel.height = _titleView.height;
    }
}

#pragma mark - 公有方法
- (void)setShowNavigationBarBottomLine:(BOOL)showNavigationBarBottomLine {
    _bottomLine.hidden = !showNavigationBarBottomLine;
}

- (UILabel *)navTitleLabel {
    return _titleLabel;
}

@end
