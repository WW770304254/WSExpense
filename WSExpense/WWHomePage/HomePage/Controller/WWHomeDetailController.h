//
//  WWHomeDetailController.h
//  WSExpense
//
//  Created by APPLE on 2021/3/18.
//

#import "WWBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol WWDetailControllerDelegate <NSObject>

- (void)onClickDetailController:(UIViewController *)controller andString:(NSString *)string;

@end

typedef void(^wwDetailControllerBlock)(NSString *name, NSInteger age);



@interface WWHomeDetailController : WWBaseViewController

@property (nonatomic, weak)id<WWDetailControllerDelegate> delegate;

@property (nonatomic, copy)wwDetailControllerBlock wwDetailBlock;

@property (nonatomic, copy)void(^testBlock)(NSString *name, NSInteger age);

- (void)WWTestBlock:(void(^)(NSString *name, NSInteger age))testBlock2;

- (void(^)(NSString *))testString;

@end

NS_ASSUME_NONNULL_END
