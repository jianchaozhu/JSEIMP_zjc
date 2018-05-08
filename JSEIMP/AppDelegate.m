//
//  AppDelegate.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/9/5.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "AppDelegate.h"
#import "JSEIMPTabBarController.h"
#import "LCNewFeatureVC.h"
#import "JSEIMPLoginController.h"
#import "JSEIMPNetWorking.h"
#import "EZOpenSDK.h"
#import <SVProgressHUD.h>

#define SCREEN_SIZE [UIScreen mainScreen].bounds.size

@interface AppDelegate ()<LCNewFeatureVCDelegate>

@end

@implementation AppDelegate{

    LCNewFeatureVC *_newFeatureVC;
    
    UIView *_loginBackView;
    
    UIImageView *_chiLunImageView1;
    
    UIImageView *_chiLunImageView2;
    
    UIImageView *_chiLunImageView3;
    
    UIImageView *_loadingWordImageView;

}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [EZOPENSDK setDebugLogEnable:NO];
    
    [EZOPENSDK initLibWithAppKey:@"c4f5ff47a3444afd9f6571d7beb4542a"];
    
    [EZOPENSDK enableP2P:YES];
    
    [EZOPENSDK initPushService];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    UIViewController* myvc = [[UIViewController alloc] initWithNibName:nil bundle:nil];
    self.window.rootViewController = myvc;
    
    [JSEIMPNetWorking loginWithUserDefaults:^(NSString *username){
        
        [self setLoginingUI];
        //登录
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            [NSThread sleepForTimeInterval:0.5];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [SVProgressHUD showSuccessWithStatus:@"登陆成功"];
                
                JSEIMPTabBarController *tabbarController = [JSEIMPTabBarController new];
                
                [self restoreRootViewController:tabbarController];
            });
        });
    
    } onError:^(JSEIMPError code) {
        
        if (code == noUserData || code == error_500 || code == noNet) {
            
            JSEIMPLoginController *loginViewController = [JSEIMPLoginController new];
            
            [self restoreRootViewController:loginViewController];
        }
        
    }];
    
    [self.window makeKeyAndVisible];
//#pragma mark 1. 是否应该显示新特性界面
//
//    BOOL showNewFeature = [LCNewFeatureVC shouldShowNewFeature];
//
//    // 演示--每次都进入新特性界面, 实际项目不需要此句代码
////    showNewFeature = YES;
//
//    if (showNewFeature) {   // 如果需要显示新特性界面
//        __weak typeof(self) weakSelf = self;
//
//#pragma mark 2.1. 方式一: 点击添加的按钮进入主界面
//
//
//        // 进入主界面按钮
//        UIButton *enterBtn = [[UIButton alloc] init];
//        enterBtn.layer.cornerRadius = 20;
//        enterBtn.clipsToBounds = YES;
//        [enterBtn setBackgroundColor:[UIColor redColor]];
//        [enterBtn setTitle:@"进入主界面" forState:UIControlStateNormal];
//        [enterBtn setFrame:(CGRect){10.0f, SCREEN_SIZE.height * 0.82, SCREEN_SIZE.width - 20.0f, 40.0f}];
//        [enterBtn addTarget:self action:@selector(didClickedBtn) forControlEvents:UIControlEventTouchUpInside];
//
//        LCNewFeatureVC *newFeatureVC = [LCNewFeatureVC newFeatureWithImageName:@"new_feature"
//                                                                    imageCount:3
//                                                               showPageControl:YES
//                                                                   enterButton:enterBtn];
//        newFeatureVC.showSkip = YES;
//        newFeatureVC.skipBlock = ^(void) {
//            [weakSelf didClickedBtn];
//        };
//        _newFeatureVC = newFeatureVC;
//
//#pragma mark 3. 设置新特性界面的属性(可选步骤)
//
//        // 当前页码的代理
//        newFeatureVC.delegate = self;
//
//        // 当前点颜色, 默认[UIColor darkGrayColor]
//        newFeatureVC.pointCurrentColor = [UIColor redColor];
//
//#pragma mark 4. 设置新特性界面为当前窗口的根视图控制器
//
//        self.window.rootViewController = newFeatureVC;
//
//    } else {    // 如果不需要显示新特性界面
//
//        [self enterMainVC];
//    }
//
//    [self.window makeKeyAndVisible];
//
    return YES;
}

//#pragma mark - 点击了进入主界面的按钮
//
//- (void)didClickedBtn {
//
//    [self enterMainVC];
//}
//
//#pragma mark - 进入主界面
//
//- (void)enterMainVC {
//
//    UIViewController* myvc = [[UIViewController alloc] initWithNibName:nil bundle:nil];
//    self.window.rootViewController = myvc;
//
////    JSEIMPTabBarController *tabbarController = [JSEIMPTabBarController new];
////
////    [self restoreRootViewController:tabbarController];
//
//    [JSEIMPNetWorking loginWithUserDefaults:^(NSString *username){
//
//        [SVProgressHUD showSuccessWithStatus:@"登陆成功"];
//
//        JSEIMPTabBarController *tabbarController = [JSEIMPTabBarController new];
//
//        [self restoreRootViewController:tabbarController];
//
//    } onError:^(JSEIMPError code) {
//
//        if (code == noUserData || code == error_500 || code == noNet) {
//
//            JSEIMPLoginController *loginViewController = [JSEIMPLoginController new];
//
//            [self restoreRootViewController:loginViewController];
//
//        }
//
//    }];
//
//}

- (void)restoreRootViewController:(UIViewController *)rootViewController {
    
    [UIView transitionWithView:self.window duration:0.7f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        self.window.rootViewController = rootViewController;
        [UIView setAnimationsEnabled:oldState];
        
    } completion:nil];
}

//#pragma mark - LCNewFeatureVC Delegate
//
///**
// *  代理方法，回调当前页码
// *
// *  @param newFeatureVC 控制器
// *  @param page         当前页码
// */
//- (void)newFeatureVC:(LCNewFeatureVC *)newFeatureVC page:(NSInteger)page {
//    NSLog(@"%@ -> Page: %d", newFeatureVC, (int)page);
//}
//
//- (void)applicationWillResignActive:(UIApplication *)application {
//
//    NSLog(@"applicationWillResignActive");
//    sleep(0.5);
//}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

-(void)setLoginingUI{
    
    _loginBackView = [self setLineViewWithColor:[UIColor colorWithRed:127.0 / 255.0 green:127.0 / 255.0 blue:127.0 / 255.0 alpha:0.5]];
    _chiLunImageView1 = [self setImageViewWithImageName:@"chilun1"];
    _chiLunImageView2 = [self setImageViewWithImageName:@"chilun2"];
    _chiLunImageView3 = [self setImageViewWithImageName:@"chilun3"];
    _loadingWordImageView = [self setImageViewWithImageName:@"loading"];
    
    [_loginBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.bottom.mas_equalTo(self.window);
    }];
    [_chiLunImageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.window.mas_top).offset(309);
        make.left.mas_equalTo(self.window.mas_left).offset(171);
        make.width.height.mas_equalTo(22);
    }];
    [_chiLunImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.window.mas_top).offset(307);
        make.left.mas_equalTo(self.window.mas_left).offset(191);
        make.width.height.mas_equalTo(14);
    }];
    [_chiLunImageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.window.mas_top).offset(325);
        make.left.mas_equalTo(self.window.mas_left).offset(188);
        make.width.height.mas_equalTo(16);
    }];
    [_loadingWordImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_chiLunImageView3.mas_bottom).offset(11);
        make.left.mas_equalTo(self.window.mas_left).offset(171);
        make.width.mas_equalTo(34);
        make.height.mas_equalTo(10);
    }];
    
    [self setAnimationWithImageView:_chiLunImageView1 FromValue:[NSNumber numberWithFloat:0.f] ToValue:[NSNumber numberWithFloat: M_PI *2]];
    [self setAnimationWithImageView:_chiLunImageView2 FromValue:[NSNumber numberWithFloat: M_PI *2] ToValue:[NSNumber numberWithFloat:0.f]];
    [self setAnimationWithImageView:_chiLunImageView3 FromValue:[NSNumber numberWithFloat: M_PI *2] ToValue:[NSNumber numberWithFloat:0.f]];
    
}

-(void)setAnimationWithImageView:(UIImageView *)imageView FromValue:(NSNumber *)fromValue ToValue:(NSNumber *)toValue{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //默认是顺时针效果，若将fromValue和toValue的值互换，则为逆时针效果
    animation.fromValue = fromValue;
    animation.toValue = toValue;
    animation.duration = 2;
    animation.autoreverses = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount = MAXFLOAT; //如果这里想设置成一直自旋转，可以设置为MAXFLOAT，否则设置具体的数值则代表执行多少次
    [imageView.layer addAnimation:animation forKey:nil];
}


-(UIImageView *)setImageViewWithImageName:(NSString *)imageName{
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    
    [self.window addSubview:imageView];
    
    return imageView;
}

-(UIView *)setLineViewWithColor:(UIColor *)color{
    
    UIView *lineView = [[UIView alloc] init];
    
    lineView.backgroundColor = color;
    
    [self.window addSubview:lineView];
    
    return lineView;
}

@end
