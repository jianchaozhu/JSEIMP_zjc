//
//  JSEIMPNewProjectJiangXiangController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/10/23.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPNewProjectJiangXiangController.h"
#import "LMJDropdownMenu.h"
#import <Masonry.h>

#define UIScreenW [UIScreen mainScreen].bounds.size.width
#define UIScreenH [UIScreen mainScreen].bounds.size.height

@interface JSEIMPNewProjectJiangXiangController ()<LMJDropdownMenuDelegate>

@property(nonatomic,strong)NSMutableArray *projectNameMArray;

@property(nonatomic,strong)NSMutableArray *jiangXiangMArray;

@property(nonatomic,strong)NSMutableArray *levelMArray;

@end

@implementation JSEIMPNewProjectJiangXiangController{

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
    
    UIButton *_button;
    
    UILabel *_label1;
    
    LMJDropdownMenu *_projectNameMenu;
    
    UILabel *_label2;
    
    LMJDropdownMenu *_jiangXiangMenu;
    
    UILabel *_label3;

    LMJDropdownMenu *_levelMenu;
    
    UILabel *_label4;
    
    UIButton *_faZhengDateButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"新建项目奖项";
    
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
    [_jiangXiangMenu hideDropDown];
    [_levelMenu hideDropDown];
    
}

-(void)setupUI{

    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:_scrollView];
    
    _view = [[UIView alloc] initWithFrame:_scrollView.bounds];
    
    _view.backgroundColor = [UIColor whiteColor];
    
    [_scrollView addSubview:_view];
    
    _touchView1 = [self setupTouchView];
    _touchView2 = [self setupTouchView];
    
    _projectNameMArray = [NSMutableArray arrayWithObjects:@"金马路项目建安总承包工程",@"太阳城一期二标", nil];
    _jiangXiangMArray = [NSMutableArray arrayWithObjects:@"鲁班奖",@"扬子杯",@"白玉兰奖", nil];
    _levelMArray = [NSMutableArray arrayWithObjects:@"国家级",@"省级",@"市级",@"其他", nil];
    
    _label1 = [self setupLabelWithText:@"项目名称*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _projectNameMenu = [self setDropDownMenuWithFrame:CGRectMake(16, 52, UIScreenW - 32, 30) Title:@"==请选择==" Titles:_projectNameMArray Tag:1];
    _label2 = [self setupLabelWithText:@"项目奖项*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _jiangXiangMenu = [self setDropDownMenuWithFrame:CGRectMake(16, 139, UIScreenW - 32, 30) Title:@"==请选择==" Titles:_jiangXiangMArray Tag:2];
    _label3 = [self setupLabelWithText:@"项目级别*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _levelMenu = [self setDropDownMenuWithFrame:CGRectMake(16, 220, UIScreenW - 32, 30) Title:@"==请选择==" Titles:_levelMArray Tag:3];
    _label4 = [self setupLabelWithText:@"发证日期*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _faZhengDateButton = [self setButtonWithColor:[UIColor whiteColor] Title:@"==请选择日期==" Tag:1];
    
    [_touchView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.bottom.mas_equalTo(self.view);
        make.right.mas_equalTo(_label1.mas_left);
        
    }];
    
    [_touchView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.right.bottom.mas_equalTo(self.view);
        make.left.mas_equalTo(_label1.mas_right);
        
    }];
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_view.mas_top).offset(16);
        make.centerX.mas_equalTo(_view.mas_centerX);
        
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_projectNameMenu.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_projectNameMenu.mas_centerX);
        
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_jiangXiangMenu.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_jiangXiangMenu.mas_centerX);
        
    }];
    
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_levelMenu.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_levelMenu.mas_centerX);
        
    }];
    
    [_faZhengDateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label4.mas_bottom).offset(16);
        make.centerX.mas_equalTo(_label4.mas_centerX);
        make.height.mas_equalTo(30);
        make.left.mas_equalTo(_levelMenu.mas_left);
        make.right.mas_equalTo(_levelMenu.mas_right);
    }];
    
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_faZhengDateButton.mas_bottom).offset(16);
        
    }];
    

}

#pragma mark - LMJDropdownMenuDelegate
-(void)dropdownMenuDidShow:(LMJDropdownMenu *)menu{
    
    _faZhengDateButton.enabled = NO;
    
    if (menu.tag == 3) {
        
        _projectNameMenu.mainBtn.enabled = NO;
        _jiangXiangMenu.mainBtn.enabled = NO;
    }
}

-(void)dropdownMenuDidHidden:(LMJDropdownMenu *)menu{
    
    _faZhengDateButton.enabled = YES;
    
    if (menu.tag == 3) {
        
        _projectNameMenu.mainBtn.enabled = YES;
        _jiangXiangMenu.mainBtn.enabled = YES;
    }
}

#pragma mark - 日期按钮点击事件
-(void)clickButton:(UIButton *)button{
    
    //    _timeButton.backgroundColor = [UIColor whiteColor];
    
    if (button.tag == 1) {
        
        _faZhengDateButton.selected = YES;
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
    
    if (_faZhengDateButton.tag == 1 && _faZhengDateButton.selected == YES) {
        
        _faZhengDateButton.selected = NO;
        
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
    
    if (_faZhengDateButton.tag == 1 && _faZhengDateButton.selected == YES) {
        
        [_faZhengDateButton setTitle:dateString forState:UIControlStateNormal];
        
    }
    
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

-(UILabel *)setupLabelWithText:(NSString *)text Font:(UIFont *)font TextColor:(UIColor *)textColor{
    
    UILabel *label = [[UILabel alloc] init];
    
    label.text = text;
    label.font = font;
    label.textColor = textColor;
    
    [_view addSubview:label];
    
    return label;
    
}

-(LMJDropdownMenu *)setDropDownMenuWithFrame:(CGRect)frame Title:(NSString *)title Titles:(NSArray *)titles Tag:(NSInteger)tag{
    
    LMJDropdownMenu *dropDownMenu = [[LMJDropdownMenu alloc] init];
    
    dropDownMenu.tag = tag;
    dropDownMenu.delegate = self;
    [dropDownMenu setFrame:frame];
    [dropDownMenu.mainBtn setTitle:title forState:UIControlStateNormal];
    [dropDownMenu.mainBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 3, 0, 10)];
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
    _button.titleLabel.font = [UIFont systemFontOfSize:14];
    //    [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [_button.layer setBorderColor:[UIColor blackColor].CGColor];
    [_button.layer setBorderWidth:0.5];
    [_button.layer setMasksToBounds:YES];
    
    [_view addSubview:_button];
    
    return _button;
    
}

@end
