//
//  JSEIMPNewChengBaoHeTongController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/11/10.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPNewChengBaoHeTongController.h"
#import "LMJDropdownMenu.h"
#import <Masonry.h>
#import "SkyAssociationMenuView.h"
#import "HACursor.h"
#import "UIView+Extension.h"
#import "HATestView.h"
#import "JSEIMPNewChengBaoFanWeiView.h"
#import "JSEIMPNewShouKuanJieDianView.h"
#import "JSEIMPNewHeTongZhiFuTiaoKuanView.h"
#import "JSEIMPNewProjecteQualityTiaoKuanView.h"
#import "JSEIMPNewWenMingShiGongTiaoKuanView.h"
#import "JSEIMPNewOtherTiaoKuanView.h"

#define UIScreenW [UIScreen mainScreen].bounds.size.width
#define UIScreenH [UIScreen mainScreen].bounds.size.height

@interface JSEIMPNewChengBaoHeTongController ()<LMJDropdownMenuDelegate,UITextFieldDelegate,UITextViewDelegate,SkyAssociationMenuViewDelegate,UIScrollViewDelegate,JSEIMPNewChengBaoFanWeiViewDelegate>

@property(nonatomic,strong)NSMutableArray *titlesMArray1;

@property(nonatomic,strong)NSMutableArray *gongYingShangMArray;

@property(nonatomic,strong)NSMutableArray *keHuMArray;

@property(nonatomic,strong)NSMutableArray *jiaFangMArray;

@property(nonatomic,strong)NSMutableArray *titlesMArray2;

@end

@implementation JSEIMPNewChengBaoHeTongController{

    UIScrollView *_scrollView;
    
    UIView *_view;
    
    UIView *_touchView;
    
    UIDatePicker *_datePicker;
    
    NSDate *_timeButtonDate;
    
    UIView *_cancelView;
    
    UIButton *_cancelButton;
    
    UIButton *_sureButton;
    
    UIView *_backView;
    
    UIButton *_button;

    UILabel *_label1;
    
    LMJDropdownMenu *_projectMenu;
    
    UILabel *_label2;
    
    UITextField *_bianHaoTextField;
    
    UILabel *_label3;
    
    LMJDropdownMenu *_heTongStyleMenu;
    
    UILabel *_label4;
    
    UITextView *_heTongNameTextView;
    
    UILabel *_heTongNamePlaceLabel;
    
    UILabel *_label5;
    
    UITextField *_heTongValueTextField;
    
    UILabel *_label6;
    
    UIButton *_jiaFangButton;
    
    LMJDropdownMenu *_jiaFangMenu;
    
    BOOL jiaFangButtonIsShow;
    
    SkyAssociationMenuView *_menuView;
    
    UILabel *_label7;
    
    UIButton *_yiFangButton;
    
    LMJDropdownMenu *_yiFangMenu;
    
    BOOL yiFangButtonIsShow;
    
    UILabel *_label8;
    
    UIButton *_qianYueDateButton;
    
    UILabel *_label9;
    
    UIButton *_planstartDateButton;
    
    UILabel *_label10;
    
    UIButton *_planFinishDateButton;
    
    UILabel *_label11;
    
    UILabel *_heTongGongQiLabel;
    
    UILabel *_label12;
    
    LMJDropdownMenu *_heTongJiJiaStyleMenu;
    
    UILabel *_label13;
    
    UITextField *_qualityBiaoZhunTextField;
    
    UILabel *_label14;
    
    UILabel *_jieGouStyleLabel;
    
    UILabel *_label15;
    
    UILabel *_moneyFromLabel;
    
    UILabel *_label16;
    
    UILabel *_label17;
    
    UITextField *_projectQualityBaoZhengJinTextField;
    
    UILabel *_label18;
    
    UILabel *_projectAdressLabel;
    
    UILabel *_label19;
    
    UILabel *_mianJiLabel;
    
    UILabel *_label20;
    
    UITextField *_wenMingShiGongMoneyTextField;
    
    HACursor *_cursor;
    
    UIScrollView *_scrollView1;
    
    UIScrollView *_scrollView2;
    
    UIScrollView *_scrollView3;
    
    UIScrollView *_scrollView4;
    
    UIScrollView *_scrollView5;
    
    UIScrollView *_scrollView6;
    
    JSEIMPNewChengBaoFanWeiView *_newChengBaoFanWeiView;
    
    JSEIMPNewShouKuanJieDianView *_newShouKuanJieDianView;
    
    JSEIMPNewHeTongZhiFuTiaoKuanView *_newHeTongZhiFuTiaoKuanView;
    
    JSEIMPNewProjecteQualityTiaoKuanView *_newProjecteQualityTiaoKuanView;
    
    JSEIMPNewWenMingShiGongTiaoKuanView *_newWenMingShiGongTiaoKuanView;
    
    JSEIMPNewOtherTiaoKuanView *_newOtherTiaoKuanView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"新建承包合同";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
    _jiaFangMArray = [NSMutableArray arrayWithObjects:@"编码：S0005  名称：钢筋供应商",@"编码：S0006  名称：水泥供应商",@"编码：S0007  名称：木材供应商",@"编码：S0008  名称：设备供应商",@"编码：S0009  名称：水电供应商",@"编码：C0004  名称：当涂县碧桂园房地产开发有限公司",@"编码：C0003  名称：上海嘉实(集团)有限公司",@"编码：C0005  名称：张家港碧桂园房地产开发有限公司", nil];
    _titlesMArray1 = [NSMutableArray arrayWithObjects:@"供应商",@"客户", nil];
    _gongYingShangMArray = [NSMutableArray arrayWithObjects:@"发包商",@"运输单位",@"设计院",@"监理单位",@"材料供应商",@"其他供应商", nil];
    _keHuMArray = [NSMutableArray arrayWithObjects:@"客户酒店",@"建设单位",@"其他客户",@"发包方",@"",@"", nil];
    
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
    
    _touchView = [self setupTouchView];
    
    _menuView = [SkyAssociationMenuView new];
    _menuView.delegate = self;
    
    _label1 = [self setupLabelWithText:@"项目*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _projectMenu = [self setDropDownMenuWithFrame:CGRectMake(16, 52, UIScreenW - 32, 36) Title:@"请选择项目" Titles:@[@"张家港南二环碧桂园1-4#楼、商业C、地下汽车库(一期)",@"安徽马鞍山当涂项目",@"金科宝华山项目(南京金科城)",@"郑州马头岗新城项目",@"郑州金科一期A标段土建及普通水电安装工程"] Tag:1];
    
    _label2 = [self setupLabelWithText:@"合同编号" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _bianHaoTextField = [self setupTextFieldWithPlacedText:@"请填写合同编号"];
    
    _label3 = [self setupLabelWithText:@"合同类型*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _heTongStyleMenu = [self setDropDownMenuWithFrame:CGRectMake(158, 140, UIScreenW - 174, 30) Title:@"请选择合同类型" Titles:@[@"总承包合同",@"总包合同"] Tag:2];
    
    _label4 = [self setupLabelWithText:@"合同名称*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _heTongNameTextView = [self setupTextView];
    _heTongNamePlaceLabel = [self setupPlaceLabelWithText:@"请填写合同名称" Font:[UIFont systemFontOfSize:16]];
    [_heTongNameTextView addSubview:_heTongNamePlaceLabel];
    
    _label5 = [self setupLabelWithText:@"合同总价(元)*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _heTongValueTextField = [self setupTextFieldWithPlacedText:@"请填写合同总价"];
    
    _label6 = [self setupLabelWithText:@"甲方*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _jiaFangButton = [self setButtonWithColor:[UIColor whiteColor] Title:@"==供应商/客户==" Action:@selector(clickButton:) Tag:1];
    _jiaFangButton.hidden = YES;
    _jiaFangMenu = [self setDropDownMenuWithFrame:CGRectMake(158, 328, UIScreenW - 174, 40) Title:@"==请选择总列表==" Titles:_jiaFangMArray Tag:3];
    
    _label7 = [self setupLabelWithText:@"乙方*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _yiFangButton = [self setButtonWithColor:[UIColor whiteColor] Title:@"==供应商/客户==" Action:@selector(clickButton:) Tag:2];
    _yiFangButton.hidden = YES;
    _yiFangMenu = [self setDropDownMenuWithFrame:CGRectMake(158, 384, UIScreenW - 174, 40) Title:@"==请选择总列表==" Titles:_jiaFangMArray Tag:4];
    
    _label8 = [self setupLabelWithText:@"签约日期*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _qianYueDateButton = [self setButtonWithColor:[UIColor whiteColor] Title:@"请选择签约日期" Action:@selector(clickDateButton:) Tag:3];
    
    _label9 = [self setupLabelWithText:@"计划开工日期*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _planstartDateButton = [self setButtonWithColor:[UIColor whiteColor] Title:@"请选择开工日期" Action:@selector(clickDateButton:) Tag:4];
    
    _label10 = [self setupLabelWithText:@"计划完成日期*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _planFinishDateButton = [self setButtonWithColor:[UIColor whiteColor] Title:@"请选择完成日期" Action:@selector(clickDateButton:) Tag:5];
    
    _label11 = [self setupLabelWithText:@"合同工期" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _heTongGongQiLabel = [self setupLabelWithText:@"" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkTextColor]];
    _heTongGongQiLabel.backgroundColor = [UIColor colorWithRed:220.0 / 255.0 green:220.0 / 255.0 blue:220.0 / 255.0 alpha:1];
    _heTongGongQiLabel.textAlignment = NSTextAlignmentCenter;
    
    _label12 = [self setupLabelWithText:@"合同计价方式*" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _heTongJiJiaStyleMenu = [self setDropDownMenuWithFrame:CGRectMake(158, 606, UIScreenW - 174, 30) Title:@"请选择计价方式" Titles:@[@"固定总价合同",@"固定单价合同",@"成本加酬金"] Tag:5];
    
    _label13 = [self setupLabelWithText:@"质量标准" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _qualityBiaoZhunTextField = [self setupTextFieldWithPlacedText:@"请填写质量标准"];
    
    _label14 = [self setupLabelWithText:@"结构形式" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _jieGouStyleLabel = [self setupLabelWithText:@"" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkTextColor]];
    _jieGouStyleLabel.backgroundColor = [UIColor colorWithRed:220.0 / 255.0 green:220.0 / 255.0 blue:220.0 / 255.0 alpha:1];
    _jieGouStyleLabel.numberOfLines = 0;
    _jieGouStyleLabel.textAlignment = NSTextAlignmentRight;
    
    _label15 = [self setupLabelWithText:@"资金来源" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _moneyFromLabel = [self setupLabelWithText:@"" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkTextColor]];
    _moneyFromLabel.backgroundColor = [UIColor colorWithRed:220.0 / 255.0 green:220.0 / 255.0 blue:220.0 / 255.0 alpha:1];
    _moneyFromLabel.textAlignment = NSTextAlignmentRight;
    
    _label16 = [self setupLabelWithText:@"工程质量保修金" Font:[UIFont systemFontOfSize:19] TextColor:[UIColor darkTextColor]];
    _label17 = [self setupLabelWithText:@"%" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkTextColor]];
    _projectQualityBaoZhengJinTextField = [self setupTextFieldWithPlacedText:@"请填写保证金比例"];
    
    _label18 = [self setupLabelWithText:@"工程地点" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _projectAdressLabel = [self setupLabelWithText:@"" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkTextColor]];
    _projectAdressLabel.backgroundColor = [UIColor colorWithRed:220.0 / 255.0 green:220.0 / 255.0 blue:220.0 / 255.0 alpha:1];
    if (_projectAdressLabel.text.length > 17) {
        
        _projectAdressLabel.textAlignment = NSTextAlignmentRight;
    }
    _projectAdressLabel.numberOfLines = 0;
    
    _label19 = [self setupLabelWithText:@"建筑面积(m2)" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _mianJiLabel = [self setupLabelWithText:@"" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkTextColor]];
    _mianJiLabel.backgroundColor = [UIColor colorWithRed:220.0 / 255.0 green:220.0 / 255.0 blue:220.0 / 255.0 alpha:1];
    _mianJiLabel.textAlignment = NSTextAlignmentRight;
    
    _label20 = [self setupLabelWithText:@"文明施工费(元)" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _wenMingShiGongMoneyTextField = [self setupTextFieldWithPlacedText:@"请填写费用"];
    
    [_touchView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.bottom.mas_equalTo(self.view);
        make.right.mas_equalTo(_label1.mas_right);
    }];
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.mas_equalTo(_view).offset(16);
        
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_projectMenu.mas_left);
        make.top.mas_equalTo(_projectMenu.mas_bottom).offset(16);
        make.width.mas_equalTo(82);
        
    }];
    [_bianHaoTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_heTongValueTextField.mas_left);
        make.centerY.mas_equalTo(_label2.mas_centerY);
        make.right.mas_equalTo(_projectMenu.mas_right);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label2.mas_left);
        make.top.mas_equalTo(_label2.mas_bottom).offset(16);
        make.width.mas_equalTo(92);
    }];
    
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label3.mas_left);
        make.top.mas_equalTo(_heTongStyleMenu.mas_bottom).offset(16);
        
    }];
    [_heTongNameTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label4.mas_bottom).offset(16);
        make.left.mas_equalTo(_label4.mas_left);
        make.right.mas_equalTo(_heTongStyleMenu.mas_right);
        make.height.mas_equalTo(45);
        
    }];
    [_heTongNamePlaceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_heTongNameTextView.mas_top).offset(6);
        make.centerX.mas_equalTo(_heTongNameTextView.mas_centerX);
        
    }];

    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_heTongNameTextView.mas_left);
        make.top.mas_equalTo(_heTongNameTextView.mas_bottom).offset(16);
        make.width.mas_equalTo(126);
        
    }];
    [_heTongValueTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label5.mas_centerY);
        make.left.mas_equalTo(_label5.mas_right).offset(16);
        make.right.mas_equalTo(_heTongNameTextView.mas_right);
        make.height.mas_equalTo(30);
    }];
    
    [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_heTongValueTextField.mas_bottom).offset(24);
        make.left.mas_equalTo(_label5.mas_left);
    }];
    [_jiaFangButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label6.mas_left);
        make.right.mas_equalTo(_view.mas_centerX).offset(-16);
        make.height.mas_equalTo(30);
        make.top.mas_equalTo(_jiaFangMenu.mas_bottom).offset(16);
        
    }];
    

    [_label7 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_jiaFangMenu.mas_bottom).offset(24);
        make.left.mas_equalTo(_label6.mas_left);
    }];
    [_yiFangButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label7.mas_left);
        make.right.mas_equalTo(_view.mas_centerX).offset(-16);
        make.height.mas_equalTo(30);
        make.top.mas_equalTo(_yiFangMenu.mas_bottom).offset(16);
        
    }];
    
    [_label8 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label7.mas_bottom).offset(24);
        make.left.mas_equalTo(_label7.mas_left);
        make.right.mas_equalTo(_label3.mas_right);
    }];
    [_qianYueDateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_yiFangMenu.mas_left);
        make.right.mas_equalTo(_yiFangMenu.mas_right);
        make.centerY.mas_equalTo(_label8.mas_centerY);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label9 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_qianYueDateButton.mas_bottom).offset(16);
        make.left.mas_equalTo(_label8.mas_left);
        make.width.mas_equalTo(134);
    }];
    [_planstartDateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_qianYueDateButton.mas_left);
        make.right.mas_equalTo(_qianYueDateButton.mas_right);
        make.centerY.mas_equalTo(_label9.mas_centerY);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label10 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_planstartDateButton.mas_bottom).offset(16);
        make.left.mas_equalTo(_label9.mas_left);
        make.right.mas_equalTo(_label9.mas_right);
    }];
    [_planFinishDateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_planstartDateButton.mas_left);
        make.right.mas_equalTo(_planstartDateButton.mas_right);
        make.centerY.mas_equalTo(_label10.mas_centerY);
        make.height.mas_equalTo(30);
        
    }];

    [_label11 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_planFinishDateButton.mas_bottom).offset(16);
        make.left.mas_equalTo(_label10.mas_left);
        make.right.mas_equalTo(_label2.mas_right);
    }];
    [_heTongGongQiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_planFinishDateButton.mas_left);
        make.right.mas_equalTo(_planFinishDateButton.mas_right);
        make.centerY.mas_equalTo(_label11.mas_centerY);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label12 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label11.mas_bottom).offset(16);
        make.left.mas_equalTo(_label11.mas_left);
        make.right.mas_equalTo(_label10.mas_right);
    }];
    
    [_label13 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label12.mas_left);
        make.top.mas_equalTo(_label12.mas_bottom).offset(16);
        make.right.mas_equalTo(_label11.mas_right);
    }];
    [_qualityBiaoZhunTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_heTongJiJiaStyleMenu.mas_left);
        make.centerY.mas_equalTo(_label13.mas_centerY);
        make.right.mas_equalTo(_heTongJiJiaStyleMenu.mas_right);
        make.height.mas_equalTo(30);
    }];
    
    [_label14 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label13.mas_left);
        make.top.mas_equalTo(_qualityBiaoZhunTextField.mas_bottom).offset(16);
        make.right.mas_equalTo(_label13.mas_right);
    }];
    if (_jieGouStyleLabel.text.length > 8) {
        
        [_jieGouStyleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(_qualityBiaoZhunTextField.mas_left);
            make.right.mas_equalTo(_qualityBiaoZhunTextField.mas_right);
            make.centerY.mas_equalTo(_label14.mas_centerY);
            make.height.mas_equalTo(40);
        }];
    }else if (_jieGouStyleLabel.text.length <=8 ){
    
        [_jieGouStyleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(_qualityBiaoZhunTextField.mas_left);
            make.right.mas_equalTo(_qualityBiaoZhunTextField.mas_right);
            make.centerY.mas_equalTo(_label14.mas_centerY);
            make.height.mas_equalTo(30);
        }];
    }
    
    [_label15 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label14.mas_left);
        make.top.mas_equalTo(_jieGouStyleLabel.mas_bottom).offset(16);
        make.right.mas_equalTo(_label14.mas_right);
    }];
    [_moneyFromLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_jieGouStyleLabel.mas_left);
        make.right.mas_equalTo(_jieGouStyleLabel.mas_right);
        make.centerY.mas_equalTo(_label15.mas_centerY);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label16 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label15.mas_left);
        make.top.mas_equalTo(_moneyFromLabel.mas_bottom).offset(16);
        make.width.mas_equalTo(144);
    }];
    [_label17 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(_moneyFromLabel.mas_right);
        make.centerY.mas_equalTo(_label16.mas_centerY);
        make.width.mas_equalTo(12);
    }];
    [_projectQualityBaoZhengJinTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_moneyFromLabel.mas_left);
        make.centerY.mas_equalTo(_label17.mas_centerY);
        make.right.mas_equalTo(_label17.mas_left);
        make.height.mas_equalTo(30);
    }];
    
    [_label18 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label15.mas_left);
        make.top.mas_equalTo(_projectQualityBaoZhengJinTextField.mas_bottom).offset(16);
        make.right.mas_equalTo(_label15.mas_right);
    }];
    if (_projectAdressLabel.text.length > 17) {
        
        [_projectAdressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(_label18.mas_left);
            make.right.mas_equalTo(_label17.mas_right);
            make.height.mas_equalTo(40);
            make.top.mas_equalTo(_label18.mas_bottom).offset(16);
        }];
    }else if (_projectAdressLabel.text.length <= 17){
    
        [_projectAdressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(_label18.mas_left);
            make.right.mas_equalTo(_label17.mas_right);
            make.height.mas_equalTo(30);
            make.top.mas_equalTo(_label18.mas_bottom).offset(16);
        }];
    }
    
    [_label19 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label18.mas_left);
        make.top.mas_equalTo(_projectAdressLabel.mas_bottom).offset(16);
        make.width.mas_equalTo(126);
    }];
    [_mianJiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_moneyFromLabel.mas_left);
        make.right.mas_equalTo(_moneyFromLabel.mas_right);
        make.centerY.mas_equalTo(_label19.mas_centerY);
        make.height.mas_equalTo(30);
        
    }];
    
    [_label20 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label19.mas_left);
        make.top.mas_equalTo(_mianJiLabel.mas_bottom).offset(16);
        make.width.mas_equalTo(138);
    }];
    [_wenMingShiGongMoneyTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_mianJiLabel.mas_left);
        make.right.mas_equalTo(_mianJiLabel.mas_right);
        make.centerY.mas_equalTo(_label20.mas_centerY);
        make.height.mas_equalTo(30);
        
    }];
    
    //创建滚动查看视图
    [self setupCursor];
    
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo(UIScreenW);
        make.bottom.mas_equalTo(_cursor.mas_bottom).offset(16);
        
    }];
    
}

#pragma mark - 触摸事件
-(void)touchEvent{
    
    [_heTongJiJiaStyleMenu hideDropDown];
    [_heTongStyleMenu hideDropDown];
    [_projectMenu hideDropDown];
    [_jiaFangMenu hideDropDown];
    [_yiFangMenu hideDropDown];
    [self.view endEditing:YES];
}

-(void)setupCursor{
    
    _titlesMArray2 = [NSMutableArray arrayWithObjects:@"承包范围",@"收款节点",@"支付条款",@"质量条款",@"施工条款",@"其他条款", nil];
    
    _cursor = [[HACursor alloc]init];
    //    _cursor.backgroundColor = [UIColor colorWithRed:56.0 / 255.0 green:135.0 / 255.0 blue:250.0 / 255.0 alpha:1];
    _cursor.backgroundColor = [UIColor lightGrayColor];
    
    _cursor.frame = CGRectMake(0, 994, self.view.width, 45);
    _cursor.titles = self.titlesMArray2;
    _cursor.pageViews = [self createPageViews];
    //设置根滚动视图的高度
    _cursor.rootScrollViewHeight = self.view.frame.size.height / 2;
    //默认值是白色
    _cursor.titleNormalColor = [UIColor darkTextColor];
    //默认值是白色
    _cursor.titleSelectedColor = [UIColor whiteColor];
    //是否显示排序按钮
    _cursor.showSortbutton = YES;
    //默认的最小值是5，小于默认值的话按默认值设置
    _cursor.minFontSize = 13;
    //默认的最大值是25，小于默认值的话按默认值设置，大于默认值按设置的值处理
    _cursor.maxFontSize = 16;
    //cursor.isGraduallyChangFont = NO;
    //在isGraduallyChangFont为NO的时候，isGraduallyChangColor不会有效果
    //cursor.isGraduallyChangColor = NO;
    [_view addSubview:_cursor];
    
}

#pragma mark - 滚动视图的创建
- (NSMutableArray *)createPageViews{
    
    NSMutableArray *pageViews = [NSMutableArray array];
    
    for (NSInteger i = 0; i < self.titlesMArray2.count; i++) {
        
        if (i == 0) {
            
            _cursor.rootScrollView.bounces = NO;
            
            _scrollView1 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height / 2)];
            
            _newChengBaoFanWeiView = [[JSEIMPNewChengBaoFanWeiView alloc] init];
            _newChengBaoFanWeiView.delagete = self;
            
            [_scrollView1 addSubview:_newChengBaoFanWeiView];
            
            [_newChengBaoFanWeiView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.edges.mas_equalTo(_scrollView1);
                make.width.mas_equalTo(UIScreenW);
                make.bottom.mas_equalTo(_newChengBaoFanWeiView.chengBaoFanTextView.mas_bottom).offset(16);
                
            }];
            
            [pageViews addObject:_scrollView1];
        }else if (i == 1){
        
            _cursor.rootScrollView.bounces = NO;
            
            _scrollView2 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height / 2)];
            
            _scrollView2.delegate = self;
            
            _newShouKuanJieDianView = [[JSEIMPNewShouKuanJieDianView alloc] init];
            
            [_scrollView2 addSubview:_newShouKuanJieDianView];
            
            [_newShouKuanJieDianView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.edges.mas_equalTo(_scrollView2);
                make.width.mas_equalTo(UIScreenW);
                make.bottom.mas_equalTo(_newShouKuanJieDianView.lineView.mas_bottom).offset(8);
            }];
            
            [pageViews addObject:_scrollView2];
        }else if (i == 2){
            
            _cursor.rootScrollView.bounces = NO;
            
            _scrollView3 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height / 2)];
            
            _scrollView3.delegate = self;
            
            _newHeTongZhiFuTiaoKuanView = [[JSEIMPNewHeTongZhiFuTiaoKuanView alloc] init];
            
            [_scrollView3 addSubview:_newHeTongZhiFuTiaoKuanView];
            
            [_newHeTongZhiFuTiaoKuanView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.edges.mas_equalTo(_scrollView3);
                make.width.mas_equalTo(UIScreenW);
                make.bottom.mas_equalTo(_newHeTongZhiFuTiaoKuanView.zhiFuTiaoKuanTextView.mas_bottom).offset(8);
            }];
            
            [pageViews addObject:_scrollView3];
        }else if (i == 3){
            
            _cursor.rootScrollView.bounces = NO;
            
            _scrollView4 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height / 2)];
            
            _scrollView4.delegate = self;
            
            _newProjecteQualityTiaoKuanView = [[JSEIMPNewProjecteQualityTiaoKuanView alloc] init];
            
            [_scrollView4 addSubview:_newProjecteQualityTiaoKuanView];
            
            [_newProjecteQualityTiaoKuanView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.edges.mas_equalTo(_scrollView4);
                make.width.mas_equalTo(UIScreenW);
                make.bottom.mas_equalTo(_newProjecteQualityTiaoKuanView.qualityTiaoKuanTextView.mas_bottom).offset(8);
            }];
            
            [pageViews addObject:_scrollView4];
        }else if (i == 4){
            
            _cursor.rootScrollView.bounces = NO;
            
            _scrollView5 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height / 2)];
            
            _scrollView5.delegate = self;
            
            _newWenMingShiGongTiaoKuanView = [[JSEIMPNewWenMingShiGongTiaoKuanView alloc] init];
            
            [_scrollView5 addSubview:_newWenMingShiGongTiaoKuanView];
            
            [_newWenMingShiGongTiaoKuanView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.edges.mas_equalTo(_scrollView5);
                make.width.mas_equalTo(UIScreenW);
                make.bottom.mas_equalTo(_newWenMingShiGongTiaoKuanView.shiGongTiaoKuanTextView.mas_bottom).offset(8);
            }];
            
            [pageViews addObject:_scrollView5];
        }else if (i == 5){
            
            _cursor.rootScrollView.bounces = NO;
            
            _scrollView6 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height / 2)];
            
            _scrollView6.delegate = self;
            
            _newOtherTiaoKuanView = [[JSEIMPNewOtherTiaoKuanView alloc] init];
            
            [_scrollView6 addSubview:_newOtherTiaoKuanView];
            
            [_newOtherTiaoKuanView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.edges.mas_equalTo(_scrollView6);
                make.width.mas_equalTo(UIScreenW);
                make.bottom.mas_equalTo(_newOtherTiaoKuanView.otherTiaoKuanTextView.mas_bottom).offset(8);
            }];
            
            [pageViews addObject:_scrollView6];
        }
    }
    
    return pageViews;
}

#pragma mark - 日期按钮点击事件
-(void)clickDateButton:(UIButton *)button{
    
    //    _timeButton.backgroundColor = [UIColor whiteColor];
    
    if (button.tag == 3) {
        
        _qianYueDateButton.selected = YES;
    }else if (button.tag == 4){
    
        _planstartDateButton.selected = YES;
    }else if (button.tag == 5){
    
        _planFinishDateButton.selected = YES;
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
    
    if (_qianYueDateButton.tag == 3 && _qianYueDateButton.selected == YES) {
        
        _qianYueDateButton.selected = NO;
        
    }else if (_planstartDateButton.tag == 4 && _planstartDateButton.selected == YES){
    
        _planstartDateButton.selected = NO;
    }else if (_planFinishDateButton.tag == 5 && _planFinishDateButton.selected == YES){
        
        _planFinishDateButton.selected = NO;
    }
    
    [_backView removeFromSuperview];
    [_cancelView removeFromSuperview];
    [_datePicker removeFromSuperview];
    
    [self chooseTimeButtonDate];
    
}

//计算两个日期之间的天数
-(NSInteger)calDaysFromBegin:(NSDate *)beginDate end:(NSDate *)endDate{
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSTimeInterval time=[endDate timeIntervalSinceDate:beginDate];

    int days=((int)time)/(3600*24);
    
    return (days + 1);
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
    
    if (_qianYueDateButton.tag == 3 && _qianYueDateButton.selected == YES) {
        
        [_qianYueDateButton setTitle:dateString forState:UIControlStateNormal];
    }else if (_planstartDateButton.tag == 4 && _planstartDateButton.selected == YES){
    
        [_planstartDateButton setTitle:dateString forState:UIControlStateNormal];
    }else if (_planFinishDateButton.tag == 5 && _planFinishDateButton.selected == YES){
        
        [_planFinishDateButton setTitle:dateString forState:UIControlStateNormal];
        
        NSInteger days = [self calDaysFromBegin:[dateFormatter dateFromString:_planstartDateButton.titleLabel.text] end:[dateFormatter dateFromString:_planFinishDateButton.titleLabel.text]];
        
        [_heTongGongQiLabel setText:[[@(days) stringValue] stringByAppendingString:@"天"]];
    }
    
}

#pragma mark - <UITextViewDelegate>
-(void)textViewDidChange:(UITextView *)textView{
    
    if (_heTongNameTextView.hasText) {
        
        _heTongNamePlaceLabel.hidden = YES;
    }else if (!_heTongNameTextView.hasText){
        
        _heTongNamePlaceLabel.hidden = NO;
    }
    
}

#pragma mark - UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    _qianYueDateButton.enabled = NO;
    _planstartDateButton.enabled = NO;
    _planFinishDateButton.enabled = NO;
    _jiaFangMenu.mainBtn.enabled = NO;
    _yiFangMenu.mainBtn.enabled = NO;
    
    _cursor.hidden = YES;
    [self scrollViewFrameChange];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    _qianYueDateButton.enabled = YES;
    _planstartDateButton.enabled = YES;
    _planFinishDateButton.enabled = YES;
    _jiaFangMenu.mainBtn.enabled = YES;
    _yiFangMenu.mainBtn.enabled = YES;
    
    _cursor.hidden = NO;
    [self scrollViewFrameRecover];
}

#pragma mark - UITextViewDelegate
-(void)textViewDidBeginEditing:(UITextView *)textView{
    
    _qianYueDateButton.enabled = NO;
    _planstartDateButton.enabled = NO;
    _planFinishDateButton.enabled = NO;
    _jiaFangMenu.mainBtn.enabled = NO;
    _yiFangMenu.mainBtn.enabled = NO;
    
    _cursor.hidden = YES;
    [self scrollViewFrameChange];
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    
    _qianYueDateButton.enabled = YES;
    _planstartDateButton.enabled = YES;
    _planFinishDateButton.enabled = YES;
    _jiaFangMenu.mainBtn.enabled = YES;
    _yiFangMenu.mainBtn.enabled = YES;
    
    _cursor.hidden = NO;
    [self scrollViewFrameRecover];
    
}

#pragma mark - JSEIMPNewChengBaoFanWeiViewDelegate
-(void)changeScrollViewFrame{

    [self cursoriewFrameChange];
}

-(void)recoverScrollViewFrame{

    [self cursoriewFrameRecover];
}

#pragma mark - 滚送视图frame变化
-(void)cursoriewFrameChange{
    
    [_view mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_cursor.mas_bottom).offset(226);
    }];
    
}

-(void)cursoriewFrameRecover{
    
    [_view mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_cursor.mas_bottom).offset(16);
    }];
    
}

#pragma mark - ScrollViewFramebianhua
-(void)scrollViewFrameChange{
    
    [_view mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_wenMingShiGongMoneyTextField.mas_bottom).offset(226);
        
    }];
    
}

-(void)scrollViewFrameRecover{
    
    [_view mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_cursor.mas_bottom).offset(16);
    }];
    
}

#pragma mark - LMJDropdownMenuDelegate
-(void)dropdownMenuWillShow:(LMJDropdownMenu *)menu{
    
    if (menu.tag == 3) {
    
        _jiaFangButton.hidden = NO;
   
        [self labelChangeWithLabel:_label7 Button:_jiaFangButton Label2:_label6];
        [self labelChangeWithLabel:_label8 Button:_yiFangButton Label2:_label7];
    }else if (menu.tag == 4){
    
        _yiFangButton.hidden = NO;
        [self labelChangeWithLabel:_label8 Button:_yiFangButton Label2:_label7];
    }
    
}

-(void)dropdownMenuDidShow:(LMJDropdownMenu *)menu{

    if (menu.tag == 2) {
        
        _jiaFangMenu.mainBtn.enabled = NO;
        _yiFangMenu.mainBtn.enabled = NO;
    }else if (menu.tag == 3) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jiaFang:) name:@"jiaFang" object:nil];
        
    }else if (menu.tag == 4){
    
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(yiFang:) name:@"yiFang" object:nil];

        _jiaFangMenu.mainBtn.enabled = NO;
        
    }

    _cursor.hidden = YES;
    [self viewChange];
}

-(void)dropdownMenuWillHidden:(LMJDropdownMenu *)menu{
    
    if (menu.tag == 1 && menu.mainBtn.titleLabel.text.length > 5) {
        
        _jieGouStyleLabel.text = @"混凝土框剪结构";
        _moneyFromLabel.text = @"自筹";
        _projectAdressLabel.text = @"张家港市杨舍镇东苑路南侧";
        _mianJiLabel.text = @"63,172.00";
        
    }else if (menu.tag == 2){
    
        _jiaFangMenu.mainBtn.enabled = YES;
        _yiFangMenu.mainBtn.enabled = YES;
    }else if (menu.tag == 3) {
        
        if (_jiaFangButton.tag == 1) {
            
            _jiaFangButton.hidden = YES;
            [_jiaFangButton setTitle:@"==供应商/客户==" forState:UIControlStateNormal];
        }
        
        [self labelRecoverWithLabel:_label7  Menu:_jiaFangMenu Label2:_label6];
        [self labelRecoverWithLabel:_label8 Menu:_yiFangMenu Label2:_label7];
        [self changeMenu];
    }else if (menu.tag == 4){
    
        if (_yiFangButton.tag == 2) {
            
            _yiFangButton.hidden = YES;
            [_yiFangButton setTitle:@"==供应商/客户==" forState:UIControlStateNormal];
        }

        [self changeMenu];
        [self labelRecoverWithLabel:_label8 Menu:_yiFangMenu Label2:_label7];
        _jiaFangMenu.mainBtn.enabled = YES;
    }
    
    _cursor.hidden = NO;
    [self viewRecover];

}

-(void)viewChange{

    [_view mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo(UIScreenW);
        make.bottom.mas_equalTo(_wenMingShiGongMoneyTextField.mas_bottom).offset(16);
    }];
}

-(void)viewRecover{

    [_view mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo(UIScreenW);
        make.bottom.mas_equalTo(_cursor.mas_bottom).offset(16);
        
    }];
}

-(void)changeMenu{

    [_heTongJiJiaStyleMenu setFrame:CGRectMake(158, 614, UIScreenW - 174, 30)];
    [_heTongJiJiaStyleMenu.mainBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 3, 0, 10)];
    [_heTongJiJiaStyleMenu.mainBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_heTongJiJiaStyleMenu.mainBtn setTitle:@"请选择计价方式" forState:UIControlStateNormal];
    _heTongJiJiaStyleMenu.mainBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_heTongJiJiaStyleMenu setMenuTitles:@[@"固定总价合同",@"固定单价合同",@"成本加酬金"] rowHeight:40];

}

-(void)labelChangeWithLabel:(UILabel *)label1 Button:(UIButton *)buton Label2:(UILabel *)label2{

    [label1 mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(buton.mas_bottom).offset(16);
        make.left.mas_equalTo(label2.mas_left);
    }];

}

-(void)labelRecoverWithLabel:(UILabel *)label1 Menu:(LMJDropdownMenu *)menu Label2:(UILabel *)label2{

    [label1 mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(menu.mas_bottom).offset(24);
        make.left.mas_equalTo(label2.mas_left);
    }];

}

-(void)jiaFang:(NSNotification *)notification{
    
    [_jiaFangMenu.mainBtn setTitle:notification.object forState:UIControlStateNormal];
    
    [_jiaFangMenu hideDropDown];
    _jiaFangButton.hidden = YES;
    _yiFangMenu.hidden = NO;
    _label7.hidden = NO;
    
}

-(void)yiFang:(NSNotification *)notification{
    
    [_yiFangMenu.mainBtn setTitle:notification.object forState:UIControlStateNormal];
    
    [_yiFangMenu hideDropDown];
    _label8.hidden = NO;
    _qianYueDateButton.hidden = NO;
    //_yiFangButton.hidden = YES;
}

-(void)clickButton:(UIButton *)button{

    [_menuView showAsDrawDownView:button Tag:button.tag];
    
    if (button.tag == 1) {
        
        [_jiaFangMenu hideDropDown];
        _jiaFangButton.hidden = NO;
        _label7.hidden = YES;
        _yiFangMenu.hidden = YES;
        
        //[self labelChange];
    }else if (button.tag == 2){
    
        [_yiFangMenu hideDropDown];
        _yiFangButton.hidden = NO;
        _label8.hidden = YES;
        _qianYueDateButton.hidden = YES;
    }
    
}

-(NSInteger)assciationMenuView:(SkyAssociationMenuView *)asView countForClass:(NSInteger)idx{

    if (idx == 0) {
        
        return 2;
    }else if (idx == 1){
    
        return 6;
    }

    return 3;
}

-(NSString *)assciationMenuView:(SkyAssociationMenuView *)asView titleForClass_1:(NSInteger)idx_1{

    return _titlesMArray1[idx_1];

}

-(NSString *)assciationMenuView:(SkyAssociationMenuView *)asView titleForClass_1:(NSInteger)idx_1 class_2:(NSInteger)idx_2{

    if (idx_1 == 0) {
        
        return _gongYingShangMArray[idx_2];
    }else if (idx_1 == 1){
    
        return _keHuMArray[idx_2];
    }
    
    return nil;
}

-(NSString *)assciationMenuView:(SkyAssociationMenuView *)asView titleForClass_1:(NSInteger)idx_1 class_2:(NSInteger)idx_2 class_3:(NSInteger)idx_3{

    if (idx_1 == 0) {
        
        return [_gongYingShangMArray[idx_2] stringByAppendingFormat:@"%zd",idx_3 + 1];
        
    }else if (idx_1 == 1){
    
        return [_keHuMArray[idx_2] stringByAppendingFormat:@"%zd",idx_3 + 1];
    
    }
    
    return @"其他公司";
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
    dropDownMenu.mainBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [dropDownMenu setMenuTitles:titles rowHeight:40];
    
    [_view addSubview:dropDownMenu];
    
    return dropDownMenu;
    
}

-(UITextField *)setupTextFieldWithPlacedText:(NSString *)placedText{
    
    UITextField *textField = [[UITextField alloc] init];
    
    textField.layer.borderWidth = 0.5;
    textField.delegate = self;
    textField.textAlignment = NSTextAlignmentCenter;
    textField.placeholder = placedText;
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

-(UIButton *)setButtonWithColor:(UIColor *)color Title:(NSString *)title Action:(SEL)action Tag:(NSInteger)tag{
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    _button.tag = tag;
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
