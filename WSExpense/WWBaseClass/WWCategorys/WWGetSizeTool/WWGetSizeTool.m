//
//  WWGetSizeTool.m
//  WSExpense
//
//  Created by 王伟 on 2021/3/15.
//

#import "WWGetSizeTool.h"

@implementation WWGetSizeTool

/**
 获取状态栏高度
 
 @return 返回状态栏高度
 */
+ (CGFloat)getStatusBarHeight {
    return [[UIApplication sharedApplication] statusBarFrame].size.height;
}

/**
 获取导航栏高度
 
 @return 返回导航栏高度
 */
+ (CGFloat)getNavigationBarHeight {
    return [self getStatusBarHeight] + 44;
}

/**
 获取底部安全区域高度
 
 @return 返回底部安全区域高度
 */
+ (CGFloat)getSafeBottomHeight {
    if (@available(iOS 11.0, *)) {
        return [[UIApplication sharedApplication] keyWindow].safeAreaInsets.bottom;
    } else {
        return 0;
    }
}

/**
 获取tabbar高度
 
 @return 返回tabbar高度
 */
+ (CGFloat)getTabBarHeight {
    return [self getSafeBottomHeight] + 49;
}

@end
