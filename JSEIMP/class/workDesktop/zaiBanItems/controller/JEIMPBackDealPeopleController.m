//
//  JEIMPBackDealPeopleController.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/1/30.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JEIMPBackDealPeopleController.h"
#import "JSEIMPZaiBanItemsDetailController.h"
#import "JSEIMPWorkDesktopController.h"
#import "JSEIMPNetWorking.h"

@interface JEIMPBackDealPeopleController ()

@property(nonatomic,strong)NSString *loginId;

@property(nonatomic,strong)NSString *roleId;

@property(nonatomic,strong)NSString *userId;

@property(nonatomic,strong)NSString *userName;

@property(nonatomic,strong)NSString *userStationId;

@property(nonatomic,strong)NSString *userUnitId;

@end

@implementation JEIMPBackDealPeopleController{
    
    UIButton *_button;
    
    UIView *_buttonView;
    
    UILabel *_userNameLabel;
    
    UIBarButtonItem *_sureButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@",_userIdMArray);
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleViewLabel = [[UILabel alloc] init];
    titleViewLabel.frame = CGRectMake(0, 0, 180, 40);
    titleViewLabel.numberOfLines = 0;
    titleViewLabel.font = [UIFont systemFontOfSize:16];
    titleViewLabel.text = @"发送目标确认(退回->发起人)";
    titleViewLabel.textAlignment = NSTextAlignmentCenter;
    
    self.navigationItem.titleView = titleViewLabel;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
    _sureButton = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(clickSureButton:)];
    _sureButton.enabled = NO;
    self.navigationItem.rightBarButtonItem = _sureButton;
    
    [self getData];
}

-(void)getData{
    
    [JSEIMPNetWorking getUserInfoWithUserId:_userIdMArray[0] OnSuccess:^(NSString *loginId,NSString *roleId,NSString *userId,NSString *userName,NSString *userStationId,NSString *userUnitId){
        
        if (loginId != nil) {
         _loginId = loginId.copy;
        }
        if (roleId != nil) {
            _roleId = roleId.copy;
        }else if (roleId == nil){
            _roleId = @"";
        }
        if (userId != nil) {
            _userId = userId.copy;
        }
        if (userName != nil) {
            _userName = userName.copy;
        }
        if (userStationId != nil) {
            _userStationId = userUnitId.copy;
        }else if (userStationId == nil){
            _userStationId = @"";
        }
        if (userUnitId != nil) {
            _userUnitId = userUnitId.copy;
        }else if (userUnitId == nil){
            _userUnitId = @"";
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self setupUI];
        });
    } onErrorInfo:nil];
}

-(void)setupUI{
    
    _button = [self setButtonWithTag:0 Action:@selector(clickButton:)];
    _button.frame = CGRectMake(16, 80 + 30 * _button.tag, 30, 30);
    
    _userNameLabel = [self setupLabelWithText:_userName TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:26]];
    _userNameLabel.textAlignment = NSTextAlignmentRight;
    _userNameLabel.frame = CGRectMake(self.view.center.x, 80 + 30 * _button.tag, self.view.bounds.size.width / 2 - 16, 30);
}

-(void)clickButton:(UIButton *)button{
    
    if (button.tag == 0 && button.selected == NO) {
        
        _buttonView = [self setButtonView];
        _buttonView.frame = CGRectMake(8, 8, 14, 14);
        [button addSubview:_buttonView];
        button.selected = YES;
        _sureButton.enabled = YES;
    }else if (button.tag == 0 && button.selected == YES){
        
        [_buttonView removeFromSuperview];
        button.selected = NO;
        _sureButton.enabled = NO;
    }
}

-(void)clickSureButton:(UIButton *)button{

    [JSEIMPNetWorking PostComeBackPeopleStepWithActivityInstanceId:_activityId ReturnTargetActivityInstanceId:_returnTargetActivityInstanceId ReturnReason:_reason UserId:_userId LoginId:_loginId UserName:_userName UserStationId:_userStationId UserUnitId:_userUnitId RoleId:_roleId
                                                         OnSuccess:^{
                                                             
        for(UIViewController *controller in self.navigationController.viewControllers) {
            
            if([controller isKindOfClass:[JSEIMPWorkDesktopController class]]) {
                
                [self.navigationController popToViewController:controller animated:YES];
            }
        }
    } onErrorInfo:nil];
}

-(void)returnAction{
    
    for(UIViewController *controller in self.navigationController.viewControllers) {
        
        if([controller isKindOfClass:[JSEIMPZaiBanItemsDetailController class]]) {
            
            [self.navigationController popToViewController:controller animated:YES];
        }
    }
}

-(UIView *)setButtonView{
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor blackColor];
    view.layer.cornerRadius = 7;
    view.clipsToBounds = YES;
    
    return view;
}

-(UIButton *)setButtonWithTag:(NSInteger)tag Action:(SEL)action{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"" forState:UIControlStateNormal];
    [button setTitleColor:nil forState:UIControlStateNormal];
    [button setTag:tag];
    button.layer.borderWidth = 1.0;
    button.layer.cornerRadius = 15;
    button.clipsToBounds = YES;
    [self.view addSubview:button];
    
    return button;
}

-(UILabel *)setupLabelWithText:(NSString *)text TextColor:(UIColor *)textColor Font:(UIFont *)font{
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    
    [self.view addSubview:label];
    
    return label;
}

@end
