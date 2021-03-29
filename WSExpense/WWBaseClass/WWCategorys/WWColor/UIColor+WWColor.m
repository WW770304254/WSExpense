//
//  UIColor+WWColor.m
//  WSExpense
//
//  Created by 王伟 on 2021/3/15.
//

#import "UIColor+WWColor.h"

@implementation UIColor (WWColor)

+ (instancetype)baseColor {
    return [self colorWithHexString:@"#FFDF42"];
}

+ (instancetype)baseTextColor {
    return [self colorWithHexString:@"#F52766"];
}

/**
 * 获取颜色
 *
 * @param hex 例如 @"0xFFFFFF"
 * @return 颜色对象
 */
+ (instancetype)WWColorWithHex:(uint32_t)hex {
    uint8_t red = (hex & 0xff0000) >> 16;
    uint8_t green = (hex & 0x00ff00) >> 8;
    uint8_t blue = hex & 0x0000ff;
    return [self WWColorWithRed:red green:green blue:blue];
}

/**
 * 颜色对象
 *
 * @param hex 例如 @"0xFFFFFF"
 * @param alpha 透明度
 * @return 颜色对象
 */
+ (instancetype)WWColorWithHex:(uint32_t)hex alpha:(CGFloat)alpha{
    uint8_t r = (hex & 0xff0000) >> 16;
    uint8_t g = (hex & 0x00ff00) >> 8;
    uint8_t b = hex & 0x0000ff;
    
    return [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:alpha];
}

/**
 * 获取颜色
 *
 * @param red 红色色值
 * @param green 绿色色值
 * @param blue 蓝色色值
 * @return 颜色对象
 */
+ (instancetype)WWColorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue {
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}

@end
