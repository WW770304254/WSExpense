//
//  WWHomePageController.m
//  WSExpense
//
//  Created by 王伟 on 2021/3/15.
//

#import "WWHomePageController.h"
#import "WWHomeDetailController.h"   //首页明细

#import "WWHomgePageCell.h"          //homePageCell

#import "WWFactoryClass.h"

static NSString *cellID = @"cellID";

@interface WWHomePageController ()<UITableViewDataSource, UITableViewDelegate, WWDetailControllerDelegate>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation WWHomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createrNaviBar];
    [self.tableView reloadData];
}



#pragma mark - 创建导航栏
- (void)createrNaviBar {
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationBar setNaviTitle:NSLocalizedString(@"TITLE", nil)];
    self.navigationBar.backgroundColor = [UIColor whiteColor];
    self.navigationBar.showNavigationBarBottomLine = YES;
    self.view.backgroundColor = [UIColor colorWithRed:random()%255/255.0 green:random()%255/255.0 blue:random()%255/255.0 alpha:1];
    
    WWFatherClass *father1 = [WWFactoryClass createWWFactory:'+'];
    [father1 setNumberA:5.68];
    [father1 setNumberB:2.21];
    double result1 = [father1 getResult];
    
    WWFatherClass *father2 = [WWFactoryClass createWWFactory:'-'];
    [father2 setNumberA:5.68];
    [father2 setNumberB:2.21];
    double result2 = [father2 getResult];
    
    WWFatherClass *father3 = [WWFactoryClass createWWFactory:'*'];
    [father3 setNumberA:5.68];
    [father3 setNumberB:2.21];
    double result3 = [father3 getResult];
    
    WWFatherClass *father4 = [WWFactoryClass createWWFactory:'/'];
    [father4 setNumberA:6.01];
    [father4 setNumberB:2.00];
    double result4 = [father4 getResult];
    
    
    NSLog(@"计算结果为:%f  %f   %f   %f", result1, result2, result3, result4);
}

#pragma mark - tabView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80*SCRMUTI;;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    WWHomeDetailController *detailVC = [[WWHomeDetailController alloc] init];
    detailVC.delegate = self;
    detailVC.wwDetailBlock = ^(NSString * _Nonnull name, NSInteger age) {
        NSLog(@"姓名:%@, 年龄:%ld", name, age);
    };
    
    detailVC.testBlock = ^(NSString * _Nonnull name, NSInteger age) {
        NSLog(@"姓名:%@, 年龄:%ld", name, age);
    };
    
    [detailVC WWTestBlock:^(NSString * _Nonnull name, NSInteger age) {
        NSLog(@"姓名:%@, 年龄:%ld", name, age);
    }];
    
    void(^receiveBlock)(NSString *sss) = [detailVC testString];
    receiveBlock(@"小红 10岁");
    
    
    [self.navigationController pushViewController:detailVC animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WWHomgePageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}


#pragma mark - detailVC delegate
- (void)onClickDetailController:(UIViewController *)controller andString:(NSString *)string {
    NSLog(@"%@", string);
}

#pragma mark - 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NavHeight, SCRWIDTH, SCRHEIGHT - TabbarHeight - NavHeight) style:UITableViewStyleGrouped];
        [_tableView registerClass:[WWHomgePageCell class] forCellReuseIdentifier:cellID];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

@end
