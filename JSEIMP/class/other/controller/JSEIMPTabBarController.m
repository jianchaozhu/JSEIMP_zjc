//
//  JSEIMPTabBarController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/9/5.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPTabBarController.h"
#import "JSEIMPNavigationController.h"

@interface JSEIMPTabBarController ()

@end

@implementation JSEIMPTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIViewController *dynamicViewController = [self controllerWithName:@"JSEIMPDynamicController" Title:@"动态" ImageName:@"dong"];
    
    UIViewController *applicationViewController = [self controllerWithName:@"JSEIMPAplicationController" Title:@"应用" ImageName:@"application"];
    
    UIViewController *workDesktopController = [self controllerWithName:@"JSEIMPWorkDesktopController" Title:@"工作台" ImageName:@"workDesktop"];
    
//    UIViewController *mineViewController = [self controllerWithName:@"JSEIMPMineController" Title:@"我的" ImageName:@"me"];
    
    self.viewControllers = @[dynamicViewController,applicationViewController,workDesktopController];
    
//    self.viewControllers = @[applicationViewController];
}

-(UIViewController *)controllerWithName:(NSString *)name Title:(NSString *)title ImageName:(NSString *)imageName{
    
    Class class = NSClassFromString(name);
    
    UIViewController *viewController = [[class alloc] init];
    
    viewController.tabBarItem.title = title;
    viewController.tabBarItem.image = [UIImage imageNamed:imageName];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_select",imageName]];
    
    JSEIMPNavigationController *eimpNavigationController = [[JSEIMPNavigationController alloc] initWithRootViewController:viewController];
    
    return eimpNavigationController;
    
}

@end
