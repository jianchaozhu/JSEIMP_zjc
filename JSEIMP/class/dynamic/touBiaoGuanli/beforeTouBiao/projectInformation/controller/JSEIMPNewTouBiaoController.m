//
//  JSEIMPNewTouBiaoController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/9/18.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPNewTouBiaoController.h"
#import "LMJDropdownMenu.h"
#import <Masonry.h>

#define UIScreesW [UIScreen mainScreen].bounds.size.width
#define UIScreesH [UIScreen mainScreen].bounds.size.height

@interface JSEIMPNewTouBiaoController ()<LMJDropdownMenuDelegate,UITextFieldDelegate,UITextViewDelegate>

@end

@implementation JSEIMPNewTouBiaoController{

    UIScrollView *_scrollView;
    
    UIView *_view;
    
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
    
    UITextField *_projectNumberTextField;
    
    UITextView *_projectNameTextView;
    
    UILabel *_projectNamePlaceLabel;
    
    UITextView *_projectAdressTextView;
    
    UILabel *_projectAdressPlaceLabel;
    
    LMJDropdownMenu *_projectAreaMenu;
    
    UITextView *_buildCompanyTextView;
    
    UILabel *_buildCompanyPlaceLabel;
    
    UITextField *_guiMoTextField;
    
    UITextField *_moneyFromTextField;
    
    LMJDropdownMenu *_touBiaoStyleMenu;
    
    UITextField *_contactPeopleTextField;
    
    LMJDropdownMenu *_isZhongBiaoMenu;
    
    int _keyBoardHeight;
    
    UIView *_backView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"新建项目";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
    [self setupUI];
    
}

- (void)returnAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - LMJDropdownMenuDelegate
-(void)dropdownMenuWillShow:(LMJDropdownMenu *)menu{

    _projectNumberTextField.enabled = NO;
    _projectNameTextView.editable = NO;
    _projectAdressTextView.editable = NO;
    _buildCompanyTextView.editable = NO;
    _guiMoTextField.enabled = NO;
    _moneyFromTextField.enabled = NO;
    _contactPeopleTextField.enabled = NO;
    
    if (menu.tag == 1) {
        
        _touBiaoStyleMenu.mainBtn.enabled = NO;
        _isZhongBiaoMenu.mainBtn.enabled = NO;
    }else if (menu.tag == 2){
    
        _projectAreaMenu.mainBtn.enabled = NO;
        _isZhongBiaoMenu.mainBtn.enabled = NO;
    }else if (menu.tag == 3){
    
        _projectAreaMenu.mainBtn.enabled = NO;
        _touBiaoStyleMenu.mainBtn.enabled = NO;
        
        [_view mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.mas_equalTo(_scrollView);
            make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
            make.bottom.mas_equalTo(_isZhongBiaoMenu.listView.mas_bottom).offset(16);
            
        }];
        
    }

}

-(void)dropdownMenuWillHidden:(LMJDropdownMenu *)menu{

    _projectNumberTextField.enabled = YES;
    _projectNameTextView.editable = YES;
    _projectAdressTextView.editable = YES;
    _buildCompanyTextView.editable = YES;
    _guiMoTextField.enabled = YES;
    _moneyFromTextField.enabled = YES;
    _contactPeopleTextField.enabled = YES;
    
    if (menu.tag == 1) {
        
        _touBiaoStyleMenu.mainBtn.enabled = YES;
        _isZhongBiaoMenu.mainBtn.enabled = YES;
    }else if (menu.tag == 2){
        
        _projectAreaMenu.mainBtn.enabled = YES;
        _isZhongBiaoMenu.mainBtn.enabled = YES;
    }else if (menu.tag == 3){
        
        _projectAreaMenu.mainBtn.enabled = YES;
        _touBiaoStyleMenu.mainBtn.enabled = YES;
    }

}

#pragma mark - <UITextViewDelegate>
-(void)textViewDidChange:(UITextView *)textView{
    
    if (_projectNameTextView.hasText) {
        
        _projectNamePlaceLabel.hidden = YES;
    }else if (!_projectNameTextView.hasText){
        
        _projectNamePlaceLabel.hidden = NO;
    }
    if (_projectAdressTextView.hasText) {
        
        _projectAdressPlaceLabel.hidden = YES;
    }else if (!_projectAdressTextView.hasText){
        
        _projectAdressPlaceLabel.hidden = NO;
    }
    if (_buildCompanyTextView.hasText) {
        
        _buildCompanyPlaceLabel.hidden = YES;
    }else if (!_buildCompanyTextView.hasText){
        
        _buildCompanyPlaceLabel.hidden = NO;
    }
    
}

#pragma mark - UITextViewdDelegate
-(void)textViewDidBeginEditing:(UITextView *)textView{

    [self scrollViewFrameChange];
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    
    [self scrollViewFrameRecover];

}

#pragma mark - UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [self scrollViewFrameChange];

}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    [self scrollViewFrameRecover];

}

-(void)touchEvent{
    
    [_projectAreaMenu hideDropDown];
    [_touBiaoStyleMenu hideDropDown];
    [_isZhongBiaoMenu hideDropDown];
    [_view endEditing:YES];
    
}

-(void)setupUI{

    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:_scrollView];
    
    _view = [[UIView alloc] initWithFrame:_scrollView.bounds];
    
    _view.backgroundColor = [UIColor whiteColor];
    
    [_scrollView addSubview:_view];

    _backView = [UIView new];
    
    _backView.backgroundColor = [UIColor whiteColor];
    
    [_view addSubview:_backView];
    
    //点击手势
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchEvent)];
    
    [_backView addGestureRecognizer:tapGestureRecognizer];
    
    _label1 = [self setupLabelWithText:@"项目编号*" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label2 = [self setupLabelWithText:@"项目名称*" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label3 = [self setupLabelWithText:@"项目地址*" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label4 = [self setupLabelWithText:@"项目区域*" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label5 = [self setupLabelWithText:@"建设单位*" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label6 = [self setupLabelWithText:@"规模*" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label7 = [self setupLabelWithText:@"资金来源*" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label8 = [self setupLabelWithText:@"投标模式*" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label9 = [self setupLabelWithText:@"联系人*" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label10 = [self setupLabelWithText:@"是否中标*" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _projectNumberTextField = [self setupTextFieldWithPlacedText:@"请填写项目编号"];
    [_projectNumberTextField becomeFirstResponder];
    
    _projectNameTextView = [self setupTextView];
    _projectNamePlaceLabel = [self setupPlaceLabelWithText:@"请填写项目名称" Font:[UIFont systemFontOfSize:16]];
    [_projectNameTextView addSubview:_projectNamePlaceLabel];
    
    _projectAdressTextView = [self setupTextView];
    _projectAdressPlaceLabel = [self setupPlaceLabelWithText:@"请填写项目地址" Font:[UIFont systemFontOfSize:16]];
    [_projectAdressTextView addSubview:_projectAdressPlaceLabel];
    _projectAreaMenu = [self setDropDownMenuWithFrame:CGRectMake(124, 142, UIScreesW - 140, 30) Title:@"==请选择项目区域==" Titles:@[@"华东",@"江南",@"南京",@"中原"] Tag:1];
    
//    _projectAreaTexrtField = [self setupTextFieldWithPlacedText:@"==请选择项目区域=="];
    
    _buildCompanyTextView = [self setupTextView];
    _buildCompanyPlaceLabel = [self setupPlaceLabelWithText:@"请填写建设单位" Font:[UIFont systemFontOfSize:16]];
    [_buildCompanyTextView addSubview:_buildCompanyPlaceLabel];
    
    _guiMoTextField = [self setupTextFieldWithPlacedText:@"请填写规模"];
    _moneyFromTextField = [self setupTextFieldWithPlacedText:@"请填写资金来源"];
    _touBiaoStyleMenu = [self setDropDownMenuWithFrame:CGRectMake(124, 312, UIScreesW - 140, 30) Title:@"==请选择投标模式==" Titles:@[@"公开投标",@"邀请招标",@"直接发包"] Tag:2];
    _contactPeopleTextField = [self setupTextFieldWithPlacedText:@"请填写联系人"];
    _isZhongBiaoMenu = [self setDropDownMenuWithFrame:CGRectMake(124, 398, UIScreesW - 140, 30) Title:@"==请选择是否中标==" Titles:@[@"是",@"否"] Tag:3];
    
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.bottom.mas_equalTo(_view);
        make.right.mas_equalTo(_label1.mas_right);
        
    }];
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.mas_equalTo(_view).offset(16);
        make.width.mas_equalTo(92);
        
    }];
    [_projectNumberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label1.mas_centerY);
        make.left.mas_equalTo(_label1.mas_right).offset(16);
        make.right.mas_equalTo(_view.mas_right).offset(-16);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label1.mas_left);
        make.top.mas_equalTo(_projectNumberTextField.mas_bottom).offset(16);
        
    }];
    [_projectNameTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_projectNumberTextField.mas_left);
        make.right.mas_equalTo(_projectNumberTextField.mas_right);
        make.centerY.mas_equalTo(_label2.mas_centerY);
        make.height.mas_equalTo(30);
    }];
    [_projectNamePlaceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_projectNameTextView.mas_top).offset(4);
        make.centerX.mas_equalTo(_projectNameTextView.mas_centerX);
        
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label2.mas_left);
        make.top.mas_equalTo(_projectNameTextView.mas_bottom).offset(16);
        
    }];
    [_projectAdressTextView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.mas_equalTo(_projectNameTextView.mas_left);
        make.right.mas_equalTo(_projectNameTextView.mas_right);
        make.centerY.mas_equalTo(_label3.mas_centerY);
        make.height.mas_equalTo(30);
    }];
    [_projectAdressPlaceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_projectAdressTextView.mas_top).offset(4);
        make.centerX.mas_equalTo(_projectAdressTextView.mas_centerX);
        
    }];
    
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label3.mas_left);
        make.top.mas_equalTo(_projectAdressTextView.mas_bottom).offset(16);
        
    }];
    
    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label4.mas_left);
        make.top.mas_equalTo(_projectAreaMenu.mas_bottom).offset(16);
        
    }];
    [_buildCompanyTextView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.mas_equalTo(_projectAreaMenu.mas_left);
        make.right.mas_equalTo(_projectAreaMenu.mas_right);
        make.centerY.mas_equalTo(_label5.mas_centerY);
        make.height.mas_equalTo(30);
        
    }];
    [_buildCompanyPlaceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_buildCompanyTextView.mas_top).offset(4);
        make.centerX.mas_equalTo(_buildCompanyTextView.mas_centerX);
        
    }];

    [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label5.mas_left);
        make.top.mas_equalTo(_buildCompanyTextView.mas_bottom).offset(16);
        
    }];
    [_guiMoTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label6.mas_centerY);
        make.left.mas_equalTo(_buildCompanyTextView.mas_left);
        make.right.mas_equalTo(_buildCompanyTextView.mas_right);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label7 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label6.mas_left);
        make.top.mas_equalTo(_guiMoTextField.mas_bottom).offset(16);
        make.width.mas_equalTo(92);
        
    }];
    [_moneyFromTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label7.mas_centerY);
        make.left.mas_equalTo(_guiMoTextField.mas_left);
        make.right.mas_equalTo(_guiMoTextField.mas_right);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label8 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label7.mas_left);
        make.top.mas_equalTo(_moneyFromTextField.mas_bottom).offset(16);
        
    }];
    
    [_label9 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label8.mas_left);
        make.top.mas_equalTo(_touBiaoStyleMenu.mas_bottom).offset(16);
        
    }];
    [_contactPeopleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label9.mas_centerY);
        make.left.mas_equalTo(_touBiaoStyleMenu.mas_left);
        make.right.mas_equalTo(_touBiaoStyleMenu.mas_right);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label10 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label9.mas_left);
        make.top.mas_equalTo(_contactPeopleTextField.mas_bottom).offset(16);
        
    }];
    
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_label10.mas_bottom).offset(16);
        
    }];
    
}

-(void)scrollViewFrameChange{

    [_view mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_label10.mas_bottom).offset(286);
        
    }];

}

-(void)scrollViewFrameRecover{
    
    [_view mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_label10.mas_bottom).offset(16);
        
    }];
    
}

-(UILabel *)setupLabelWithText:(NSString *)text TextColor:(UIColor *)textColor Font:(UIFont *)font{
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    
    [_view addSubview:label];
    
    return label;
    
}

-(UITextField *)setupTextFieldWithPlacedText:(NSString *)placedText{

    UITextField *textField = [[UITextField alloc] init];
    
    textField.layer.borderWidth = 0.5;
    textField.textAlignment = NSTextAlignmentCenter;;
    textField.placeholder = placedText;
    textField.delegate = self;
    textField.textColor = [UIColor darkGrayColor];
    textField.font = [UIFont systemFontOfSize:16];
    
    [_view addSubview:textField];
    
    return textField;

}

-(UITextView *)setupTextView{
    
    UITextView *textView = [UITextView new];
    
    textView.textAlignment = NSTextAlignmentCenter;
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

-(LMJDropdownMenu *)setDropDownMenuWithFrame:(CGRect)frame Title:(NSString *)title Titles:(NSArray *)titles Tag:(NSInteger)tag{
    
    LMJDropdownMenu *dropDownMenu = [[LMJDropdownMenu alloc] init];
    
    dropDownMenu.tag = tag;
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

@end
