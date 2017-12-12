//
//  JSEIMPNewStaffStoreController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/9/28.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPNewStaffStoreController.h"
#import <Masonry.h>
#import "LMJDropdownMenu.h"

#define UIScreesW [UIScreen mainScreen].bounds.size.width
#define UIScreesH [UIScreen mainScreen].bounds.size.height

@interface JSEIMPNewStaffStoreController ()<UITextFieldDelegate,UITextViewDelegate,LMJDropdownMenuDelegate>

@end

@implementation JSEIMPNewStaffStoreController{

    UIScrollView *_scrollView;
    
    UIView *_view;
    
    UIDatePicker *_datePicker;
    
    UIButton *_button;
    
    NSDate *_timeButtonDate;
    
    UIView *_cancelView;
    
    UIButton *_cancelButton;
    
    UIButton *_sureButton;
    
    UIView *_backView;
    
    UIView *_touchView;
    
    UIView *_touchView1;
    
    UILabel *_label1;
    
    UILabel *_label2;
    
    UILabel *_label3;
    
    UILabel *_label4;
    
    UILabel *_label5;
    
    UILabel *_label6;
    
    UILabel *_label7;
    
    UILabel *_label8;
    
    UILabel *_label9;
    
    UILabel *_label10;
    
    UILabel *_label11;
    
    UILabel *_label12;
    
    UILabel *_label13;
    
    UILabel *_label14;
    
    UILabel *_label15;
    
    UILabel *_label16;
    
    UILabel *_label17;
    
    UILabel *_label18;
    
    UILabel *_label19;
    
    UILabel *_label20;
    
    UITextField *_accountTextField;
    
    UITextField *_nameTextField;
    
    UITextField *_gongHaoTextField;

    UITextField *_companyTextField;
    
    UITextField *_buMenTextField;
    
    UITextField *_zhiWuTextField;
    
    UITextField *_xueLiTextField;
    
    UITextField *_zhuanYeTextField;
    
    UITextField *_telePhoneNumberTextField;
    
    UITextField *_phoneNumberTextField;
    
    LMJDropdownMenu *_sexDropDownMenu;
    
    LMJDropdownMenu *_engineerDropDownMenu;
    
    LMJDropdownMenu *_zhiJianYuanDropDownMenu;
    
    LMJDropdownMenu *_builderDropDownMenu;
    
    LMJDropdownMenu *_anQuanYuanDropDownMenu;
    
    LMJDropdownMenu *_shiGongYuanDropDownMenu;
    
    UIButton *_timeButton;
    
    UITextField *_idTextField;
    
    UITextField *_mailTextField;
    
    UITextView *_beiZhuTextView;
    
    UILabel *_beiZhuPlaceLabel;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"新建项目人员备案库";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
    [self setupUI];
    
}

- (void)returnAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setupUI{

    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:_scrollView];
    
    _view = [[UIView alloc] initWithFrame:_scrollView.bounds];
    
    _view.backgroundColor = [UIColor whiteColor];
    
    [_scrollView addSubview:_view];
    
    _touchView = [self setupTouchView];
    
    _label1 = [self setupLabelWithText:@"账号*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label2 = [self setupLabelWithText:@"姓名*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label3 = [self setupLabelWithText:@"工号*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label4 = [self setupLabelWithText:@"公司*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label5 = [self setupLabelWithText:@"部门*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label6 = [self setupLabelWithText:@"职务*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label7 = [self setupLabelWithText:@"学历*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label8 = [self setupLabelWithText:@"专业*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label9 = [self setupLabelWithText:@"手机*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label10 = [self setupLabelWithText:@"电话*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label11 = [self setupLabelWithText:@"性别*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label12 = [self setupLabelWithText:@"工程师证书*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label13 = [self setupLabelWithText:@"质检员证书*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label14 = [self setupLabelWithText:@"建造师证书*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label15 = [self setupLabelWithText:@"安全员证书*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label16 = [self setupLabelWithText:@"施工员证书*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label17 = [self setupLabelWithText:@"出生日期*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label18 = [self setupLabelWithText:@"身份证*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label19 = [self setupLabelWithText:@"邮箱*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label20 = [self setupLabelWithText:@"备注*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    
    _accountTextField = [self setupTextFieldWithPlacedText:@"请填写账号"];
    _nameTextField = [self setupTextFieldWithPlacedText:@"请填写姓名"];
    _gongHaoTextField = [self setupTextFieldWithPlacedText:@"请填写工号"];
    _companyTextField = [self setupTextFieldWithPlacedText:@"请填写公司"];
    _buMenTextField = [self setupTextFieldWithPlacedText:@"请填写部门"];
    _zhiWuTextField = [self setupTextFieldWithPlacedText:@"请填写职务"];
    _xueLiTextField = [self setupTextFieldWithPlacedText:@"请填写学历"];
    _zhuanYeTextField = [self setupTextFieldWithPlacedText:@"请填写专业"];
    _telePhoneNumberTextField = [self setupTextFieldWithPlacedText:@"请填写手机"];
    _phoneNumberTextField = [self setupTextFieldWithPlacedText:@"请填写电话"];
    _idTextField = [self setupTextFieldWithPlacedText:@"请填写身份证"];
    _mailTextField = [self setupTextFieldWithPlacedText:@"请填写邮箱"];
    
    _sexDropDownMenu = [self setupDropDownMenuWithRect:CGRectMake(84, 442, UIScreesW - 100, 30) Edge:UIEdgeInsetsMake(0, 15, 0, 0) Titles:@[@"男",@"女"] Tag:1];
    
    _timeButton = [self setButtonWithColor:[UIColor whiteColor] Title:@"==请选择日期=="];
    [_timeButton addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    
    _engineerDropDownMenu = [self setupDropDownMenuWithRect:CGRectMake(140, 484, UIScreesW - 156, 30) Edge:UIEdgeInsetsMake(0, 3, 0, 0) Titles:@[@"有",@"无"] Tag:2];
    _zhiJianYuanDropDownMenu = [self setupDropDownMenuWithRect:CGRectMake(140, 526, UIScreesW - 156, 30) Edge:UIEdgeInsetsMake(0, 3, 0, 0) Titles:@[@"有",@"无"] Tag:3];
    _builderDropDownMenu = [self setupDropDownMenuWithRect:CGRectMake(140, 568, UIScreesW - 156, 30) Edge:UIEdgeInsetsMake(0, 3, 0, 0) Titles:@[@"有",@"无"] Tag:4];
    _anQuanYuanDropDownMenu = [self setupDropDownMenuWithRect:CGRectMake(140, 610, UIScreesW - 156, 30) Edge:UIEdgeInsetsMake(0, 3, 0, 0) Titles:@[@"有",@"无"] Tag:5];
    _shiGongYuanDropDownMenu = [self setupDropDownMenuWithRect:CGRectMake(140, 652, UIScreesW - 156, 30) Edge:UIEdgeInsetsMake(0, 3, 0, 0) Titles:@[@"有",@"无"] Tag:6];
    
    _beiZhuTextView = [self setupTextView];
    _beiZhuPlaceLabel = [self setupPlaceLabelWithText:@"请填写备注" Font:[UIFont systemFontOfSize:16]];
    [_beiZhuTextView addSubview:_beiZhuPlaceLabel];
    
    [_touchView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.bottom.mas_equalTo(_view);
        make.right.mas_equalTo(_label1.mas_right);
        
    }];
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_view.mas_top).offset(16);
        make.left.mas_equalTo(_view.mas_left).offset(16);
        make.width.mas_equalTo(52);
        
    }];
    [_accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label1.mas_centerY);
        make.left.mas_equalTo(_label1.mas_right).offset(16);
        make.right.mas_equalTo(_view.mas_right).offset(-16);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label1.mas_left);
        make.top.mas_equalTo(_accountTextField.mas_bottom).offset(16);
        
    }];
    [_nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label2.mas_centerY);
        make.left.mas_equalTo(_accountTextField.mas_left);
        make.right.mas_equalTo(_accountTextField.mas_right);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_nameTextField.mas_bottom).offset(16);
        make.left.mas_equalTo(_label2.mas_left);
        make.width.mas_equalTo(52);
        
    }];
    [_gongHaoTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label3.mas_centerY);
        make.left.mas_equalTo(_nameTextField.mas_left);
        make.right.mas_equalTo(_nameTextField.mas_right);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label3.mas_left);
        make.top.mas_equalTo(_gongHaoTextField.mas_bottom).offset(16);
        
    }];
    [_companyTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label4.mas_centerY);
        make.left.mas_equalTo(_gongHaoTextField.mas_left);
        make.right.mas_equalTo(_gongHaoTextField.mas_right);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_companyTextField.mas_bottom).offset(16);
        make.left.mas_equalTo(_label4.mas_left);
        make.width.mas_equalTo(52);
        
    }];
    [_buMenTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label5.mas_centerY);
        make.left.mas_equalTo(_companyTextField.mas_left);
        make.right.mas_equalTo(_companyTextField.mas_right);
        make.height.mas_equalTo(30);
        
    }];

    [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label5.mas_left);
        make.top.mas_equalTo(_buMenTextField.mas_bottom).offset(16);
        
    }];
    [_zhiWuTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label6.mas_centerY);
        make.left.mas_equalTo(_buMenTextField.mas_left);
        make.right.mas_equalTo(_buMenTextField.mas_right);
        make.height.mas_equalTo(30);
        
    }];

    [_label7 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_zhiWuTextField.mas_bottom).offset(16);
        make.left.mas_equalTo(_label6.mas_left);
        make.width.mas_equalTo(52);
        
    }];
    [_xueLiTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label7.mas_centerY);
        make.left.mas_equalTo(_zhiWuTextField.mas_left);
        make.right.mas_equalTo(_zhiWuTextField.mas_right);
        make.height.mas_equalTo(30);
        
    }];

    [_label8 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label7.mas_left);
        make.top.mas_equalTo(_xueLiTextField.mas_bottom).offset(16);
        
    }];
    [_zhuanYeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label8.mas_centerY);
        make.left.mas_equalTo(_xueLiTextField.mas_left);
        make.right.mas_equalTo(_xueLiTextField.mas_right);
        make.height.mas_equalTo(30);
    }];

    [_label9 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_zhuanYeTextField.mas_bottom).offset(16);
        make.left.mas_equalTo(_label8.mas_left);
        
    }];
    [_telePhoneNumberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label9.mas_centerY);
        make.left.mas_equalTo(_zhuanYeTextField.mas_left);
        make.right.mas_equalTo(_zhuanYeTextField.mas_right);
        make.height.mas_equalTo(30);
        
    }];

    [_label10 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label9.mas_left);
        make.top.mas_equalTo(_telePhoneNumberTextField.mas_bottom).offset(16);
        
    }];
    [_phoneNumberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label10.mas_centerY);
        make.left.mas_equalTo(_telePhoneNumberTextField.mas_left);
        make.right.mas_equalTo(_telePhoneNumberTextField.mas_right);
        make.height.mas_equalTo(30);
        
    }];

    [_label11 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_phoneNumberTextField.mas_bottom).offset(16);
        make.left.mas_equalTo(_label10.mas_left);
        
    }];
    
    [_label12 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label11.mas_left);
        make.top.mas_equalTo(_sexDropDownMenu.mas_bottom).offset(16);
        
    }];
    
    [_label13 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_engineerDropDownMenu.mas_bottom).offset(16);
        make.left.mas_equalTo(_label12.mas_left);
        
    }];

    [_label14 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label13.mas_left);
        make.top.mas_equalTo(_zhiJianYuanDropDownMenu.mas_bottom).offset(16);
        
    }];

    [_label15 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_builderDropDownMenu.mas_bottom).offset(16);
        make.left.mas_equalTo(_label14.mas_left);
        
    }];

    [_label16 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label15.mas_left);
        make.top.mas_equalTo(_anQuanYuanDropDownMenu.mas_bottom).offset(16);
        
    }];

    [_label17 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_shiGongYuanDropDownMenu.mas_bottom).offset(16);
        make.left.mas_equalTo(_label16.mas_left);
        
    }];
    [_timeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label17.mas_centerY);
        make.left.mas_equalTo(_shiGongYuanDropDownMenu.mas_left);
        make.right.mas_equalTo(_shiGongYuanDropDownMenu.mas_right);
        make.height.mas_equalTo(30);
        
    }];

    [_label18 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_timeButton.mas_bottom).offset(16);
        make.left.mas_equalTo(_label17.mas_left);
        make.width.mas_equalTo(72);
        
    }];
    [_idTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label18.mas_bottom).offset(16);
        make.left.mas_equalTo(_label18.mas_left);
        make.right.mas_equalTo(_timeButton.mas_right);
        make.height.mas_equalTo(30);
        
    }];

    [_label19 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_idTextField.mas_bottom).offset(16);
        make.left.mas_equalTo(_label18.mas_left);
        
    }];
    [_mailTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label19.mas_bottom).offset(16);
        make.left.mas_equalTo(_label19.mas_left);
        make.right.mas_equalTo(_idTextField.mas_right);
        make.height.mas_equalTo(30);
    }];

    [_label20 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_mailTextField.mas_bottom).offset(16);
        make.left.mas_equalTo(_label19.mas_left);
        
    }];
    [_beiZhuTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label20.mas_bottom).offset(8);
        make.left.mas_equalTo(_mailTextField.mas_left);
        make.right.mas_equalTo(_mailTextField.mas_right);
        make.height.mas_equalTo(120);
        
    }];
    [_beiZhuPlaceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.top.mas_equalTo(_beiZhuTextView.mas_top).offset(8);
        make.left.mas_equalTo(_beiZhuTextView.mas_left).offset(6);
        
    }];
    
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo(UIScreesW);
        make.bottom.mas_equalTo(_beiZhuTextView.mas_bottom).offset(16);
        
    }];
    
}

#pragma mark - 触摸事件
-(void)touchEvent{
    
    [_sexDropDownMenu hideDropDown];
    [_engineerDropDownMenu hideDropDown];
    [_zhiJianYuanDropDownMenu hideDropDown];
    [_builderDropDownMenu hideDropDown];
    [_anQuanYuanDropDownMenu hideDropDown];
    [_shiGongYuanDropDownMenu hideDropDown];
    
    [_view endEditing:YES];
    
}

#pragma mark - <UITextViewDelegate>
-(void)textViewDidChange:(UITextView *)textView{
    
    if (_beiZhuTextView.hasText) {
        
        _beiZhuPlaceLabel.hidden = YES;
    }else if (!_beiZhuTextView.hasText){
        
        _beiZhuPlaceLabel.hidden = NO;
    }
    
}

#pragma mark - LMJDropdownMenuDelegate
-(void)dropdownMenuDidShow:(LMJDropdownMenu *)menu{

    if (menu.tag == 1) {
        
        _zhiJianYuanDropDownMenu.mainBtn.enabled = NO;
        _builderDropDownMenu.mainBtn.enabled = NO;
        _anQuanYuanDropDownMenu.mainBtn.enabled = NO;
        _shiGongYuanDropDownMenu.mainBtn.enabled = NO;
    }else if (menu.tag == 2){
    
        _sexDropDownMenu.mainBtn.enabled = NO;
        _builderDropDownMenu.mainBtn.enabled = NO;
        _anQuanYuanDropDownMenu.mainBtn.enabled = NO;
        _shiGongYuanDropDownMenu.mainBtn.enabled = NO;
    }else if (menu.tag == 3){
    
        _sexDropDownMenu.mainBtn.enabled = NO;
        _engineerDropDownMenu.mainBtn.enabled = NO;
        _anQuanYuanDropDownMenu.mainBtn.enabled = NO;
        _shiGongYuanDropDownMenu.mainBtn.enabled = NO;
    }else if (menu.tag == 4){
    
        _sexDropDownMenu.mainBtn.enabled = NO;
        _engineerDropDownMenu.mainBtn.enabled = NO;
        _zhiJianYuanDropDownMenu.mainBtn.enabled = NO;
        _shiGongYuanDropDownMenu.mainBtn.enabled = NO;
    }else if (menu.tag == 5){
    
        _sexDropDownMenu.mainBtn.enabled = NO;
        _engineerDropDownMenu.mainBtn.enabled = NO;
        _zhiJianYuanDropDownMenu.mainBtn.enabled = NO;
        _builderDropDownMenu.mainBtn.enabled = NO;
    }else if (menu.tag == 6){
    
        _sexDropDownMenu.mainBtn.enabled = NO;
        _engineerDropDownMenu.mainBtn.enabled = NO;
        _zhiJianYuanDropDownMenu.mainBtn.enabled = NO;
        _builderDropDownMenu.mainBtn.enabled = NO;
        _anQuanYuanDropDownMenu.mainBtn.enabled = NO;
    }

}

#pragma mark - UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    _timeButton.enabled = NO;
    
    [self scrollViewFrameChange];
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    _timeButton.enabled = YES;
    
    [self scrollViewFrameRecover];
    
}

#pragma mark - UITextViewDelegate
-(void)textViewDidBeginEditing:(UITextView *)textView{
    
    _timeButton.enabled = NO;
    
    [self scrollViewFrameChange];
    
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    
    _timeButton.enabled = YES;
    
    [self scrollViewFrameRecover];
    
}

#pragma mark - ScrollViewFramebianhua
-(void)scrollViewFrameChange{
    
    [_view mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_beiZhuTextView.mas_bottom).offset(226);
        
    }];
    
}

-(void)scrollViewFrameRecover{
    
    [_view mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_beiZhuTextView.mas_bottom).offset(10);
        
    }];
    
}

#pragma mark - 日期按钮点击事件
-(void)clickButton{
    
//    _timeButton.backgroundColor = [UIColor whiteColor];
    
    [self setupDatePicker];
    
    [self setupTimeButtonOfCancelView];
    
    [self setupBackView];
    
}

-(void)setupBackView{
    
    _backView = [[UIView alloc] init];
    
    _backView.backgroundColor = [UIColor lightGrayColor];
    _backView.alpha = 0.3;
    
    [self.view addSubview:_backView];
    
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.mas_equalTo(_view);
        make.bottom.mas_equalTo(_cancelView.mas_top);
        
    }];
    
}

#pragma mark - setupTimeButtonOfCancelView

-(void)setupTimeButtonOfCancelView{
    
    _cancelView = [[UIView alloc] init];
    
    _cancelView.backgroundColor = [UIColor colorWithRed:204.0 / 255.0 green:204.0 / 255.0 blue:204.0 / 255.0 alpha:1];
    
    [self.view addSubview:_cancelView];
    
    [_cancelView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.mas_equalTo(_view);
        make.bottom.mas_equalTo(_datePicker.mas_top).offset(10);
        make.height.mas_equalTo(44);
        
    }];
    
    [self setupButtonsOfTimeButton];
    
}

-(void)setupButtonsOfTimeButton{
    
    _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [_cancelButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_cancelButton addTarget:self action:@selector(clickCancelButton) forControlEvents:UIControlEventTouchUpInside];
    
    [_cancelView addSubview:_cancelButton];
    
    [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.mas_equalTo(_cancelView).offset(8);
        make.bottom.mas_equalTo(_cancelView.mas_bottom).offset(-8);
        
    }];
    
    _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
    [_sureButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_sureButton addTarget:self action:@selector(clickSureButton) forControlEvents:UIControlEventTouchUpInside];
    
    [_cancelView addSubview:_sureButton];
    
    [_sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_cancelView.mas_top).offset(8);
        make.bottom.right.mas_equalTo(_cancelView).offset(-8);
        
    }];
    
}

-(void)clickCancelButton{
    
    [_backView removeFromSuperview];
    [_cancelView removeFromSuperview];
    [_datePicker removeFromSuperview];
    
}

-(void)clickSureButton{
    
    [_backView removeFromSuperview];
    [_cancelView removeFromSuperview];
    [_datePicker removeFromSuperview];
    
    [self chooseTimeButtonDate];
    
}

-(void)setupDatePicker{
    
    _datePicker = [[UIDatePicker alloc] init];
    _datePicker.datePickerMode = UIDatePickerModeDate;
    [_datePicker addTarget:self action:@selector(chooseTimeButtonDate) forControlEvents:UIControlEventValueChanged];
    _datePicker.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_datePicker];
    //
    [_datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.bottom.mas_equalTo(self.view);
        make.height.mas_equalTo(200);
        
    }];
    
}

-(void)chooseTimeButtonDate{
    
    _timeButtonDate = _datePicker.date;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    
    NSString *dateString = [dateFormatter stringFromDate:_timeButtonDate];
    
    [_timeButton setTitle:dateString forState:UIControlStateNormal];
    
}

-(UILabel *)setupLabelWithText:(NSString *)text Font:(UIFont *)font TextColor:(UIColor *)textColor{
    
    UILabel *label = [[UILabel alloc] init];
    
    label.text = text;
    label.font = font;
    label.textColor = textColor;
    
    [_view addSubview:label];
    
    return label;
    
}

-(UITextField *)setupTextFieldWithPlacedText:(NSString *)placedText{
    
    UITextField *textField = [[UITextField alloc] init];
    
    textField.textAlignment = NSTextAlignmentCenter;
    textField.layer.borderWidth = 0.5;
    textField.placeholder = placedText;
    textField.delegate = self;
    textField.textColor = [UIColor darkGrayColor];
    textField.font = [UIFont systemFontOfSize:16];
    
    [_view addSubview:textField];
    
    return textField;
    
}

-(UIButton *)setButtonWithColor:(UIColor *)color Title:(NSString *)title{
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _button.backgroundColor = color;
    [_button setTitle:title forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    _button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_button setTitleEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
    _button.titleLabel.font = [UIFont systemFontOfSize:14];
    //    [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [_button.layer setBorderColor:[UIColor blackColor].CGColor];
    [_button.layer setBorderWidth:0.5];
    [_button.layer setMasksToBounds:YES];
    
    [_view addSubview:_button];
    
    return _button;
    
}

-(LMJDropdownMenu *)setupDropDownMenuWithRect:(CGRect)rect Edge:(UIEdgeInsets)edge Titles:(NSArray *)titles Tag:(NSInteger)tag{

    LMJDropdownMenu *dropDownMenu = [[LMJDropdownMenu alloc] init];
    [dropDownMenu setFrame:rect];
    dropDownMenu.tag = tag;
    [dropDownMenu.mainBtn setTitle:@"==请选择==" forState:UIControlStateNormal];
    [dropDownMenu.mainBtn setTitleEdgeInsets:edge];
    dropDownMenu.mainBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [dropDownMenu.mainBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [dropDownMenu setMenuTitles:titles rowHeight:30];
    
    [_view addSubview:dropDownMenu];
    
    return dropDownMenu;

}

-(UIView *)setupTouchView{

    UIView *view = [UIView new];
    
    view.backgroundColor = [UIColor whiteColor];
    
    [_view addSubview:view];
    
    //点击手势
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchEvent)];
    
    [view addGestureRecognizer:tapGestureRecognizer];
    
    return view;

}

-(UITextView *)setupTextView{
    
    UITextView *textView = [UITextView new];
    
    textView.layer.borderWidth = 0.5;
    //内容可以拖拽
    textView.alwaysBounceVertical = YES;
    //关闭键盘
    textView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    textView.font = [UIFont systemFontOfSize:16];
    textView.delegate = self;
    textView.textColor = [UIColor darkGrayColor];
    
    [_view addSubview:textView];
    
    return textView;
    
}

-(UILabel *)setupPlaceLabelWithText:(NSString *)text Font:(UIFont *)font{
    
    UILabel *label = [[UILabel alloc] init];
    
    label.text = text;
    label.font = font;
    label.textColor = [UIColor colorWithRed:190.0 / 255.0 green:190.0 / 255.0 blue:190.0 / 255.0 alpha:1];
    
    return label;
    
}

@end
