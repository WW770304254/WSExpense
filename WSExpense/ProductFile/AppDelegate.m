//
//  AppDelegate.m
//  WSExpense
//
//  Created by 王伟 on 2021/3/10.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //tabBar线条颜色
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, -0.5, [UIScreen mainScreen].bounds.size.width, 0.5)];
    view.backgroundColor = [UIColor colorWithRed:246.0/255 green:247.0/255 blue:249.0/255 alpha:1];
    [[UITabBar appearance] insertSubview:view atIndex:0];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    WWTabbarViewController *tabbarVC = [[WWTabbarViewController alloc] init];
    self.window.rootViewController = tabbarVC;
    
    
    [[NSUserDefaults standardUserDefaults] setValue:@"玩数" forKey:@"WSName"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSLog(@"%@",[[NSBundle mainBundle] bundlePath]);
    
    NSString *sss = [[NSUserDefaults standardUserDefaults] valueForKey:@"WSName"];
    NSLog(@"%@", sss);
    
    return YES;
}


@end
