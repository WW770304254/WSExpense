//
//  WWGetSizeTool.h
//  WSExpense
//
//  Created by 王伟 on 2021/3/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WWGetSizeTool : NSObject

/**
 获取状态栏高度

 @return 返回状态栏高度
 */
+ (CGFloat)getStatusBarHeight;

/**
 获取导航栏高度
 
 @return 返回导航栏高度
 */
+ (CGFloat)getNavigationBarHeight;

/**
 获取底部安全区域高度
 
 @return 返回底部安全区域高度
 */
+ (CGFloat)getSafeBottomHeight;

/**
 获取tabbar高度
 
 @return 返回tabbar高度
 */
+ (CGFloat)getTabBarHeight;

@end

NS_ASSUME_NONNULL_END
