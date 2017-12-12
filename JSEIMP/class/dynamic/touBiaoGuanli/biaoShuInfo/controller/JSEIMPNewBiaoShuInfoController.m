//
//  JSEIMPNewBiaoShuInfoController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/10/16.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPNewBiaoShuInfoController.h"
#import "LMJDropdownMenu.h"
#import <Masonry.h>

#define UIScreenW [UIScreen mainScreen].bounds.size.width
#define UIScreenH [UIScreen mainScreen].bounds.size.height

@interface JSEIMPNewBiaoShuInfoController ()<UITextFieldDelegate,UITextViewDelegate,LMJDropdownMenuDelegate>

@end

@implementation JSEIMPNewBiaoShuInfoController{

    UIScrollView *_scrollView;
    
    UIView *_view;
    
    UIView *_touchView;
    
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
    
    LMJDropdownMenu *_projectNameMenu;
    
    UITextView *_projectAdressTextView;
    
    UILabel *_projectAdressPlaceLabel;
    
    UITextField *_buildCompanyTextField;
    
    UITextField *_guiMoTextField;
    
    UITextField *_zhaoBiaoStyleTextField;
    
    UITextField *_ziJinLaiYuanTextField;

    UITextField *_jieShaoRenTextField;
    
    UITextField *_shenQingRenTextField;
    
    UITextField *_heTongStyleTextField;
    
    UITextField *_baoZhengJinTextField;
    
    UITextView *_beiZhuTextView;
    
    UILabel *_beiZhuPlaceLabel;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"新建标书信息";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
    [self setupUI];
    
}

- (void)returnAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 触摸事件
-(void)touchEvent{
    
    [_projectNameMenu hideDropDown];
    [_view endEditing:YES];
    
}

-(void)setupUI{

    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:_scrollView];
    
    _view = [[UIView alloc] initWithFrame:_scrollView.bounds];
    
    _view.backgroundColor = [UIColor whiteColor];
    
    [_scrollView addSubview:_view];
    
    _touchView = [UIView new];
    
    _touchView.backgroundColor = [UIColor whiteColor];
    
    [_view addSubview:_touchView];
    
    //点击手势
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchEvent)];
    
    [_touchView addGestureRecognizer:tapGestureRecognizer];
    
    _label1 = [self setupLabelWithText:@"项目名称*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label2 = [self setupLabelWithText:@"项目地址*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label3 = [self setupLabelWithText:@"建设单位*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label4 = [self setupLabelWithText:@"工程规模(m2)*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label5 = [self setupLabelWithText:@"招标模式*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label6 = [self setupLabelWithText:@"资金来源*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label7 = [self setupLabelWithText:@"介绍人*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label8 = [self setupLabelWithText:@"申请人*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label9 = [self setupLabelWithText:@"合同形式*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label10 = [self setupLabelWithText:@"保证金*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label11 = [self setupLabelWithText:@"备注*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    
    _projectNameMenu = [self setDropDownMenuWithFrame:CGRectMake(16, 55, UIScreenW - 32, 30) Title:@"==请选择项目名称==" Titles:@[@"无锡万科天一项目4A、5A施工总承包工程",@"瓦屋李新城二期土建安装工程"]];
    _buildCompanyTextField = [self setupTextFieldWithPlacedText:@"请填写建设单位"];
    _guiMoTextField = [self setupTextFieldWithPlacedText:@"请填写项目规模"];
    _zhaoBiaoStyleTextField = [self setupTextFieldWithPlacedText:@"请填写招标模式"];
    _ziJinLaiYuanTextField = [self setupTextFieldWithPlacedText:@"请填写资金来源"];
    _jieShaoRenTextField = [self setupTextFieldWithPlacedText:@"请填写介绍人"];
    _shenQingRenTextField = [self setupTextFieldWithPlacedText:@"请填写申请人"];
    _heTongStyleTextField = [self setupTextFieldWithPlacedText:@"请填写合同形式"];
    _baoZhengJinTextField = [self setupTextFieldWithPlacedText:@"请填写保证金"];
    
    _projectAdressTextView = [self setupTextView];
    _projectAdressPlaceLabel = [self setupPlaceLabelWithText:@"请填写项目地址" Font:[UIFont systemFontOfSize:16]];
    [_projectAdressTextView addSubview:_projectAdressPlaceLabel];
    
    _beiZhuTextView = [self setupTextView];
    _beiZhuPlaceLabel = [self setupPlaceLabelWithText:@"请填写您要描述的内容" Font:[UIFont systemFontOfSize:16]];
    [_beiZhuTextView addSubview:_beiZhuPlaceLabel];
    
    [_touchView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.bottom.mas_equalTo(_view);
        make.right.mas_equalTo(_label1.mas_right);
        
    }];
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.mas_equalTo(_view).offset(16);
        
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_projectNameMenu.mas_left);
        make.top.mas_equalTo(_projectNameMenu.mas_bottom).offset(16);
        
    }];
    [_projectAdressTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label2.mas_bottom).offset(8);
        make.left.mas_equalTo(_projectNameMenu.mas_left);
        make.right.mas_equalTo(_projectNameMenu.mas_right);
        make.height.mas_equalTo(45);
        
    }];
    [_projectAdressPlaceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_projectAdressTextView.mas_top).offset(6);
        make.centerX.mas_equalTo(_projectAdressTextView.mas_centerX);
        
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label2.mas_left);
        make.top.mas_equalTo(_projectAdressTextView.mas_bottom).offset(16);
        
    }];
    [_buildCompanyTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label3.mas_bottom).offset(16);
        make.left.mas_equalTo(_projectAdressTextView.mas_left);
        make.right.mas_equalTo(_projectAdressTextView.mas_right);
        make.height.mas_equalTo(30);
    }];
    
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_buildCompanyTextField.mas_left);
        make.top.mas_equalTo(_buildCompanyTextField.mas_bottom).offset(16);
        make.width.mas_equalTo(136);
        
    }];
    [_guiMoTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label4.mas_centerY);
        make.left.mas_equalTo(_label4.mas_right).offset(16);
        make.right.mas_equalTo(_buildCompanyTextField.mas_right);
        make.height.mas_equalTo(30);
        
    }];

    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label4.mas_left);
        make.top.mas_equalTo(_guiMoTextField.mas_bottom).offset(16);
        
    }];
    [_zhaoBiaoStyleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label5.mas_centerY);
        make.left.mas_equalTo(_guiMoTextField.mas_left);
        make.right.mas_equalTo(_guiMoTextField.mas_right);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label5.mas_left);
        make.top.mas_equalTo(_zhaoBiaoStyleTextField.mas_bottom).offset(16);
        
    }];
    [_ziJinLaiYuanTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label6.mas_centerY);
        make.left.mas_equalTo(_zhaoBiaoStyleTextField.mas_left);
        make.right.mas_equalTo(_zhaoBiaoStyleTextField.mas_right);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label7 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label6.mas_left);
        make.top.mas_equalTo(_ziJinLaiYuanTextField.mas_bottom).offset(16);
        
    }];
    [_jieShaoRenTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label7.mas_centerY);
        make.left.mas_equalTo(_ziJinLaiYuanTextField.mas_left);
        make.right.mas_equalTo(_ziJinLaiYuanTextField.mas_right);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label8 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label7.mas_left);
        make.top.mas_equalTo(_jieShaoRenTextField.mas_bottom).offset(16);
        
    }];
    [_shenQingRenTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label8.mas_centerY);
        make.left.mas_equalTo(_jieShaoRenTextField.mas_left);
        make.right.mas_equalTo(_jieShaoRenTextField.mas_right);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label9 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label8.mas_left);
        make.top.mas_equalTo(_shenQingRenTextField.mas_bottom).offset(16);
        
    }];
    [_heTongStyleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label9.mas_centerY);
        make.left.mas_equalTo(_shenQingRenTextField.mas_left);
        make.right.mas_equalTo(_shenQingRenTextField.mas_right);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label10 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label9.mas_left);
        make.top.mas_equalTo(_heTongStyleTextField.mas_bottom).offset(16);
        
    }];
    [_baoZhengJinTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label10.mas_centerY);
        make.left.mas_equalTo(_heTongStyleTextField.mas_left);
        make.right.mas_equalTo(_heTongStyleTextField.mas_right);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label11 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label10.mas_left);
        make.top.mas_equalTo(_label10.mas_bottom).offset(16);
        
    }];
    [_beiZhuTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label11.mas_bottom).offset(8);
        make.left.mas_equalTo(_buildCompanyTextField.mas_left);
        make.right.mas_equalTo(_buildCompanyTextField.mas_right);
        make.height.mas_equalTo(120);
        
    }];
    [_beiZhuPlaceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.top.mas_equalTo(_beiZhuTextView.mas_top).offset(8);
        make.left.mas_equalTo(_beiZhuTextView.mas_left).offset(6);
        
    }];
    
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_beiZhuTextView.mas_bottom).offset(16);
        
    }];

}

#pragma mark - <UITextViewDelegate>
-(void)textViewDidChange:(UITextView *)textView{
    
    if (_projectAdressTextView.hasText) {
        
        _projectAdressPlaceLabel.hidden = YES;
    }else if (!_projectAdressTextView.hasText){
        
        _projectAdressPlaceLabel.hidden = NO;
    }
    
    if (_beiZhuTextView.hasText) {
        
        _beiZhuPlaceLabel.hidden = YES;
    }else if (!_beiZhuTextView.hasText){
        
        _beiZhuPlaceLabel.hidden = NO;
    }
    
}

#pragma mark - LMJDropdownMenuDelegate
-(void)dropdownMenuDidShow:(LMJDropdownMenu *)menu{
    
    _buildCompanyTextField.enabled = NO;
    _guiMoTextField.enabled = NO;
    _zhaoBiaoStyleTextField.enabled = NO;
    _projectAdressTextView.editable = NO;
    _ziJinLaiYuanTextField.enabled = NO;
    _jieShaoRenTextField.enabled = NO;
    _shenQingRenTextField.enabled = NO;
    
}

-(void)dropdownMenuDidHidden:(LMJDropdownMenu *)menu{
    
    _buildCompanyTextField.enabled = YES;
    _guiMoTextField.enabled = YES;
    _zhaoBiaoStyleTextField.enabled = YES;
    _projectAdressTextView.editable = YES;
    _ziJinLaiYuanTextField.enabled = YES;
    _jieShaoRenTextField.enabled = YES;
    _shenQingRenTextField.enabled = YES;
    
}

#pragma mark - UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    _projectNameMenu.mainBtn.enabled = NO;
    
    [self scrollViewFrameChange];
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    _projectNameMenu.mainBtn.enabled = YES;
    
    [self scrollViewFrameRecover];
    
}

#pragma mark - UITextViewDelegate
-(void)textViewDidBeginEditing:(UITextView *)textView{
    
    _projectNameMenu.mainBtn.enabled = NO;

    [self scrollViewFrameChange];
    
}

-(void)textViewDidEndEditing:(UITextView *)textView{

    _projectNameMenu.mainBtn.enabled = YES;
    
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

-(LMJDropdownMenu *)setDropDownMenuWithFrame:(CGRect)frame Title:(NSString *)title Titles:(NSArray *)titles{
    
    LMJDropdownMenu *dropDownMenu = [[LMJDropdownMenu alloc] init];
    
    dropDownMenu.delegate = self;
    [dropDownMenu setFrame:frame];
    [dropDownMenu.mainBtn setTitle:title forState:UIControlStateNormal];
    [dropDownMenu.mainBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 3, 0, 5)];
    [dropDownMenu.mainBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    dropDownMenu.mainBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [dropDownMenu setMenuTitles:titles rowHeight:30];
    
    [_view addSubview:dropDownMenu];
    
    return dropDownMenu;
    
}

-(UILabel *)setupLabelWithText:(NSString *)text Font:(UIFont *)font TextColor:(UIColor *)textColor{
    
    UILabel *label = [[UILabel alloc] init];
    
    label.text = text;
    label.font = font;
    label.textColor = textColor;
    
    [_view addSubview:label];
    
    return label;
    
}

@end
