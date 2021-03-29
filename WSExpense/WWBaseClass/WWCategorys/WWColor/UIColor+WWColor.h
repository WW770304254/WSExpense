//
//  UIColor+WWColor.h
//  WSExpense
//
//  Created by 王伟 on 2021/3/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (WWColor)

/**
 * APP基色
 *
 * @return 颜色对象
 */
+ (instancetype)baseColor;

/**
 * 文字基色
 *
 * @return 颜色对象
 */
+ (instancetype)baseTextColor;

/**
 * 颜色
 *
 * @param hex 例如 @"0xFFFFFF"
 * @return 颜色对象
 */

+ (instancetype)WWColorWithHex:(uint32_t)hex;

/**
 * 颜色
 *
 * @param hex 例如 @"0xFFFFFF"
 * @param alpha 透明度
 * @return 颜色对象
 */
+ (instancetype)WWColorWithHex:(uint32_t)hex alpha:(CGFloat)alpha;

/**
 * 获取颜色
 *
 * @param red 红色色值
 * @param green 绿色色值
 * @param blue 蓝色色值
 * @return 颜色对象
 */
+ (instancetype)WWColorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue;

@end

NS_ASSUME_NONNULL_END
