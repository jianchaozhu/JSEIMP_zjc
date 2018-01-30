//
//  JSEIMPNextDealPeopleController.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/1/25.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPNextDealPeopleController.h"
#import "JSEIMPZaiBanItemsDetailController.h"
#import "JSEIMPWorkDesktopController.h"
#import "JSEIMPNetWorking.h"

@interface JSEIMPNextDealPeopleController ()

//登录id
@property(nonatomic,strong)NSMutableArray *loginIdMArray;
//角色id
@property(nonatomic,strong)NSMutableArray *roleIdMArray;
//用户id
@property(nonatomic,strong)NSMutableArray *userIdMArray;
//用户姓名
@property(nonatomic,strong)NSMutableArray *userNameMArray;
//用户身份Id
@property(nonatomic,strong)NSMutableArray *userStationIdMArray;
//用户单位ID
@property(nonatomic,strong)NSMutableArray *userUnitIdMArray;

@end

@implementation JSEIMPNextDealPeopleController{
    
    UIButton *_button;
    
    UIView *_buttonView;
    
    UILabel *_userNameLabel;
    
    UIBarButtonItem *_sureButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleViewLabel = [[UILabel alloc] init];
    titleViewLabel.frame = CGRectMake(0, 0, 180, 40);
    titleViewLabel.numberOfLines = 0;
    titleViewLabel.font = [UIFont systemFontOfSize:16];
    titleViewLabel.text = @"选择下一节点处理人:项目经理";
    titleViewLabel.textAlignment = NSTextAlignmentCenter;
    
    self.navigationItem.titleView = titleViewLabel;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
    _sureButton = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(clickSureButton:)];
    _sureButton.enabled = NO;
    self.navigationItem.rightBarButtonItem = _sureButton;
    
    [self getData];
}

-(void)getData{
    
    [JSEIMPNetWorking getCaoZuoPeopleWithProcessInstanceId:_processInstanceId ActivityDefinitionId:_activityDefinitionId OnSuccess:^(NSMutableArray *loginIdMArray,NSMutableArray *roleIdMArray,NSMutableArray *userIdMArray,NSMutableArray *userNameMArray,NSMutableArray *userSatationIdMArray,NSMutableArray *userUnitIdMArray){
        
        _loginIdMArray = loginIdMArray.copy;
        _roleIdMArray = roleIdMArray.copy;
        _userIdMArray = userIdMArray.copy;
        _userNameMArray = userNameMArray.copy;
        _userStationIdMArray = userSatationIdMArray.copy;
        _userUnitIdMArray = userUnitIdMArray.copy;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self setupUI];
        });
        
    } onErrorInfo:nil];
}

-(void)setupUI{
    
    for (int i = 0; i < _userNameMArray.count; i++) {
        
        _button = [self setButtonWithTag:i Action:@selector(clickButton:)];
        _button.frame = CGRectMake(16, 80 + 30 * i, 30, 30);
        
        _userNameLabel = [self setupLabelWithText:_userNameMArray[i] TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:26]];
        _userNameLabel.textAlignment = NSTextAlignmentRight;
        _userNameLabel.frame = CGRectMake(self.view.center.x, 80 + 30 * i, self.view.bounds.size.width / 2 - 16, 30);
        
    }
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
    
    [JSEIMPNetWorking PostToNextStepWithCurrentActivityId:_activityId TargetActivityId:_activityDefinitionId ActivityId:_activityDefinitionId UserId:_userIdMArray[_button.tag] LoginId:_loginIdMArray[_button.tag] UserName:_userNameMArray[_button.tag] UserStationId:_userStationIdMArray[_button.tag] UserUnitId:_userUnitIdMArray[_button.tag] RoleId:_roleIdMArray[_button.tag] Opinion:_option OnSuccess:^{
        
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
