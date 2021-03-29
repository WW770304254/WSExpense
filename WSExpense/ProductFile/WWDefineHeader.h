//
//  WWDefineHeader.h
//  WSExpense
//
//  Created by 王伟 on 2021/3/15.
//

#ifndef WWDefineHeader_h
#define WWDefineHeader_h

//定义屏幕的宽度
#define SCRWIDTH ([UIScreen mainScreen].bounds.size.width<[UIScreen mainScreen].bounds.size.height?[UIScreen mainScreen].bounds.size.width:[UIScreen mainScreen].bounds.size.height)

//定义屏幕的高度
#define SCRHEIGHT ([UIScreen mainScreen].bounds.size.width>[UIScreen mainScreen].bounds.size.height?[UIScreen mainScreen].bounds.size.width:[UIScreen mainScreen].bounds.size.height)

//比例
#define SCRMUTI (SCRWIDTH/375.0)
#define FitSize(x)  (SCRWIDTH/375.0)*x

//获取各高度
#define StatusBarHeight [WWGetSizeTool getStatusBarHeight]
#define NavHeight [WWGetSizeTool getNavigationBarHeight]
#define TabbarHeight [WWGetSizeTool getTabBarHeight]
#define safeBottomHeight  [WWGetSizeTool getSafeBottomHeight]
#define VIEW_HEIGHT SCRHEIGHT-safeBottomHeight

/*自定义颜色**/
#define WWColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define WWLineColor WWColor(246, 247, 249, 1)
#define WWTextColor WWColor(130, 131, 135, 1)
#define WW4DColor WWColor(77, 77, 77, 1)

#endif /* WWDefineHeader_h */
