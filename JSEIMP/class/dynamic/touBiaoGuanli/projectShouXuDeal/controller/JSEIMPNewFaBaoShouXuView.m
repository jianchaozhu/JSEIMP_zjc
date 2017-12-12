//
//  JSEIMPNewFaBaoShouXuView.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/10/18.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPNewFaBaoShouXuView.h"
#import <Masonry.h>

@interface JSEIMPNewFaBaoShouXuView ()<LMJDropdownMenuDelegate>

@property(nonatomic,strong)NSMutableArray *projectManagerMArray;

@end

@implementation JSEIMPNewFaBaoShouXuView{

    UIButton *_button;
    
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
    
    UILabel *_label6;
    
    UITextView *_beiZhuTextView;
    
    UILabel *_beiZhuPlaceLabel;
    
}

-(instancetype)init{

    if (self = [super init]) {
        
        [self setupUI];
    }

    return self;
}

#pragma mark - 触摸事件
-(void)touchEvent{
    
    [_projectManagerMenu hideDropDown];
    [_faBaoNoteMenu hideDropDown];
    [_noteStoreMenu hideDropDown];
    
    [self endEditing:YES];
    
}

-(void)setupUI{

    _projectManagerMArray = [NSMutableArray arrayWithObjects:@"姚辉",@"阮美琴", nil];
    
    _touchView1 = [self setupTouchView];
    _touchView2 = [self setupTouchView];
    
    _projectManagerMenu = [self setDropDownMenuWithFrame:CGRectMake(16, 52, [UIScreen mainScreen].bounds.size.width - 32, 30) Title:@"==请选择==" Titles:_projectManagerMArray];
    _label1 = [self setupLabelWithText:@"项目经理*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label2 = [self setupLabelWithText:@"缴纳工程交易费*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _jiaoYiMoneyTextField = [self setupTextFieldWithPlacedText:@"请填写工程交易费"];
    _label3 = [self setupLabelWithText:@"发包完结时间*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _endDateButton = [self setButtonWithColor:[UIColor whiteColor] Title:@"==请选择日期==" Tag:1];
    _label4 = [self setupLabelWithText:@"发包通知书*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _faBaoNoteMenu = [self setDropDownMenuWithFrame:CGRectMake(16, 298,  [UIScreen mainScreen].bounds.size.width - 32, 30) Title:@"==请选择==" Titles:@[@"有",@"无"]];
    _label5 = [self setupLabelWithText:@"中标通知书存放*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _noteStoreMenu = [self setDropDownMenuWithFrame:CGRectMake(16, 380,  [UIScreen mainScreen].bounds.size.width - 32, 30) Title:@"==请选择==" Titles:@[@"无",@"档案室",@"项目"]];
    _label6 = [self setupLabelWithText:@"发包备注*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    
    _beiZhuTextView = [self setupTextView];
    _beiZhuPlaceLabel = [self setupPlaceLabelWithText:@"请填写发包备注的内容" Font:[UIFont systemFontOfSize:16]];
    [_beiZhuTextView addSubview:_beiZhuPlaceLabel];
    
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [_touchView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.bottom.mas_equalTo(self);
        make.right.mas_equalTo(_label1.mas_left);
        
    }];
    
    [_touchView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.right.bottom.mas_equalTo(self);
        make.left.mas_equalTo(_label1.mas_right);
        
    }];
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.mas_top).offset(16);
        make.centerX.mas_equalTo(_projectManagerMenu.mas_centerX);
        
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_projectManagerMenu.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_projectManagerMenu.mas_centerX);
        
    }];
    [_jiaoYiMoneyTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label2.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_label2.mas_centerX);
        make.left.right.mas_equalTo(_projectManagerMenu);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_jiaoYiMoneyTextField.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_jiaoYiMoneyTextField.mas_centerX);
        
    }];
    [_endDateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(_label3.mas_centerX);
        make.top.mas_equalTo(_label3.mas_bottom).offset(16);
        make.height.mas_equalTo(30);
        make.left.mas_equalTo(_jiaoYiMoneyTextField.mas_left);
        make.right.mas_equalTo(_jiaoYiMoneyTextField.mas_right);
        
    }];
    
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_endDateButton.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_endDateButton.mas_centerX);
        
    }];
    
    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_faBaoNoteMenu.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_faBaoNoteMenu.mas_centerX);
        
    }];
    
    [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_noteStoreMenu.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_noteStoreMenu.mas_centerX);
        
    }];
    [_beiZhuTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label6.mas_bottom).offset(8);
        make.left.mas_equalTo(_noteStoreMenu.mas_left);
        make.right.mas_equalTo(_noteStoreMenu.mas_right);
        make.height.mas_equalTo(120);
        
    }];
    [_beiZhuPlaceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.top.mas_equalTo(_beiZhuTextView.mas_top).offset(8);
        make.left.mas_equalTo(_beiZhuTextView.mas_left).offset(6);
        
    }];

}

#pragma mark - LMJDropdownMenuDelegate
-(void)dropdownMenuDidShow:(LMJDropdownMenu *)menu{
    
    _beiZhuTextView.editable = NO;
    _jiaoYiMoneyTextField.enabled = NO;
    _endDateButton.enabled = NO;
    
}

-(void)dropdownMenuDidHidden:(LMJDropdownMenu *)menu{
    
    _beiZhuTextView.editable = YES;
    _jiaoYiMoneyTextField.enabled = YES;
    _endDateButton.enabled = YES;;
    
}

#pragma mark - 日期按钮点击事件
-(void)clickButton:(UIButton *)button{
    
    //    _timeButton.backgroundColor = [UIColor whiteColor];
    
    if (button.tag == 1) {
        
        _endDateButton.selected = YES;
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
    
    if (_endDateButton.tag == 1 && _endDateButton.selected == YES) {
        
        _endDateButton.selected = NO;
        
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
        make.top.mas_equalTo(self.mas_top).offset([UIScreen mainScreen].bounds.size.height / 2);
        make.height.mas_equalTo(160);
        
    }];
    
}

-(void)chooseTimeButtonDate{
    
    _timeButtonDate = _datePicker.date;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    
    NSString *dateString = [dateFormatter stringFromDate:_timeButtonDate];
    
    if (_endDateButton.tag == 1 && _endDateButton.selected == YES) {
        
        [_endDateButton setTitle:dateString forState:UIControlStateNormal];
        
    }
    
}

-(UILabel *)setupLabelWithText:(NSString *)text Font:(UIFont *)font TextColor:(UIColor *)textColor{
    
    UILabel *label = [[UILabel alloc] init];
    
    label.text = text;
    label.font = font;
    label.textColor = textColor;
    
    [self addSubview:label];
    
    return label;
    
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
