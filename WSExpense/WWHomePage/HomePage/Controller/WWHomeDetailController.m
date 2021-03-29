//
//  WWHomeDetailController.m
//  WSExpense
//
//  Created by APPLE on 2021/3/18.
//

#import "WWHomeDetailController.h"

@interface WWHomeDetailController ()

@end

@implementation WWHomeDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createrNaviBar];
}

#pragma mark - 创建导航栏
- (void)createrNaviBar {
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationBar setNaviTitle:@"详情"];
    self.navigationBar.backgroundColor = [UIColor whiteColor];
    self.navigationBar.showNavigationBarBottomLine = YES;
    self.view.backgroundColor = [UIColor colorWithRed:random()%255/255.0 green:random()%255/255.0 blue:random()%255/255.0 alpha:1];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(onClickDetailController:andString:)]) {
        [self.delegate onClickDetailController:self andString:@"hahahahah"];
    }
    
    if (self.wwDetailBlock) {
        self.wwDetailBlock(@"wangwei", 18);
    }
    
    self.testBlock(@"xiaoliu", 7);
}

- (void)WWTestBlock:(void (^)(NSString * _Nonnull, NSInteger))testBlock2 {
    testBlock2(@"小明", 20);
}

- (void (^)(NSString * _Nonnull))testString {
    return ^(NSString *ss) {
        NSLog(@"%@", ss);
    };
}

@end
