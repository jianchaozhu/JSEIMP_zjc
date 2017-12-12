//
//  JSEIMPNewXianChangCheckController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/9/26.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPNewXianChangCheckController.h"
#import "LMJDropdownMenu.h"
#import <Masonry.h>

#define UIScreesW [UIScreen mainScreen].bounds.size.width
#define UIScreesH [UIScreen mainScreen].bounds.size.height

@interface JSEIMPNewXianChangCheckController ()<UITextFieldDelegate,UITextViewDelegate,LMJDropdownMenuDelegate>

@end

@implementation JSEIMPNewXianChangCheckController{

    UIButton *_button;
    
    UIScrollView *_scrollView;
    
    UIView *_view;
    
    UIDatePicker *_datePicker;
    
    NSDate *_timeButtonDate;
    
    UIView *_cancelView;
    
    UIButton *_cancelButton;
    
    UIButton *_sureButton;
    
    UIView *_backView;
    
    UIView *_touchView1;
    
    UIView *_touchView2;
    
    UILabel *_label1;
    
    UILabel *_label2;
    
    UILabel *_label3;
    
    UILabel *_label4;
    
    UILabel *_label5;
    
    LMJDropdownMenu *_projectNameMenu;
    
    UIButton *_timeButton;
    
    UITextField *_withPeopleTextField;
    
    UITextView *_checkNoteTextView;
    
    UILabel *_checkNotePlaceLabel;
    
    UITextView *_beiZhuTextView;
    
    UILabel *_beiZhuPlaceLabel;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"新建现场踏勘";
    
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
    
    _touchView1 = [self setupTouchView];
    _touchView2 = [self setupTouchView];
    
    _label1 = [self setupLabelWithText:@"项目名称*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _projectNameMenu = [self setDropDownMenuWithFrame:CGRectMake(16, 55, UIScreesW - 32, 30) Title:@"==请选择项目名称==" Titles:@[@"俞泾浦南、四平路西地块综合开发项目总包工程",@"苏州嘉苑和广场"]];
    
    _label2 = [self setupLabelWithText:@"踏勘日期*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _timeButton = [self setButtonWithColor:[UIColor whiteColor] Title:@"==请选择日期=="];
    [_timeButton addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    
    _label3 = [self setupLabelWithText:@"参与人*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _withPeopleTextField = [self setupTextFieldWithPlacedText:@"请填写参与人姓名"];
    
    _label4 = [self setupLabelWithText:@"踏勘摘要*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _checkNoteTextView = [self setupTextView];
    _checkNotePlaceLabel = [self setupPlaceLabelWithText:@"请填写踏勘摘要" Font:[UIFont systemFontOfSize:16]];
    [_checkNoteTextView addSubview:_checkNotePlaceLabel];
    
    _label5 = [self setupLabelWithText:@"备注*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _beiZhuTextView = [self setupTextView];
    _beiZhuPlaceLabel = [self setupPlaceLabelWithText:@"请填写备注" Font:[UIFont systemFontOfSize:16]];
    [_beiZhuTextView addSubview:_beiZhuPlaceLabel];
    
    [_touchView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.bottom.mas_equalTo(_view);
        make.right.mas_equalTo(_label1.mas_left);
        
    }];
    
    [_touchView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.right.bottom.mas_equalTo(_view);
        make.left.mas_equalTo(_label1.mas_right);
        
    }];
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_view.mas_top).offset(16);
        make.centerX.mas_equalTo(_view.mas_centerX);
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_projectNameMenu.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_label1.mas_centerX);
        
    }];
    [_timeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label2.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_label2.mas_centerX);
        make.right.mas_equalTo(_projectNameMenu.mas_right);
        make.left.mas_equalTo(_projectNameMenu.mas_right);
        make.height.mas_equalTo(30);
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_timeButton.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_timeButton.mas_centerX);
    }];
    
    [_withPeopleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label3.mas_bottom).offset(16);
        make.left.mas_equalTo(_timeButton.mas_left);
        make.centerX.mas_equalTo(_label3.mas_centerX);
        make.right.mas_equalTo(_timeButton.mas_right);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_withPeopleTextField.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_withPeopleTextField.mas_centerX);
        
    }];
    [_checkNoteTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label4.mas_bottom).offset(8);
        make.left.mas_equalTo(_withPeopleTextField.mas_left);
        make.right.mas_equalTo(_withPeopleTextField.mas_right);
        make.height.mas_equalTo(120);
        
    }];
    [_checkNotePlaceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.top.mas_equalTo(_checkNoteTextView.mas_top).offset(8);
        make.centerX.mas_equalTo(_checkNoteTextView.mas_centerX);
        
    }];
    
    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_checkNoteTextView.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_label4.mas_centerX);
        
    }];
    [_beiZhuTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label5.mas_bottom).offset(8);
        make.left.mas_equalTo(_checkNoteTextView.mas_left);
        make.right.mas_equalTo(_checkNoteTextView.mas_right);
        make.height.mas_equalTo(120);
        
    }];
    [_beiZhuPlaceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_beiZhuTextView.mas_top).offset(8);
        make.centerX.mas_equalTo(_beiZhuTextView.mas_centerX);
        
    }];
    
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_beiZhuTextView.mas_bottom).offset(16);
        
    }];
    
}

#pragma mark - LMJDropdownMenuDelegate
-(void)dropdownMenuDidShow:(LMJDropdownMenu *)menu{

    _timeButton.enabled = NO;
    _withPeopleTextField.enabled = NO;
    _checkNoteTextView.editable = NO;
    _beiZhuTextView.editable = NO;

}

-(void)dropdownMenuDidHidden:(LMJDropdownMenu *)menu{

    _timeButton.enabled = YES;
    _withPeopleTextField.enabled = YES;
    _checkNoteTextView.editable = YES;
    _beiZhuTextView.editable = YES;

}

#pragma mark - 触摸事件
-(void)touchEvent{
    
    [_projectNameMenu hideDropDown];
    
    [_view endEditing:YES];
    
}

#pragma mark - <UITextViewDelegate>
-(void)textViewDidChange:(UITextView *)textView{
    
    if (_checkNoteTextView.hasText) {
        
        _checkNotePlaceLabel.hidden = YES;
        
    }else if (!_checkNoteTextView.hasText){
        
        _checkNotePlaceLabel.hidden = NO;
        
    }
    
    if (_beiZhuTextView.hasText) {
        
        _beiZhuPlaceLabel.hidden = YES;
    }else if (!_beiZhuTextView.hasText){
        
        _beiZhuPlaceLabel.hidden = NO;
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
    
    textField.layer.borderWidth = 0.5;
    textField.textAlignment = NSTextAlignmentCenter;
    textField.placeholder = placedText;
    textField.delegate = self;
    textField.textColor = [UIColor darkGrayColor];
    textField.font = [UIFont systemFontOfSize:16];
    
    [_view addSubview:textField];
    
    return textField;
    
}

-(UITextView *)setupTextView{
    
    UITextView *textView = [UITextView new];
    
    textView.layer.borderWidth = 0.5;
    textView.textAlignment = NSTextAlignmentCenter;
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

-(UIView *)setupTouchView{
    
    UIView *view = [UIView new];
    
    view.backgroundColor = [UIColor whiteColor];
    
    [_view addSubview:view];
    
    //点击手势
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchEvent)];
    
    [view addGestureRecognizer:tapGestureRecognizer];
    
    return view;
    
}

@end
