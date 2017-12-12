//
//  JSEIMPNewAnJianShouXiView.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/10/19.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPNewAnJianShouXiView.h"
#import <Masonry.h>

#define UIScreenW [UIScreen mainScreen].bounds.size.width
#define UIscreenH [UIScreen mainScreen].bounds.size.height

@interface JSEIMPNewAnJianShouXiView ()<LMJDropdownMenuDelegate>

@end

@implementation JSEIMPNewAnJianShouXiView{

    UIDatePicker *_datePicker;
    
    NSDate *_timeButtonDate;
    
    UIView *_cancelView;
    
    UIButton *_cancelButton;
    
    UIButton *_sureButton;
    
    UIView *_backView;
    
    UIButton *_button;
    
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
    
}

-(instancetype)init{

    if (self = [super init]) {
        
        [self setupUI];
    }

    return self;
}

#pragma mark - 触摸事件
-(void)touchEvent{
    
    [_anJianZiLiaoMenu hideDropDown];
    [_anJianNoteMenu hideDropDown];
    
    [self endEditing:YES];
    
}

-(void)setupUI{
    
    _touchView = [self setupTouchView];

    _label1 = [self setupLabelWithText:@"安检办理时间" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _dealDateButton = [self setButtonWithColor:[UIColor whiteColor] Title:@"==请选择日期==" Tag:1];
    _label2 = [self setupLabelWithText:@"安检意外险" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _anJianYiWaiTextField = [self setupTextFieldWithPlacedText:@"请填写意外险金额"];
    _label3 = [self setupLabelWithText:@"安检工伤险" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _anJianGongShangTextField = [self setupTextFieldWithPlacedText:@"请填写工伤险金额"];
    _label4 = [self setupLabelWithText:@"文明措施费" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _wenMingCuoShiTextField = [self setupTextFieldWithPlacedText:@"请填写文明措施费"];
    _label5 = [self setupLabelWithText:@"手机定位费" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _mobileGPSTextField = [self setupTextFieldWithPlacedText:@"请填写手机定位费"];
    _label6 = [self setupLabelWithText:@"视频费" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _shiPinTextField = [self setupTextFieldWithPlacedText:@"请填视频费"];
    _label7 = [self setupLabelWithText:@"有无安检资料" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _anJianZiLiaoMenu = [self setDropDownMenuWithFrame:CGRectMake(168, 268, UIScreenW - 184, 30) Title:@"==请选择==" Titles:@[@"有",@"无"]];
    _label8 = [self setupLabelWithText:@"有无安检通知书" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _anJianNoteMenu = [self setDropDownMenuWithFrame:CGRectMake(168, 310, UIScreenW - 184, 30) Title:@"==请选择==" Titles:@[@"有",@"无"]];
    _label9 = [self setupLabelWithText:@"安检备注" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    
    _beiZhuTextView = [self setupTextView];
    _beiZhuPlaceLabel = [self setupPlaceLabelWithText:@"请填写安检备注的内容" Font:[UIFont systemFontOfSize:16]];
    [_beiZhuTextView addSubview:_beiZhuPlaceLabel];
    
}

-(void)layoutSubviews{

    [super layoutSubviews];
    
    [_touchView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.bottom.mas_equalTo(self);
        make.right.mas_equalTo(_label1.mas_right);
        
    }];

    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.mas_equalTo(self).offset(16);
        
    }];
    
    [_dealDateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label1.mas_centerY);
        make.right.mas_equalTo(self.mas_right).offset(-16);
        make.height.mas_equalTo(30);
        make.left.mas_equalTo(self.mas_left).offset(168);
        
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_dealDateButton.mas_bottom).offset(16);
        make.left.mas_equalTo(_label1.mas_left);
        
    }];
    [_anJianYiWaiTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label2.mas_centerY);
        make.right.mas_equalTo(_dealDateButton.mas_right);
        make.left.mas_equalTo(_dealDateButton.mas_left);
        make.height.mas_equalTo(30);
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_anJianYiWaiTextField.mas_bottom).offset(16);
        make.left.mas_equalTo(_label2.mas_left);
        
    }];
    [_anJianGongShangTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label3.mas_centerY);
        make.right.mas_equalTo(_anJianYiWaiTextField.mas_right);
        make.left.mas_equalTo(_anJianYiWaiTextField.mas_left);
        make.height.mas_equalTo(30);
    }];
    
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_anJianGongShangTextField.mas_bottom).offset(16);
        make.left.mas_equalTo(_label3.mas_left);
        make.width.mas_equalTo(102);
        
    }];
    [_wenMingCuoShiTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label4.mas_centerY);
        make.right.mas_equalTo(_anJianGongShangTextField.mas_right);
        make.left.mas_equalTo(_anJianGongShangTextField.mas_left);
        make.height.mas_equalTo(30);
    }];
    
    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_wenMingCuoShiTextField.mas_bottom).offset(16);
        make.left.mas_equalTo(_label4.mas_left);
        make.width.mas_equalTo(102);
        
    }];
    [_mobileGPSTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label5.mas_centerY);
        make.right.mas_equalTo(_wenMingCuoShiTextField.mas_right);
        make.left.mas_equalTo(_wenMingCuoShiTextField.mas_left);
        make.height.mas_equalTo(30);
    }];
    
    [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_mobileGPSTextField.mas_bottom).offset(16);
        make.left.mas_equalTo(_label5.mas_left);
        make.width.mas_equalTo(62);
        
    }];
    [_shiPinTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label6.mas_centerY);
        make.right.mas_equalTo(_mobileGPSTextField.mas_right);
        make.left.mas_equalTo(_mobileGPSTextField.mas_left);
        make.height.mas_equalTo(30);
    }];

    [_label7 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_shiPinTextField.mas_bottom).offset(16);
        make.left.mas_equalTo(_label6.mas_left);
        
    }];
    
    [_label8 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_anJianZiLiaoMenu.mas_bottom).offset(16);
        make.left.mas_equalTo(_label7.mas_left);
        
    }];
    
    [_label9 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_anJianNoteMenu.mas_bottom).offset(16);
        make.left.mas_equalTo(_label8.mas_left);
        
    }];
    [_beiZhuTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label9.mas_bottom).offset(8);
        make.left.mas_equalTo(_label9.mas_left);
        make.right.mas_equalTo(_anJianNoteMenu.mas_right);
        make.height.mas_equalTo(120);
        
    }];
    [_beiZhuPlaceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.top.mas_equalTo(_beiZhuTextView.mas_top).offset(8);
        make.left.mas_equalTo(_beiZhuTextView.mas_left).offset(6);
        
    }];
    
}

#pragma mark - 日期按钮点击事件
-(void)clickButton:(UIButton *)button{
    
    //    _timeButton.backgroundColor = [UIColor whiteColor];
    
    if (button.tag == 1) {
        
        _dealDateButton.selected = YES;
    }
    
    [self setupDatePicker];
    
    [self setupTimeButtonOfCancelView];
    
    [self setupBackView];
    
}

-(void)dropdownMenuDidShow:(LMJDropdownMenu *)menu{
    
    _beiZhuTextView.editable = NO;
    _dealDateButton.enabled = NO;
    _anJianGongShangTextField.enabled = NO;
    _anJianYiWaiTextField.enabled = NO;
    _wenMingCuoShiTextField.enabled = NO;
    _mobileGPSTextField.enabled = NO;
    _shiPinTextField.enabled = NO;
    
}

-(void)dropdownMenuDidHidden:(LMJDropdownMenu *)menu{
    
    _beiZhuTextView.editable = YES;
    _dealDateButton.enabled = YES;
    _anJianGongShangTextField.enabled = YES;
    _anJianYiWaiTextField.enabled = YES;
    _wenMingCuoShiTextField.enabled = YES;
    _mobileGPSTextField.enabled = YES;
    _shiPinTextField.enabled = YES;
    
}

-(void)setupBackView{
    
    _backView = [[UIView alloc] init];
    
    _backView.backgroundColor = [UIColor lightGrayColor];
    _backView.alpha = 0.3;
    
    [self addSubview:_backView];
    
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.mas_equalTo(self);
        make.bottom.mas_equalTo(_cancelView.mas_top);
        
    }];
    
}

-(void)setupTimeButtonOfCancelView{
    
    _cancelView = [[UIView alloc] init];
    
    _cancelView.backgroundColor = [UIColor colorWithRed:204.0 / 255.0 green:204.0 / 255.0 blue:204.0 / 255.0 alpha:1];
    
    [self addSubview:_cancelView];
    
    [_cancelView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.mas_equalTo(self);
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
    
    if (_dealDateButton.tag == 1 && _dealDateButton.selected == YES) {
        
        _dealDateButton.selected = NO;
        
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
    
    [self addSubview:_datePicker];
    
    [_datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.mas_equalTo(self);
        make.top.mas_equalTo(self.mas_top).offset(UIscreenH / 2);
        make.height.mas_equalTo(160);
        
    }];
    
}

-(void)chooseTimeButtonDate{
    
    _timeButtonDate = _datePicker.date;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    
    NSString *dateString = [dateFormatter stringFromDate:_timeButtonDate];
    
    if (_dealDateButton.tag == 1 && _dealDateButton.selected == YES) {
        
        [_dealDateButton setTitle:dateString forState:UIControlStateNormal];
        
    }
    
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
    _button.titleLabel.font = [UIFont systemFontOfSize:14];
    //    [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [_button.layer setBorderColor:[UIColor blackColor].CGColor];
    [_button.layer setBorderWidth:0.5];
    [_button.layer setMasksToBounds:YES];
    
    [self addSubview:_button];
    
    return _button;
    
}

-(UILabel *)setupLabelWithText:(NSString *)text Font:(UIFont *)font TextColor:(UIColor *)textColor{
    
    UILabel *label = [[UILabel alloc] init];
    
    label.text = text;
    label.font = font;
    label.textColor = textColor;
    
    [self addSubview:label];
    
    return label;
    
}

-(UITextField *)setupTextFieldWithPlacedText:(NSString *)placedText{
    
    UITextField *textField = [[UITextField alloc] init];
    
    textField.layer.borderWidth = 0.5;
    textField.textAlignment = NSTextAlignmentCenter;
    textField.placeholder = placedText;
    textField.textColor = [UIColor darkGrayColor];
    textField.font = [UIFont systemFontOfSize:16];
    
    [self addSubview:textField];
    
    return textField;
    
}

-(LMJDropdownMenu *)setDropDownMenuWithFrame:(CGRect)frame Title:(NSString *)title Titles:(NSArray *)titles{
    
    LMJDropdownMenu *dropDownMenu = [[LMJDropdownMenu alloc] init];
    
    dropDownMenu.delegate = self;
    [dropDownMenu setFrame:frame];
    [dropDownMenu.mainBtn setTitle:title forState:UIControlStateNormal];
    [dropDownMenu.mainBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 3, 0, 10)];
    [dropDownMenu.mainBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    dropDownMenu.mainBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [dropDownMenu setMenuTitles:titles rowHeight:30];
    
    [self addSubview:dropDownMenu];
    
    return dropDownMenu;
    
}

-(UITextView *)setupTextView{
    
    UITextView *textView = [UITextView new];
    
    textView.layer.borderWidth = 0.5;
    //内容可以拖拽
    textView.alwaysBounceVertical = YES;
    //关闭键盘
    textView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    textView.font = [UIFont systemFontOfSize:16];
    textView.textColor = [UIColor darkGrayColor];
    
    [self addSubview:textView];
    
    return textView;
    
}

-(UILabel *)setupPlaceLabelWithText:(NSString *)text Font:(UIFont *)font{
    
    UILabel *label = [[UILabel alloc] init];
    
    label.text = text;
    label.font = font;
    label.textColor = [UIColor colorWithRed:190.0 / 255.0 green:190.0 / 255.0 blue:190.0 / 255.0 alpha:1];
    
    return label;
    
}

-(UIView *)setupTouchView{
    
    UIView *view = [UIView new];
    
    view.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:view];
    
    //点击手势
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchEvent)];
    
    [view addGestureRecognizer:tapGestureRecognizer];
    
    return view;
    
}

@end
