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

@property(nonatomic,strong)UIButton *tempButton;
//合同状态
@property(nonatomic,strong)NSString *status;

@end

@implementation JSEIMPNextDealPeopleController{
    
    UIButton *_button;
    
    UIView *_buttonView1;
    
    UIView *_buttonView2;
    
    UILabel *_userNameLabel;
    
    UIBarButtonItem *_sureButton;
    
    NSInteger _buttonTag;
    
    NSUserDefaults *_defaults;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleViewLabel = [[UILabel alloc] init];
    titleViewLabel.frame = CGRectMake(0, 0, 180, 40);
    titleViewLabel.numberOfLines = 0;
    titleViewLabel.font = [UIFont systemFontOfSize:16];
    titleViewLabel.text = [NSString stringWithFormat:@"选择下一节点处理人:%@",_name];
    titleViewLabel.textAlignment = NSTextAlignmentCenter;
    
    self.navigationItem.titleView = titleViewLabel;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
    _sureButton = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(clickSureButtonWithTag:)];
    if ([_name isEqualToString:@"送结束"]) {
        _sureButton.enabled = YES;
    }else{
        _sureButton.enabled = NO;
    }
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
        
        _button = [self setButtonWithTag:i + 1 Action:@selector(clickButton:)];
        _button.frame = CGRectMake(self.view.center.x + 50, 80 + 50 * i, 40, 40);
        
        _userNameLabel = [self setupLabelWithText:_userNameMArray[i] TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:26]];
        _userNameLabel.textAlignment = NSTextAlignmentCenter;
        _userNameLabel.frame = CGRectMake(16, 80 + 50 * i, self.view.bounds.size.width / 2 - 16, 40);
        
    }
}

-(void)clickButton:(UIButton *)button{
    
    _buttonTag = button.tag;
    if (_tempButton == nil){
        button.selected = YES;
        _tempButton = button;
        _buttonView1 = [self setButtonView];
        _buttonView1.frame = CGRectMake(8, 8, 24, 24);
        [button addSubview:_buttonView1];
        [_buttonView2 removeFromSuperview];
        _sureButton.enabled = YES;
    }
    else if (_tempButton != nil && _tempButton == button){
        button.selected = YES;
        [_buttonView1 removeFromSuperview];
        _sureButton.enabled = NO;
        _tempButton = nil;
    }
    else if (_tempButton != button && _tempButton != nil){
        _tempButton.selected = NO;
        button.selected = YES;
        _tempButton = nil;
        [_buttonView1 removeFromSuperview];
        _buttonView2 = [self setButtonView];
        _buttonView2.frame = CGRectMake(8, 8, 24, 24);
        [button addSubview:_buttonView2];
    }
//    [self buttonClickWithTag:button.tag Status:button.selected Button:button];

}
//#pragma mark - 单选按钮的封装方法
//-(void)buttonClickWithTag:(NSInteger)buttonTag Status:(BOOL)buttonStatus Button:(UIButton *)button{
//
//    NSLog(@"%zd,%zd",button.tag,buttonTag);
//
//    if (_tempButton == nil && button.tag == buttonTag && buttonStatus == NO) {
//
//        _buttonView = [self setButtonView];
//        _buttonView.frame = CGRectMake(8, 8, 14, 14);
//        [button addSubview:_buttonView];
//        button.selected = YES;
//        _tempButton = button;
//        _sureButton.enabled = YES;
//    }else if (_tempButton!= nil &&  button.tag == buttonTag && buttonStatus == YES){
//
//        [_buttonView removeFromSuperview];
//        button.selected = NO;
//        _sureButton.enabled = NO;
//    }
//}

-(void)clickSureButtonWithTag:(NSInteger)tag{
    
    tag = _buttonTag;
    
    if (tag == 0) {
        
        [JSEIMPNetWorking PostToNextStepWithCurrentActivityId:_activityId TargetActivityId:_activityDefinitionId ActivityId:_activityDefinitionId UserId:nil LoginId:nil UserName:nil UserStationId:nil UserUnitId:nil RoleId:nil Opinion:_option OnSuccess:^{
            
            for(UIViewController *controller in self.navigationController.viewControllers) {
                
                if([controller isKindOfClass:[JSEIMPWorkDesktopController class]]) {
                    
                    if ([_name isEqualToString:@"送结束"]) {
                        
                        _status = @"已审";
                        NSLog(@"%@",_status);
                        _defaults = [NSUserDefaults standardUserDefaults];
                        [_defaults setValue:_status forKey:@"status"];
                    }
                    
                    [self.navigationController popToViewController:controller animated:YES];
                }
            }
        } onErrorInfo:nil];
    }else if (tag != 0){
        
        [JSEIMPNetWorking PostToNextStepWithCurrentActivityId:_activityId TargetActivityId:_activityDefinitionId ActivityId:_activityDefinitionId UserId:_userIdMArray[tag - 1] LoginId:_loginIdMArray[tag - 1] UserName:_userNameMArray[tag - 1] UserStationId:_userStationIdMArray[tag - 1] UserUnitId:_userUnitIdMArray[tag - 1] RoleId:_roleIdMArray[tag - 1] Opinion:_option OnSuccess:^{
            
            for(UIViewController *controller in self.navigationController.viewControllers) {
                
                if([controller isKindOfClass:[JSEIMPWorkDesktopController class]]) {
                    
                    [self.navigationController popToViewController:controller animated:YES];
                }
            }
        } onErrorInfo:nil];
    }
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
    view.layer.cornerRadius = 12;
    view.clipsToBounds = YES;
    view.userInteractionEnabled = NO;
    
    return view;
}

-(UIButton *)setButtonWithTag:(NSInteger)tag Action:(SEL)action{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"" forState:UIControlStateNormal];
    [button setTitleColor:nil forState:UIControlStateNormal];
    [button setTag:tag];
    button.layer.borderWidth = 1.0;
    button.layer.cornerRadius = 20;
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
