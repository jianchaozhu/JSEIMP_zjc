//
//  JSEIMPLoginController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/12/1.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPLoginController.h"
#import "JSEIMPTabBarController.h"
#import "EdgeInsetsLabel.h"
#import "JSEIMPNetWorking.h"
#import <Masonry.h>
#import <SVProgressHUD.h>

@interface JSEIMPLoginController ()<UITextFieldDelegate>

@property(nonatomic,weak)UITextField *userNameField;

@property(nonatomic,weak)UITextField *passwordfield;

@end

@implementation JSEIMPLoginController{
    
    UIImageView *_backImageView;
    
    UIView *_view1;
    
    UIView *_view2;
    
    UIImageView *_userNameImageView;
    
    UIImageView *_passwordImageView;
    
    UIView *_backView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self.view endEditing:YES];
    
    [SVProgressHUD dismiss];

}

#pragma mark - UITextFieldDelegate屏幕上弹
-( void )textFieldDidBeginEditing:(UITextField *)textField
{
    //键盘高度216
    
    //滑动效果（动画）
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@ "ResizeForKeyboard"  context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //将视图的Y坐标向上移动，以使下面腾出地方用于软键盘的显示
    self.view.frame = CGRectMake(0.0f, -150.0f, self.view.frame.size.width, self.view.frame.size.height); //64-216
    
    [UIView commitAnimations];
}

#pragma mark - UITextFieldDelegate屏幕恢复
-( void )textFieldDidEndEditing:(UITextField *)textField
{
    //滑动效果
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@ "ResizeForKeyboard"  context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //恢复屏幕
    self.view.frame = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height); //64-216
    
    [UIView commitAnimations];
}

-(void)setupUI{
    
    _backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg"]];
    
    _backImageView.backgroundColor = [UIColor whiteColor];
    _backImageView.userInteractionEnabled = YES;
    
    [self.view addSubview:_backImageView];
    
    _backView = [[UIView alloc] init];
    
    _backView.backgroundColor = [UIColor blackColor];
    _backView.alpha = 0.34;
    
    [_backImageView addSubview:_backView];
    
    //    UIView *navigationView = [[UIView alloc] init];
    //
    //    navigationView.backgroundColor = [UIColor colorWithRed:56.0 / 255.0 green:57.0 / 255.0 blue:62.0 / 255.0 alpha:0.7];
    //    [_backImageView addSubview:navigationView];
    
    UIImageView *iconImageView = [[UIImageView alloc] init];
    
    iconImageView.image = [UIImage imageNamed:@"icon"];
    iconImageView.layer.cornerRadius = 50;
    iconImageView.clipsToBounds = YES;
    
    [_backImageView addSubview:iconImageView];
    
    UIImageView *titleImageView = [[UIImageView alloc] init];
    
    titleImageView.image = [UIImage imageNamed:@"renShengShiQiJi"];
    
    [_backImageView addSubview:titleImageView];
    
    _view1 = [[UIView alloc] init];
    
    _view1.backgroundColor = [UIColor whiteColor];
    _view1.layer.cornerRadius = 3;
    _view1.clipsToBounds = YES;
    
    [_backImageView addSubview:_view1];
    
    _userNameImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user"]];
    
    [_view1 addSubview:_userNameImageView];
    
    UITextField *userNameField = [[UITextField alloc] init];
    
    userNameField.placeholder = @"请输入用户名";
    userNameField.backgroundColor = [UIColor whiteColor];
    
    [_view1 addSubview:userNameField];
    
    self.userNameField = userNameField;
    self.userNameField.delegate = self;
    
    _view2 = [[UIView alloc] init];
    
    _view2.backgroundColor = [UIColor whiteColor];
    _view2.layer.cornerRadius = 3;
    _view2.clipsToBounds = YES;
    
    [_backImageView addSubview:_view2];
    
    _passwordImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lock"]];
    
    [_view2 addSubview:_passwordImageView];
    
    UITextField *passwordfield = [[UITextField alloc] init];
    
    passwordfield.placeholder = @"请输入密码";
    passwordfield.font = [UIFont systemFontOfSize:17];
    passwordfield.secureTextEntry = YES;
    
    [_backImageView addSubview:passwordfield];
    
    self.passwordfield = passwordfield;
    self.passwordfield.delegate = self;
    
    UIButton *loginButton = [self setButtonWithTitle:@"登陆"];
    [loginButton addTarget:self action:@selector(clickLoginButton) forControlEvents:UIControlEventTouchUpInside];
    //
    //    UIButton *zhuCeButton = [self setButtonWithTitle:@"注册"];
    //    [zhuCeButton addTarget:self action:@selector(clickZhueCeButton) forControlEvents:UIControlEventTouchUpInside];
    
    [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.bottom.mas_equalTo(self.view);
        
    }];
    
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.bottom.mas_equalTo(_backImageView);
        
    }];
    
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_backImageView.mas_top).offset(70);
        make.centerX.mas_equalTo(_backImageView.mas_centerX);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
        
    }];
    
    [titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(iconImageView.mas_bottom).offset(10);
        make.centerX.mas_equalTo(iconImageView.mas_centerX);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(30);
        
    }];
    
    [_view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(_backImageView.mas_centerX);
        make.top.mas_equalTo(iconImageView.mas_bottom).offset(135);
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(50);
        
    }];
    
    [_userNameImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.mas_equalTo(_view1).offset(15);
        make.width.height.mas_equalTo(20);
        
    }];
    
    [userNameField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_view1.mas_top).offset(8);
        make.left.mas_equalTo(_userNameImageView.mas_right).offset(8);
        make.bottom.mas_equalTo(_view1.mas_bottom).offset(-8);
        make.width.mas_equalTo(240);
    }];
    
    [_view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(_view1.mas_centerX);
        make.top.mas_equalTo(_view1.mas_bottom).offset(8);
        make.width.mas_equalTo(_view1.mas_width);
        make.height.mas_equalTo(_view1.mas_height);
        
    }];
    
    [_passwordImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_view2).offset(15);
        make.left.mas_equalTo(_view2.mas_left).offset(18);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(15);
        
    }];
    
    [passwordfield mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_view2.mas_top).offset(8);
        make.left.mas_equalTo(_passwordImageView.mas_right).offset(8);
        make.bottom.mas_equalTo(_view2.mas_bottom).offset(-8);
        make.width.mas_equalTo(240);
        
    }];
    
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_view2.mas_bottom).offset(8);
        make.left.mas_equalTo(_view2.mas_left);
        make.width.mas_equalTo(_view2.mas_width);
        make.height.mas_equalTo(_view2.mas_height);
        
    }];
    
    //
    //    [zhuCeButton mas_makeConstraints:^(MASConstraintMaker *make) {
    //
    //        make.top.mas_equalTo(loginButton.mas_bottom).offset(10);
    //        make.left.mas_equalTo(loginButton.mas_left);
    //        make.width.mas_equalTo(loginButton.mas_width);
    //        make.height.mas_equalTo(loginButton.mas_height);
    //        
    //    }];
    
}

//点击按钮登录
-(void)clickLoginButton{
    
    [self.view endEditing:YES];
    
    self.navigationItem.hidesBackButton = YES;
    
    //判断textField中有无输入
    if ((_passwordfield.text.length == 0 && _userNameField.text.length == 0) || _userNameField.text.length == 0) {
        
        [self setupAlertLabelWithTitle:@"请输入用户名和密码" Rect:CGRectMake(0, 0, 80, 30)];
        
    }else if (_userNameField.text.length > 0 && _passwordfield.text.length == 0){
        
        [self setupAlertLabelWithTitle:@"请输入密码" Rect:CGRectMake(0, 0, 80, 30)];
        
    }else if (_passwordfield.text.length != 0 && _userNameField.text.length != 0){
        
        [SVProgressHUD showWithStatus:@"正在检查用户名和密码..."];
        
        //登录
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            [NSThread sleepForTimeInterval:1.5];
            
            [JSEIMPNetWorking loginWithServerByUserName:_userNameField.text password:_passwordfield.text onSuccess:^{
                
                [SVProgressHUD showSuccessWithStatus:@"登录成功"];
                
                JSEIMPTabBarController *tabbarContoller = [JSEIMPTabBarController new];
                
                [self presentViewController:tabbarContoller animated:YES completion:nil];
                
                
            } onError:^(JSEIMPError code) {
                
                if (code == error_500 || code == error_400) {
                    
                    [SVProgressHUD showErrorWithStatus:@"用户名或者密码错误!请重新输入!"];
                    
                }else{
                    
                    [SVProgressHUD showErrorWithStatus:@"请检查网络"];
                }
            }];
        });
    }
    
}

//封装label和动画效果
-(void)setupAlertLabelWithTitle:(NSString *)title Rect:(CGRect)rect{
    
    EdgeInsetsLabel *label = [EdgeInsetsLabel new];
    
    label.text = title;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor blackColor];
    label.alpha = 0.0;
    label.font = [UIFont systemFontOfSize:12];
    label.textAlignment = UITextAlignmentCenter;
    label.layer.cornerRadius = 5;
    label.clipsToBounds = YES;
    label.edgeInsets = UIEdgeInsetsMake(5, 8, 5, 8);
    [label sizeToFit];
    
    [self.view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.centerY.mas_equalTo(self.view.mas_centerY).offset(200);
        make.height.mas_equalTo(30);
        
    }];
    
    [UIView animateWithDuration:0.5 animations:^{
        
        label.alpha = 0.3;
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.5 delay:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
            
            label.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            [label removeFromSuperview];
            
        }];
        
    }];
    
}

//按钮的封装
-(UIButton *)setButtonWithTitle:(NSString *)title{
    
    UIButton *button = [[UIButton alloc] init];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor colorWithRed:58.0 / 255.0 green:135.0 / 255.0 blue:251.0 / 255.0 alpha:1];
    button.layer.cornerRadius = 3;
    button.clipsToBounds = YES;
    
    [self.view addSubview:button];
    
    return button;
    
}

@end
