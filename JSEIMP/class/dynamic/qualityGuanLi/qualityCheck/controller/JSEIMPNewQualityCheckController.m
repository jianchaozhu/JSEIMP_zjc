//
//  JSEIMPNewQualityCheckController.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/1/5.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPNewQualityCheckController.h"
#import <Masonry.h>
#import "JSEIMPModelController.h"
#import "JSProjectDynamicImageViewController.h"

#define UIScreenW [UIScreen mainScreen].bounds.size.width
#define UIScreenH [UIScreen mainScreen].bounds.size.height

@interface JSEIMPNewQualityCheckController ()<UITextFieldDelegate,UITextViewDelegate>

@end

@implementation JSEIMPNewQualityCheckController{
    
    UIButton *_button;
    
    UIScrollView *_scrollView;
    
    UIView *_view;
    
    UIDatePicker *_datePicker;
    
    NSDate *_timeButtonDate;
    
    UIView *_cancelView;
    
    UIButton *_cancelButton;
    
    UIButton *_sureButton;
    
    UIView *_backView;
    
    UILabel *_label1;
    
    UILabel *_projectNameLabel;
    
    UILabel *_label2;
    
    UITextField *_checkPeopleTextField;
    
    UILabel *_label3;
    
    UITextField *_zhengGaiRenTextField;
    
    UILabel *_label4;
    
    UIButton *_checkDateButton;
    
    UILabel *_label5;
    
    UIButton *_zhengGaiDateButton;
    
    UILabel *_label6;
    
    UITextView *_checkContentTextView;
    
    UILabel *_checkContentPlaceLabel;
    
    UILabel *_label7;
    
    UITextView *_yinHuanTextView;
    
    UILabel *_yinHuanPlaceLabel;
    
    UILabel *_label8;
    
    UITextView *_zhengGaiWayTextView;
    
    UILabel *_zhengGaiPlaceLabel;
    
    UILabel *_label9;
    
    JSProjectDynamicImageViewController *_projectDynamicImageViewController;
    
    UIView *_touchView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
    self.title = @"新增质量整改单";
    
    //添加右边的按钮
    UIBarButtonItem *sendButton = [[UIBarButtonItem alloc] initWithTitle:@"发布" style:UIBarButtonItemStyleDone target:self action:@selector(clickSendButton:)];
    
    sendButton.enabled = NO;
    
    UIBarButtonItem *modelButton = [[UIBarButtonItem alloc] initWithTitle:@"模型" style:UIBarButtonItemStyleDone target:self action:@selector(clickModelButton:)];
    
    NSArray *buttonArray = [NSArray arrayWithObjects:sendButton,modelButton, nil];
    
    self.navigationItem.rightBarButtonItems = buttonArray;
    
    [self setupUI];
}

-(void)clickModelButton:(UIButton *)button{
    
    JSEIMPModelController *modelController = [JSEIMPModelController new];
    
    modelController.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:modelController animated:YES];
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
    
    _label1 = [self setupLabelWithText:@"项目名称" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _projectNameLabel = [self setupLabelWithText:_projectName TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _projectNameLabel.numberOfLines = 0;
    _projectNameLabel.textAlignment = NSTextAlignmentRight;
    
    _label2 = [self setupLabelWithText:@"检查人" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _checkPeopleTextField = [self setupTextFieldWithPlacedText:@"请填写检查人姓名"];
    
    _label3 = [self setupLabelWithText:@"责任整改人" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _zhengGaiRenTextField = [self setupTextFieldWithPlacedText:@"请填写整改人姓名"];
    
    _label4 = [self setupLabelWithText:@"检查日期" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _checkDateButton = [self setButtonWithColor:[UIColor whiteColor] Title:@"请选择日期"];
    _checkDateButton.tag = 1;
    [_checkDateButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    _label5 = [self setupLabelWithText:@"整改时间" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _zhengGaiDateButton = [self setButtonWithColor:[UIColor whiteColor] Title:@"请选择日期"];
    _zhengGaiDateButton.tag = 2;
    [_zhengGaiDateButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    _label6 = [self setupLabelWithText:@"检查内容" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _checkContentTextView = [self setupTextView];
    _checkContentPlaceLabel = [self setupPlaceLabelWithText:@"请填写检查内容" Font:[UIFont systemFontOfSize:16]];
    [_checkContentTextView addSubview:_checkContentPlaceLabel];
    
    _label7 = [self setupLabelWithText:@"存在隐患" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _yinHuanTextView = [self setupTextView];
    _yinHuanPlaceLabel = [self setupPlaceLabelWithText:@"请填写存在的隐患" Font:[UIFont systemFontOfSize:16]];
    [_yinHuanTextView addSubview:_yinHuanPlaceLabel];
    
    _label8 = [self setupLabelWithText:@"整改措施" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _zhengGaiWayTextView = [self setupTextView];
    _zhengGaiPlaceLabel = [self setupPlaceLabelWithText:@"请填写整改措施" Font:[UIFont systemFontOfSize:16]];
    [_zhengGaiWayTextView addSubview:_zhengGaiPlaceLabel];
    
    _label9 = [self setupLabelWithText:@"添加图片" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    UIButton *imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [imageButton setImage:[UIImage imageNamed:@"tu1"] forState:UIControlStateNormal];
    [imageButton addTarget:self action:@selector(selectImage:) forControlEvents:UIControlEventTouchUpInside];
    [_view addSubview:imageButton];
    
    //创建图片控制器
    _projectDynamicImageViewController = [[JSProjectDynamicImageViewController alloc] init];
    
    [_view addSubview:_projectDynamicImageViewController.view];
    [self addChildViewController:_projectDynamicImageViewController];
    
    [_touchView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.bottom.mas_equalTo(_view);
        make.right.mas_equalTo(_label1.mas_right);
    }];
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.mas_equalTo(_view).offset(16);
        make.width.mas_equalTo(102);
    }];
    [_projectNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label1.mas_top);
        make.left.mas_equalTo(_label1.mas_right).offset(16);
        make.right.mas_equalTo(_view.mas_right).offset(-16);
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_projectNameLabel.mas_bottom).offset(16);
        make.left.mas_equalTo(_label1.mas_left);
        make.width.mas_equalTo(62);
    }];
    [_checkPeopleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_projectNameLabel.mas_left);
        make.centerY.mas_equalTo(_label2.mas_centerY);
        make.right.mas_equalTo(_projectNameLabel.mas_right);
        make.height.mas_equalTo(30);
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_checkPeopleTextField.mas_bottom).offset(16);
        make.left.mas_equalTo(_label2.mas_left);
        make.width.mas_equalTo(102);
    }];
    [_zhengGaiRenTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_checkPeopleTextField.mas_left);
        make.centerY.mas_equalTo(_label3.mas_centerY);
        make.right.mas_equalTo(_checkPeopleTextField.mas_right);
        make.height.mas_equalTo(30);
    }];
    
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_zhengGaiRenTextField.mas_bottom).offset(16);
        make.left.mas_equalTo(_label3.mas_left);
        make.width.mas_equalTo(82);
    }];
    [_checkDateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label4.mas_centerY);
        make.right.mas_equalTo(_zhengGaiRenTextField.mas_right);
        make.height.mas_equalTo(30);
        make.left.mas_equalTo(_zhengGaiRenTextField.mas_left);
    }];
    
    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_checkDateButton.mas_bottom).offset(16);
        make.left.mas_equalTo(_label4.mas_left);
        make.right.mas_equalTo(_label4.mas_right);
    }];
    [_zhengGaiDateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label5.mas_centerY);
        make.right.mas_equalTo(_checkDateButton.mas_right);
        make.height.mas_equalTo(30);
        make.left.mas_equalTo(_checkDateButton.mas_left);
    }];
    
    [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_zhengGaiDateButton.mas_bottom).offset(16);
        make.left.mas_equalTo(_label5.mas_left);
        make.right.mas_equalTo(_label5.mas_right);
    }];
    [_checkContentTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label6.mas_bottom).offset(8);
        make.left.mas_equalTo(_label6.mas_left);
        make.right.mas_equalTo(_zhengGaiDateButton.mas_right);
        make.height.mas_equalTo(120);
    }];
    [_checkContentPlaceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_checkContentTextView.mas_top).offset(8);
        make.left.mas_equalTo(_checkContentTextView.mas_left).offset(6);
    }];
    
    [_label7 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_checkContentTextView.mas_bottom).offset(16);
        make.left.mas_equalTo(_label6.mas_left);
        make.right.mas_equalTo(_label6.mas_right);
    }];
    [_yinHuanTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label7.mas_bottom).offset(8);
        make.left.mas_equalTo(_label7.mas_left);
        make.right.mas_equalTo(_checkContentTextView.mas_right);
        make.height.mas_equalTo(120);
    }];
    [_yinHuanPlaceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_yinHuanTextView.mas_top).offset(8);
        make.left.mas_equalTo(_yinHuanTextView.mas_left).offset(6);
    }];
    
    [_label8 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_yinHuanTextView.mas_bottom).offset(16);
        make.left.mas_equalTo(_label7.mas_left);
        make.right.mas_equalTo(_label7.mas_right);
    }];
    [_zhengGaiWayTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label8.mas_bottom).offset(8);
        make.left.mas_equalTo(_label8.mas_left);
        make.right.mas_equalTo(_yinHuanTextView.mas_right);
        make.height.mas_equalTo(120);
    }];
    [_zhengGaiPlaceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_zhengGaiWayTextView.mas_top).offset(8);
        make.left.mas_equalTo(_zhengGaiWayTextView.mas_left).offset(6);
    }];
    
    [_label9 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_zhengGaiWayTextView.mas_bottom).offset(16);
        make.left.mas_equalTo(_label8.mas_left);
        make.right.mas_equalTo(_label8.mas_right);
    }];
    [imageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label9.mas_top);
        make.right.mas_equalTo(_zhengGaiWayTextView.mas_right);
        make.bottom.mas_equalTo(_label9.mas_bottom);
    }];
    [_projectDynamicImageViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label9.mas_bottom).offset(16);
        make.left.right.mas_equalTo(_view);
        make.height.mas_equalTo(240);
    }];
    
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo(UIScreenW);
        make.bottom.mas_equalTo(_projectDynamicImageViewController.view.mas_bottom).offset(16);
    }];
}

#pragma mark - 触摸事件
-(void)touchEvent{
    
    [_view endEditing:YES];
}

#pragma mark - <UITextViewDelegate>
-(void)textViewDidChange:(UITextView *)textView{
    
    if (_checkContentTextView.hasText || _yinHuanTextView.hasText) {
        
        _checkContentPlaceLabel.hidden = YES;
    }else if (!_checkContentTextView.hasText){
        
        _checkContentPlaceLabel.hidden = NO;
    }
    if (_zhengGaiWayTextView.hasText) {
        
        _zhengGaiPlaceLabel.hidden = YES;
    }else if (!_zhengGaiWayTextView.hasText){
        
        _zhengGaiPlaceLabel.hidden = NO;
    }
    if (_yinHuanTextView.hasText) {
        
        _yinHuanPlaceLabel.hidden = YES;
    }else if (!_yinHuanTextView.hasText){
        
        _yinHuanPlaceLabel.hidden = NO;
    }
    
}

#pragma mark - UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    _checkDateButton.enabled = NO;
    _zhengGaiDateButton.enabled = NO;
    
    [self scrollViewFrameChange];
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    _checkDateButton.enabled = YES;
    _zhengGaiDateButton.enabled = YES;
    
    [self scrollViewFrameRecover];
    
}

#pragma mark - UITextViewDelegate
-(void)textViewDidBeginEditing:(UITextView *)textView{
    
    _checkDateButton.enabled = NO;
    _zhengGaiDateButton.enabled = NO;
    
    [self scrollViewFrameChange];
    
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    
    _checkDateButton.enabled = YES;
    _zhengGaiDateButton.enabled = YES;
    
    [self scrollViewFrameRecover];
    
}

#pragma mark - ScrollViewFramebianhua
-(void)scrollViewFrameChange{
    
    [_view mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_projectDynamicImageViewController.view.mas_bottom).offset(226);
        
    }];
    
}

-(void)scrollViewFrameRecover{
    
    [_view mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_projectDynamicImageViewController.view.mas_bottom).offset(10);
        
    }];
    
}

-(void)selectImage:(UIButton *)button{
    
    [_projectDynamicImageViewController selectImageButton];
}

#pragma mark - 日期按钮点击事件
-(void)clickButton:(UIButton *)button{
    
    //    _timeButton.backgroundColor = [UIColor whiteColor];
    
    if (button.tag == 1) {
        
        _checkDateButton.selected = YES;
    }else if (_zhengGaiDateButton.tag == 2){
        
        _zhengGaiDateButton.selected = YES;
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
    
    if (_checkDateButton.tag == 1 && _checkDateButton.selected == YES) {
        
        _checkDateButton.selected = NO;
    }else if (_zhengGaiDateButton.tag == 2 && _zhengGaiDateButton.selected == YES){
        
        _zhengGaiDateButton.selected = NO;
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
    
    if (_checkDateButton.tag == 1 && _checkDateButton.selected == YES) {
        
        [_checkDateButton setTitle:dateString forState:UIControlStateNormal];
    }else if (_zhengGaiDateButton.tag == 2 && _zhengGaiDateButton.selected == YES){
        
        [_zhengGaiDateButton setTitle:dateString forState:UIControlStateNormal];
    }
}

-(UITextView *)setupTextView{
    
    UITextView *textView = [UITextView new];
    
    textView.layer.borderWidth = 0.5;
    //内容可以拖拽
    textView.alwaysBounceVertical = YES;
    textView.delegate = self;
    //关闭键盘
    textView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    textView.font = [UIFont systemFontOfSize:16];
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

-(UIButton *)setButtonWithColor:(UIColor *)color Title:(NSString *)title{
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _button.backgroundColor = color;
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

-(UILabel *)setupLabelWithText:(NSString *)text TextColor:(UIColor *)textColor Font:(UIFont *)font{
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    
    [_view addSubview:label];
    
    return label;
    
}

@end
