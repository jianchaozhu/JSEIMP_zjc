//
//  JSEIMPNewLvYueBaoZhengJinController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/10/12.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPNewLvYueBaoZhengJinController.h"
#import <Masonry.h>
#import "LMJDropdownMenu.h"

#define UIScreenW [UIScreen mainScreen].bounds.size.width
#define UIScreenH [UIScreen mainScreen].bounds.size.height

@interface JSEIMPNewLvYueBaoZhengJinController ()<LMJDropdownMenuDelegate,UITextFieldDelegate,UITextViewDelegate>

@property(nonatomic,strong)NSMutableArray *projectNameMArray;

@property(nonatomic,strong)NSArray *baoZhengJinStyleMArray;

@end

@implementation JSEIMPNewLvYueBaoZhengJinController{

    UIScrollView *_scrollView;
    
    UIView *_view;
    
    UIButton *_button;
    
    UIDatePicker *_datePicker;
    
    NSDate *_timeButtonDate;
    
    UIView *_cancelView;
    
    UIButton *_cancelButton;
    
    UIButton *_sureButton;
    
    UIView *_backView;
    
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
    
    LMJDropdownMenu *_projectNameMenu;
    
    LMJDropdownMenu *_baoZhengJinStyleMenu;
    
    UITextField *_heTongValueTextField;

    UITextField *_baoHanBiLiTextField;
    
    UITextField *_bankTextField;
    
    UIButton *_payDateButton;
    
    UIButton *_projectBeginDateButton;
    
    UIButton *_projectJunGongDateButton;
    
    UITextView *_beiZhuTextView;
    
    UILabel *_beiZhuPlaceLabel;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"新建履约保证金";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
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
    
    _touchView = [UIView new];
    
    _touchView.backgroundColor = [UIColor whiteColor];
    
    [_view addSubview:_touchView];
    
    //点击手势
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchEvent)];
    
    [_touchView addGestureRecognizer:tapGestureRecognizer];
    
    _label1 = [self setupLabelWithText:@"项目名称*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label2 = [self setupLabelWithText:@"合同总价(万元)*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label3 = [self setupLabelWithText:@"保证金形式*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label4 = [self setupLabelWithText:@"保函比例*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label5 = [self setupLabelWithText:@"办理银行*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label6 = [self setupLabelWithText:@"缴纳日期*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label7 = [self setupLabelWithText:@"项目开工时间*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label8 = [self setupLabelWithText:@"项目竣工时间*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label9 = [self setupLabelWithText:@"备注*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    
    
    _heTongValueTextField = [self setupTextFieldWithPlacedText:@"请填写合同总价"];
    _baoHanBiLiTextField = [self setupTextFieldWithPlacedText:@"请填写保函比例"];
    _bankTextField = [self setupTextFieldWithPlacedText:@"请填写办理银行"];
    
    _projectNameMenu = [self setDropDownMenuWithFrame:CGRectMake(16, 55, UIScreenW - 32, 30) Title:@"==请选择项目名称==" Titles:@[@"南京马群C地块项目",@"嘉定碧桂园总承包工程"]];
    _baoZhengJinStyleMenu = [self setDropDownMenuWithFrame:CGRectMake(180, 140, UIScreenW - 196, 30) Title:@"请选择保证金形式" Titles:@[@"履约保证金",@"现金保证金"]];

    _payDateButton = [self setButtonWithColor:[UIColor whiteColor] Title:@"请选择日期" Tag:1];
    _projectBeginDateButton = [self setButtonWithColor:[UIColor whiteColor] Title:@"请选择日期" Tag:2];
    _projectJunGongDateButton = [self setButtonWithColor:[UIColor whiteColor] Title:@"请选择日期" Tag:3];
    
    _beiZhuTextView = [self setupTextView];
    _beiZhuPlaceLabel = [self setupPlaceLabelWithText:@"请填写备注" Font:[UIFont systemFontOfSize:16]];
    [_beiZhuTextView addSubview:_beiZhuPlaceLabel];
    
    [_touchView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.bottom.mas_equalTo(_view);
        make.right.mas_equalTo(_label1.mas_right);
        
    }];
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.mas_equalTo(_view).offset(16);
        
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_projectNameMenu.mas_bottom).offset(16);
        make.left.mas_equalTo(_projectNameMenu.mas_left);
        make.width.mas_equalTo(148);
        
    }];
    [_heTongValueTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label2.mas_centerY);
        make.left.mas_equalTo(_label2.mas_right).offset(16);
        make.right.mas_equalTo(_projectNameMenu.mas_right);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_heTongValueTextField.mas_bottom).offset(16);
        make.left.mas_equalTo(_label2.mas_left);
        
    }];
    
    
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label3.mas_bottom).offset(16);
        make.left.mas_equalTo(_label3.mas_left);
        
    }];
    [_baoHanBiLiTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label4.mas_centerY);
        make.left.mas_equalTo(_baoZhengJinStyleMenu.mas_left);
        make.right.mas_equalTo(_baoZhengJinStyleMenu.mas_right);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_baoHanBiLiTextField.mas_bottom).offset(16);
        make.left.mas_equalTo(_label4.mas_left);
        
    }];
    [_bankTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label5.mas_centerY);
        make.left.mas_equalTo(_baoHanBiLiTextField.mas_left);
        make.right.mas_equalTo(_baoHanBiLiTextField.mas_right);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_bankTextField.mas_bottom).offset(16);
        make.left.mas_equalTo(_label5.mas_left);
        
    }];
    [_payDateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label6.mas_centerY);
        make.right.mas_equalTo(_bankTextField.mas_right);
        make.height.mas_equalTo(30);
        make.left.mas_equalTo(_bankTextField.mas_left);
        
    }];
    
    [_label7 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_payDateButton.mas_bottom).offset(16);
        make.left.mas_equalTo(_label6.mas_left);
        make.width.mas_equalTo(134);
        
    }];
    [_projectBeginDateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label7.mas_centerY);
        make.right.mas_equalTo(_payDateButton.mas_right);
        make.height.mas_equalTo(30);
        make.left.mas_equalTo(_payDateButton.mas_left);
        
    }];
    
    [_label8 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_projectBeginDateButton.mas_bottom).offset(16);
        make.left.mas_equalTo(_label7.mas_left);
        
    }];
    [_projectJunGongDateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label8.mas_centerY);
        make.right.mas_equalTo(_projectBeginDateButton.mas_right);
        make.height.mas_equalTo(30);
        make.left.mas_equalTo(_projectBeginDateButton.mas_left);
        
    }];
    
    [_label9 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_projectJunGongDateButton.mas_bottom).offset(16);
        make.left.mas_equalTo(_label8.mas_left);
        
    }];
    [_beiZhuTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label9.mas_bottom).offset(8);
        make.left.mas_equalTo(_projectNameMenu.mas_left);
        make.right.mas_equalTo(_projectNameMenu.mas_right);
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

#pragma mark - 触摸事件
-(void)touchEvent{
    
    [_projectNameMenu hideDropDown];
    [_baoZhengJinStyleMenu hideDropDown];
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
    
    _heTongValueTextField.enabled = NO;
    _baoHanBiLiTextField.enabled = NO;
    _bankTextField.enabled = NO;
    _beiZhuTextView.editable = NO;
    _payDateButton.enabled = NO;
    _projectBeginDateButton.enabled = NO;
    _projectJunGongDateButton.enabled = NO;
    
}

-(void)dropdownMenuDidHidden:(LMJDropdownMenu *)menu{
    
    _heTongValueTextField.enabled = YES;
    _baoHanBiLiTextField.enabled = YES;
    _bankTextField.enabled = YES;
    _beiZhuTextView.editable = YES;
    _payDateButton.enabled = YES;
    _projectBeginDateButton.enabled = YES;
    _projectJunGongDateButton.enabled = YES;
    
}

#pragma mark - UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    _payDateButton.enabled = NO;
    _projectBeginDateButton.enabled = NO;
    _projectBeginDateButton.enabled = NO;
    
    [self scrollViewFrameChange];
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    _payDateButton.enabled = YES;
    _projectBeginDateButton.enabled = YES;
    _projectBeginDateButton.enabled = YES;
    
    [self scrollViewFrameRecover];
    
}

#pragma mark - UITextViewDelegate
-(void)textViewDidBeginEditing:(UITextView *)textView{
    
    _payDateButton.enabled = NO;
    _projectBeginDateButton.enabled = NO;
    _projectBeginDateButton.enabled = NO;
    
    [self scrollViewFrameChange];
    
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    
    _payDateButton.enabled = YES;
    _projectBeginDateButton.enabled = YES;
    _projectBeginDateButton.enabled = YES;
    
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
-(void)clickButton:(UIButton *)button{
    
    //    _timeButton.backgroundColor = [UIColor whiteColor];
    
    if (button.tag == 1) {
        
        _payDateButton.selected = YES;
    }else if (button.tag == 2){
        
        _projectBeginDateButton.selected = YES;
    }else if (button.tag == 3){
        
        _projectJunGongDateButton.selected = YES;
    }
    
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
    
    if (_payDateButton.tag == 1 && _payDateButton.selected == YES) {
        
        _payDateButton.selected = NO;
        
    }else if (_projectBeginDateButton.tag == 2 && _projectBeginDateButton.selected == YES){
        
        _projectBeginDateButton.selected = NO;
        
    }else if (_projectJunGongDateButton.tag == 3 && _projectJunGongDateButton.selected == YES){
        
        _projectJunGongDateButton.selected = NO;
        
    }
    
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
    
    if (_payDateButton.tag == 1 && _payDateButton.selected == YES) {
        
        [_payDateButton setTitle:dateString forState:UIControlStateNormal];
        
    }else if (_projectBeginDateButton.tag == 2 && _projectBeginDateButton.selected == YES){
    
        [_projectBeginDateButton setTitle:dateString forState:UIControlStateNormal];
    }else if (_projectJunGongDateButton.tag == 3 && _projectJunGongDateButton.selected == YES){
        
        [_projectJunGongDateButton setTitle:dateString forState:UIControlStateNormal];
    }
    
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

-(UIButton *)setButtonWithColor:(UIColor *)color Title:(NSString *)title Tag:(NSInteger )tag{
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    _button.backgroundColor = color;
    _button.tag = tag;
    [_button setTitle:title forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    _button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_button setTitleEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
    _button.titleLabel.font = [UIFont systemFontOfSize:16];
    //    [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [_button.layer setBorderColor:[UIColor blackColor].CGColor];
    [_button.layer setBorderWidth:0.5];
    [_button.layer setMasksToBounds:YES];
    
    [_view addSubview:_button];
    
    return _button;
    
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
