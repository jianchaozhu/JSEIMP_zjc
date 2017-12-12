//
//  JSEIMPNewShouKuanJieDianView.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/11/15.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPNewShouKuanJieDianView.h"
#import <Masonry.h>

#define UIScreenW [UIScreen mainScreen].bounds.size.width
#define UIScreenH [UIScreen mainScreen].bounds.size.height

#define Height 212

@implementation JSEIMPNewShouKuanJieDianView{

    UIView *_touchView1;
    
    UIView *_touchView2;
    
    UILabel *_label;
    
    UIButton *_button;
    
    UIDatePicker *_datePicker;
    
    NSDate *_timeButtonDate;
    
    UIView *_cancelView;
    
    UIButton *_cancelButton;
    
    UIButton *_sureButton;
    
    UIView *_backView;
    
    UILabel *_label1;
    
    UITextView *_nameTextView;
    
    UILabel *_namePlaceLabel;
    
    UILabel *_label2;
    
    UITextField *_baiFenBiTextField;
    
    UILabel *_label3;
    
    UITextField *_jieSuanMoneyTextField;
    
    UILabel *_label4;
    
    NSInteger _number;
    
}

-(instancetype)init{
    
    if (self = [super init]) {
        
        [self setupUI];
        
    }
    
    return self;
}

-(void)setupUI{

    _number = 8;
    
    _touchView1 = [self setupTouchView];
    _touchView2 = [self setupTouchView];
    
    _label = [self setupLabelWithText:@"收款条款" Font:[UIFont systemFontOfSize:24] TextColor:[UIColor redColor]];
    
    for (int i = 0; i < _number; i++) {
        
        //名称
        _label1 = [self setupLabelWithText:@"名称" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
        _nameTextView = [self setupTextView];
        _namePlaceLabel = [self setupPlaceLabelWithText:@"请填写收款条款名称" Font:[UIFont systemFontOfSize:16]];
        [_nameTextView addSubview:_namePlaceLabel];
        //百分比
        _label2 = [self setupLabelWithText:@"百分比(%)" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
        _baiFenBiTextField = [self setupTextFieldWithPlacedText:@"请输入百分比"];
        //结算金额
        _label3 = [self setupLabelWithText:@"结算金额(元)" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
        _jieSuanMoneyTextField = [self setupTextFieldWithPlacedText:@"请输入结算金额"];
        //计划收款日期
        _label4 = [self setupLabelWithText:@"计划收款日期" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
//        _planShouKuanDateButton1 = [self setButtonWithColor:[UIColor whiteColor] Title:@"==请选择日期==" Tag:i];
        //横线
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor darkGrayColor];
        [self addSubview:_lineView];
        
        _label1.frame = CGRectMake(16, 60 + i * Height, 42, 20);
        _nameTextView.frame = CGRectMake(74, 58 + i * Height, UIScreenW - 90, 40);
        _namePlaceLabel.frame = CGRectMake(6, 7, UIScreenW - 96, 20);
        _label2.frame = CGRectMake(16, 120 + i * Height, 92, 20);
        _baiFenBiTextField.frame = CGRectMake(148, 116 + i * Height, UIScreenW - 164, 30);
        _label3.frame = CGRectMake(16, 166 + i * Height, 116, 20);
        _jieSuanMoneyTextField.frame = CGRectMake(148, 162 + i * Height, UIScreenW - 164, 30);
        _label4.frame = CGRectMake(16, 212 + i * Height, 124, 20);
//        _planShouKuanDateButton1.frame = CGRectMake(148, 208 + i * Height, UIScreenW - 164, 30);
        _lineView.frame = CGRectMake(0, 254 + i * Height, UIScreenW, 0.5);
        
    }
    
    _planShouKuanDateButton1 = [self setButtonWithColor:[UIColor whiteColor] Title:@"==请选择日期==" Tag:0];
    _planShouKuanDateButton1.frame = CGRectMake(148, 208 + _planShouKuanDateButton1.tag * Height, UIScreenW - 164, 30);
    
    _planShouKuanDateButton2 = [self setButtonWithColor:[UIColor whiteColor] Title:@"==请选择日期==" Tag:1];
    _planShouKuanDateButton2.frame = CGRectMake(148, 208 + _planShouKuanDateButton2.tag * Height, UIScreenW - 164, 30);
    
    _planShouKuanDateButton3 = [self setButtonWithColor:[UIColor whiteColor] Title:@"==请选择日期==" Tag:2];
    _planShouKuanDateButton3.frame = CGRectMake(148, 208 + _planShouKuanDateButton3.tag * Height, UIScreenW - 164, 30);
    
    _planShouKuanDateButton4 = [self setButtonWithColor:[UIColor whiteColor] Title:@"==请选择日期==" Tag:3];
    _planShouKuanDateButton4.frame = CGRectMake(148, 208 + _planShouKuanDateButton4.tag * Height, UIScreenW - 164, 30);
    
    _planShouKuanDateButton5 = [self setButtonWithColor:[UIColor whiteColor] Title:@"==请选择日期==" Tag:4];
    _planShouKuanDateButton5.frame = CGRectMake(148, 208 + _planShouKuanDateButton5.tag * Height, UIScreenW - 164, 30);
    
    _planShouKuanDateButton6 = [self setButtonWithColor:[UIColor whiteColor] Title:@"==请选择日期==" Tag:5];
    _planShouKuanDateButton6.frame = CGRectMake(148, 208 + _planShouKuanDateButton6.tag * Height, UIScreenW - 164, 30);
    
    _planShouKuanDateButton7 = [self setButtonWithColor:[UIColor whiteColor] Title:@"==请选择日期==" Tag:6];
    _planShouKuanDateButton7.frame = CGRectMake(148, 208 + _planShouKuanDateButton7.tag * Height, UIScreenW - 164, 30);
    
    _planShouKuanDateButton8 = [self setButtonWithColor:[UIColor whiteColor] Title:@"==请选择日期==" Tag:7];
    _planShouKuanDateButton8.frame = CGRectMake(148, 208 + _planShouKuanDateButton8.tag * Height, UIScreenW - 164, 30);

}

#pragma mark - 触摸事件
-(void)touchEvent{
    
    [self endEditing:YES];
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    [_touchView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.bottom.mas_equalTo(self);
        make.right.mas_equalTo(_label1.mas_right);
        
    }];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.mas_top).offset(16);
        make.centerX.mas_equalTo(self.mas_centerX);
        
    }];
    
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

#pragma mark - 日期按钮点击事件
-(void)clickButton:(UIButton *)button{
    
    //    _timeButton.backgroundColor = [UIColor whiteColor];
    
    if (button.tag == 0) {
        
        _planShouKuanDateButton1.selected = YES;
    }else if (button.tag == 1){
        
        _planShouKuanDateButton2.selected = YES;
    }else if (button.tag == 2){
        
        _planShouKuanDateButton3.selected = YES;
    }else if (button.tag == 3){
        
        _planShouKuanDateButton4.selected = YES;
    }else if (button.tag == 4){
        
        _planShouKuanDateButton5.selected = YES;
    }else if (button.tag == 5){
        
        _planShouKuanDateButton6.selected = YES;
    }else if (button.tag == 6){
        
        _planShouKuanDateButton7.selected = YES;
    }else if (button.tag == 7){
        
        _planShouKuanDateButton8.selected = YES;
    }
    
    [self setupDatePicker];
    
    [self setupTimeButtonOfCancelView];
    
    [self setupBackView];
    
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
    
    if (_planShouKuanDateButton1.tag == 0 && _planShouKuanDateButton1.selected == YES) {
        
        _planShouKuanDateButton1.selected = NO;
        
    }else if (_planShouKuanDateButton2.tag == 1 && _planShouKuanDateButton2.selected == YES){
        
        _planShouKuanDateButton2.selected = NO;
    }else if (_planShouKuanDateButton3.tag == 2 && _planShouKuanDateButton3.selected == YES){
        
        _planShouKuanDateButton3.selected = NO;
    }else if (_planShouKuanDateButton4.tag == 3 && _planShouKuanDateButton4.selected == YES){
        
        _planShouKuanDateButton4.selected = NO;
    }else if (_planShouKuanDateButton5.tag == 4 && _planShouKuanDateButton5.selected == YES){
        
        _planShouKuanDateButton5.selected = NO;
    }else if (_planShouKuanDateButton6.tag == 5 && _planShouKuanDateButton6.selected == YES){
        
        _planShouKuanDateButton6.selected = NO;
    }else if (_planShouKuanDateButton7.tag == 6 && _planShouKuanDateButton7.selected == YES){
        
        _planShouKuanDateButton7.selected = NO;
    }else if (_planShouKuanDateButton8.tag == 7 && _planShouKuanDateButton8.selected == YES){
        
        _planShouKuanDateButton8.selected = NO;
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
        
        make.left.right.mas_equalTo(self.superview.superview);
        make.bottom.mas_equalTo(self.superview.superview).offset(50);
        make.height.mas_equalTo(200);
    }];
    
}

-(void)chooseTimeButtonDate{
    
    _timeButtonDate = _datePicker.date;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    
    NSString *dateString = [dateFormatter stringFromDate:_timeButtonDate];
    
    if (_planShouKuanDateButton1.tag == 0 && _planShouKuanDateButton1.selected == YES) {
        
        [_planShouKuanDateButton1 setTitle:dateString forState:UIControlStateNormal];
    }else if (_planShouKuanDateButton2.tag == 1 && _planShouKuanDateButton2.selected == YES){
        
        [_planShouKuanDateButton2 setTitle:dateString forState:UIControlStateNormal];
    }else if (_planShouKuanDateButton3.tag == 2 && _planShouKuanDateButton3.selected == YES){
        
        [_planShouKuanDateButton3 setTitle:dateString forState:UIControlStateNormal];
    }else if (_planShouKuanDateButton4.tag == 3 && _planShouKuanDateButton4.selected == YES){
        
        [_planShouKuanDateButton4 setTitle:dateString forState:UIControlStateNormal];
    }else if (_planShouKuanDateButton5.tag == 4 && _planShouKuanDateButton5.selected == YES){
        
        [_planShouKuanDateButton5 setTitle:dateString forState:UIControlStateNormal];
    }else if (_planShouKuanDateButton6.tag == 5 && _planShouKuanDateButton6.selected == YES){
        
        [_planShouKuanDateButton6 setTitle:dateString forState:UIControlStateNormal];
    }else if (_planShouKuanDateButton7.tag == 6 && _planShouKuanDateButton7.selected == YES){
        
        [_planShouKuanDateButton7 setTitle:dateString forState:UIControlStateNormal];
    }else if (_planShouKuanDateButton8.tag == 7 && _planShouKuanDateButton8.selected == YES){
        
        [_planShouKuanDateButton8 setTitle:dateString forState:UIControlStateNormal];
    }
    
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
