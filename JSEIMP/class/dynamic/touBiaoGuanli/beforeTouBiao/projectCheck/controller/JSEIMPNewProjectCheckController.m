//
//  JSEIMPNewProjectCheckController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/9/22.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPNewProjectCheckController.h"
#import "LMJDropdownMenu.h"
#import <Masonry.h>

#define UIScreesW [UIScreen mainScreen].bounds.size.width
#define UIScreesH [UIScreen mainScreen].bounds.size.height

@interface JSEIMPNewProjectCheckController ()<LMJDropdownMenuDelegate,UITextViewDelegate,UITextFieldDelegate>

@end

@implementation JSEIMPNewProjectCheckController{

    UIButton *_button;
    
    UIScrollView *_scrollView;
    
    UIView *_view;
    
    NSDate *_timeButtonDate;
    
    UIView *_cancelView;
    
    UIButton *_cancelButton;
    
    UIButton *_sureButton;
    
    UIView *_backView;
    
    UIView *_touchView;
    
    UIDatePicker *_datePicker;
    
    UILabel *_label1;
    
    UILabel *_label2;
    
    UILabel *_label3;
    
    UILabel *_label4;
    
    UILabel *_label5;
    
    UILabel *_label6;
    
    UILabel *_label7;
    
    UILabel *_label8;
    
    LMJDropdownMenu *_projectNameMenu;
    
    UIButton *_timeButton;
    
    UITextField *_checkPeopleTextField;
    
    UITextField *_checkPeoplePositionTextField;
    
    UITextField *_withPeopleTextField;
    
    UITextField *_carTextField;
    
    UITextView *_prepareZiliaoTextView;
    
    UILabel *_prepareZiLiaoPlaceLabel;
    
    UITextView *_beiZhuTextView;
    
    UILabel *_beiZhuPlaceLabel;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
    self.title = @"新建工程考察";
    
    [self setupUI];
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{

    [self scrollViewFrameChange];
    
    _timeButton.enabled = NO;

}

-(void)textFieldDidEndEditing:(UITextField *)textField{

    [self scrollViewFrameRecover];
    
    _timeButton.enabled = YES;

}

-(void)textViewDidBeginEditing:(UITextView *)textView{

    [self scrollViewFrameChange];
    
    _timeButton.enabled = NO;

}

-(void)textViewDidEndEditing:(UITextView *)textView{

    [self scrollViewFrameRecover];
    
    _timeButton.enabled = YES;

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
    _projectNameMenu = [self setDropDownMenuWithFrame:CGRectMake(16, 55, UIScreesW - 32, 30) Title:@"==请选择项目名称==" Titles:@[@"俞泾浦南、四平路西地块综合开发项目总包工程",@"苏州嘉苑和广场"]];
    
    _label2 = [self setupLabelWithText:@"考察日期*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _timeButton = [self setButtonWithColor:[UIColor whiteColor] Title:@"==请选择日期=="];
    [_timeButton addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    
    _label3 = [self setupLabelWithText:@"考察人*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _checkPeopleTextField = [self setupTextFieldWithPlacedText:@"请填写考察人姓名"];
    
    _label4 = [self setupLabelWithText:@"考察人职务" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _checkPeoplePositionTextField = [self setupTextFieldWithPlacedText:@"请填写考察人职务"];
    
    _label5 = [self setupLabelWithText:@"陪同人员*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _withPeopleTextField = [self setupTextFieldWithPlacedText:@"请填写陪同人员姓名"];
    
    _label6 = [self setupLabelWithText:@"车辆*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _carTextField = [self setupTextFieldWithPlacedText:@"请填写出行车辆"];
    
    _label7 = [self setupLabelWithText:@"准备资料*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _prepareZiliaoTextView = [self setupTextView];
    _prepareZiLiaoPlaceLabel = [self setupPlaceLabelWithText:@"请填写您要准备的资料" Font:[UIFont systemFontOfSize:16]];
    [_prepareZiliaoTextView addSubview:_prepareZiLiaoPlaceLabel];
    
    _label8 = [self setupLabelWithText:@"备注*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
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
        make.left.mas_equalTo(_label1.mas_left);
        make.width.mas_equalTo(92);
        
    }];
    [_timeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label2.mas_centerY);
        make.right.mas_equalTo(_projectNameMenu.mas_right);
        make.left.mas_equalTo(_label2.mas_right).offset(16);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_timeButton.mas_bottom).offset(16);
        make.left.mas_equalTo(_label2.mas_left);
        make.width.mas_equalTo(72);
        
        
    }];
    [_checkPeopleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label3.mas_centerY);
        make.left.mas_equalTo(_timeButton.mas_left);
        make.right.mas_equalTo(_timeButton.mas_right);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_checkPeopleTextField.mas_bottom).offset(16);
        make.left.mas_equalTo(_label3.mas_left);
        
    }];
    [_checkPeoplePositionTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label4.mas_centerY);
        make.left.mas_equalTo(_checkPeopleTextField.mas_left);
        make.right.mas_equalTo(_checkPeopleTextField.mas_right);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_checkPeoplePositionTextField.mas_bottom).offset(16);
        make.left.mas_equalTo(_label4.mas_left);
        
    }];
    [_withPeopleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label5.mas_centerY);
        make.left.mas_equalTo(_checkPeoplePositionTextField.mas_left);
        make.right.mas_equalTo(_checkPeoplePositionTextField.mas_right);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_withPeopleTextField.mas_bottom).offset(16);
        make.left.mas_equalTo(_label5.mas_left);
        
    }];
    [_carTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label6.mas_centerY);
        make.left.mas_equalTo(_withPeopleTextField.mas_left);
        make.right.mas_equalTo(_withPeopleTextField.mas_right);
        make.height.mas_equalTo(30);
    }];
    
    [_label7 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_carTextField.mas_bottom).offset(16);
        make.left.mas_equalTo(_label6.mas_left);
    }];
    [_prepareZiliaoTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label7.mas_bottom).offset(8);
        make.left.mas_equalTo(_label7.mas_left).offset(-6);
        make.right.mas_equalTo(_view.mas_right).offset(-16);
        make.height.mas_equalTo(120);
    }];
    [_prepareZiLiaoPlaceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.top.mas_equalTo(_prepareZiliaoTextView.mas_top).offset(8);
        make.left.mas_equalTo(_prepareZiliaoTextView.mas_left).offset(6);
    }];
    
    [_label8 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_prepareZiliaoTextView.mas_bottom).offset(16);
        make.left.mas_equalTo(_label7.mas_left);
        
    }];
    [_beiZhuTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label8.mas_bottom).offset(8);
        make.left.mas_equalTo(_label8.mas_left).offset(-6);
        make.right.mas_equalTo(_view.mas_right).offset(-16);
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

-(void)touchEvent{
    
    [_projectNameMenu hideDropDown];
    
    [_view endEditing:YES];
    
}

-(void)scrollViewFrameChange{
    
    [_view mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_beiZhuTextView.mas_bottom).offset(286);
        
    }];
    
}

-(void)scrollViewFrameRecover{
    
    [_view mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_beiZhuTextView.mas_bottom).offset(16);
        
    }];
    
}

#pragma mark - <UITextViewDelegate>
-(void)textViewDidChange:(UITextView *)textView{
    
    if (_prepareZiliaoTextView.hasText) {
        
        _prepareZiLiaoPlaceLabel.hidden = YES;
        
    }else if (!_prepareZiliaoTextView.hasText){
        
        _prepareZiLiaoPlaceLabel.hidden = NO;
        
    }
    
    if (_beiZhuTextView.hasText) {
        
         _beiZhuPlaceLabel.hidden = YES;
    }else if (!_beiZhuTextView.hasText){
    
        _beiZhuPlaceLabel.hidden = NO;
    }
    
}

-(void)dropdownMenuDidShow:(LMJDropdownMenu *)menu{

    if (_projectNameMenu.listView.frame.size.height > 580) {
        
        [_view mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.mas_equalTo(_scrollView);
            make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
            make.bottom.mas_equalTo(_projectNameMenu.listView.mas_bottom).offset(16);
            
        }];
    }
    
    _checkPeopleTextField.enabled = NO;
    _checkPeoplePositionTextField.enabled = NO;
    _withPeopleTextField.enabled = NO;
    _carTextField.enabled = NO;
    _prepareZiliaoTextView.editable = NO;
    _beiZhuTextView.editable = NO;

}

-(void)dropdownMenuWillHidden:(LMJDropdownMenu *)menu{

    _checkPeopleTextField.enabled = YES;
    _checkPeoplePositionTextField.enabled = YES;
    _withPeopleTextField.enabled = YES;
    _carTextField.enabled = YES;
    _prepareZiliaoTextView.editable = YES;
    _beiZhuTextView.editable = YES;

    
}

-(void)clickButton{
    
    _timeButton.backgroundColor = [UIColor whiteColor];
    
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

-(UILabel *)setupLabelWithText:(NSString *)text Font:(UIFont *)font TextColor:(UIColor *)textColor{
    
    UILabel *label = [[UILabel alloc] init];
    
    label.text = text;
    label.font = font;
    label.textColor = textColor;
    
    [_view addSubview:label];
    
    return label;
    
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

@end
