//
//  JSEIMPZhuanYeFenBaoHeTongDetailController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/12/15.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPZhuanYeFenBaoHeTongDetailController.h"
#import "JSEIMPNetWorking.h"
#import <Masonry.h>
#import "HACursor.h"
#import "HATestView.h"
#import "UIView+Extension.h"
#import "JSEIMPPropjectChengBaoFanWeiView.h"

#define UIScreenW [UIScreen mainScreen].bounds.size.width
#define UIScreenH [UIScreen mainScreen].bounds.size.height

@interface JSEIMPZhuanYeFenBaoHeTongDetailController ()<UIDocumentInteractionControllerDelegate>

@property(nonatomic,strong)NSMutableArray *titles;

@property(nonatomic,strong)NSString *filePath;

@property(nonatomic,strong)NSString *exisFilePath;
//合同编号
@property(nonatomic,strong)NSString *contractCode;

@property(nonatomic,strong)NSString *projectName;

@property(nonatomic,strong)NSString *jiaFangName;

@property(nonatomic,strong)NSString *yiFangName;

@property(nonatomic,strong)NSString *contractType;

@property(nonatomic,strong)NSString *amount;

@property(nonatomic,strong)NSString *qianYueDate;

@property(nonatomic,strong)NSString *startDate;

@property(nonatomic,strong)NSString *endDate;

@property(nonatomic,strong)NSString *days;
//质量保修金
@property(nonatomic,strong)NSString *qualityBaoXiuMoney;

@property(nonatomic,strong)NSString *wenMingShiGongMoney;

@property(nonatomic,strong)NSString *creator;
//承包范围
@property(nonatomic,strong)NSString *chengBaoFanWei;

@end

@implementation JSEIMPZhuanYeFenBaoHeTongDetailController{
    
    UIScrollView *_scrollView;
    
    UIView *_view;
    
    UILabel *_label1;
    
    UILabel *_heTongBianHaoLabel;
    
    UILabel *_label2;
    
    UILabel *_projectNameLabel;
    
    UILabel *_label3;
    
    UILabel *_heTongNameLabel;
    
    UILabel *_label4;
    
    UILabel *_jiaFangLabel;
    
    UILabel *_label5;
    
    UILabel *_yiFangLabel;
    
    UILabel *_label6;
    
    UILabel *_qualityBaoXiuMoneyLabel;
    
    UILabel *_label8;
    
    UILabel *_heTongStyleLabel;
    
    UILabel *_label9;
    
    UILabel *_yuanHeTongValueLabel;
    
    UILabel *_label10;
    
    UILabel *_qianYueDateLabel;
    
    UILabel *_label11;
    
    UILabel *_planStartDateLabel;
    
    UILabel *_label12;
    
    UILabel *_planFinishDateLabel;
    
    UILabel *_label13;
    
    UILabel *_heTongGongQiLabel;
    
    UILabel *_label25;
    
    UILabel *_faQiRenLabel;
    
    UILabel *_label26;
    
    UILabel *_heTongStateLabel;
    
    HACursor *_cursor;
    
    UIScrollView *_scrollView1;
    
    UIScrollView *_scrollView2;
    
    UIScrollView *_scrollView3;
    
    UIScrollView *_scrollView4;
    
    UIScrollView *_scrollView5;
    
    UIScrollView *_scrollView6;
    
    JSEIMPPropjectChengBaoFanWeiView *_propjectChengBaoFanWeiView;
    
    NSInteger number;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleViewLabel = [[UILabel alloc] init];
    titleViewLabel.frame = CGRectMake(0, 0, 180, 40);
    titleViewLabel.numberOfLines = 0;
    titleViewLabel.font = [UIFont systemFontOfSize:16];
    titleViewLabel.text = _contractName;
    titleViewLabel.textAlignment = NSTextAlignmentCenter;
    
    self.navigationItem.titleView = titleViewLabel;
    
    self.navigationController.navigationBarHidden = NO;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
    [self getData];
    
    //监听是否重新进入程序程序.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(someMethod1:) name:UIApplicationDidBecomeActiveNotification object:nil];
    
}

- (void)returnAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 监听后台进入前台
-(void)someMethod1:(NSNotification *)notification{
    
    _scrollView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 44);
}

-(void)getData{
    
    NSLog(@"%@",_contractId);
    [JSEIMPNetWorking getZhuanYeFenBaoHeTongDetailWithContractId:_contractId OnSuccess:^(NSString *contractCode,NSString *projectName,NSString *jiaFangName,NSString *yiFangName,NSString *contractType,NSString *amount,NSString *qianYueDate,NSString *startDate,NSString *endDate,NSString *days,NSString *qualityBaoXiuMoney,NSString *creator,NSString *chengBaoFanWei){
        
        _contractCode = contractCode.copy;
        _projectName = projectName.copy;
        _jiaFangName = jiaFangName.copy;
        _yiFangName = yiFangName.copy;
        _contractType = contractType.copy;
        _amount = amount.copy;
        _qianYueDate = qianYueDate.copy;
        _startDate = startDate.copy;
        _endDate = endDate.copy;
        _days = days.copy;
        _qualityBaoXiuMoney = qualityBaoXiuMoney.copy;
        _creator = creator.copy;
        _chengBaoFanWei = chengBaoFanWei.copy;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self setupUI];
        });
        
    } onErrorInfo:nil];
}

-(void)setupUI{
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 108)];
    
    [self.view addSubview:_scrollView];
    
    _view = [[UIView alloc] initWithFrame:_scrollView.bounds];
    
    _view.backgroundColor = [UIColor whiteColor];
    
    [_scrollView addSubview:_view];
    
    _label1 = [self setupLabelWithText:@"合同编号" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _heTongBianHaoLabel = [self setupLabelWithText:_contractCode TextColor:[UIColor darkGrayColor] Font:[UIFont boldSystemFontOfSize:16]];
    _heTongBianHaoLabel.textAlignment = NSTextAlignmentRight;
    
    _label2 = [self setupLabelWithText:@"项目名称" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _projectNameLabel = [self setupLabelWithText:_projectName TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _projectNameLabel.textAlignment = NSTextAlignmentRight;
    _projectNameLabel.numberOfLines = 0;
    
    _label3 = [self setupLabelWithText:@"合同名称" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _heTongNameLabel = [self setupLabelWithText:_contractName TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _heTongNameLabel.textAlignment = NSTextAlignmentRight;
    _heTongNameLabel.numberOfLines = 0;
    
    _label4 = [self setupLabelWithText:@"甲方" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _jiaFangLabel = [self setupLabelWithText:_jiaFangName TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _jiaFangLabel.textAlignment = NSTextAlignmentRight;
    _jiaFangLabel.numberOfLines = 0;
    
    _label5 = [self setupLabelWithText:@"乙方" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _yiFangLabel = [self setupLabelWithText:_yiFangName TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _yiFangLabel.textAlignment = NSTextAlignmentRight;
    _yiFangLabel.numberOfLines = 0;
    
    _label8 = [self setupLabelWithText:@"合同类型" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _heTongStyleLabel = [self setupLabelWithText:_contractType TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _heTongStyleLabel.textAlignment = NSTextAlignmentRight;
    _heTongStyleLabel.numberOfLines = 0;
    
    _label9 = [self setupLabelWithText:@"合同总价(元)" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _yuanHeTongValueLabel = [self setupLabelWithText:_amount TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _yuanHeTongValueLabel.textAlignment = NSTextAlignmentRight;
    
    _label10 = [self setupLabelWithText:@"签约日期" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _qianYueDateLabel = [self setupLabelWithText:_qianYueDate TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _qianYueDateLabel.textAlignment = NSTextAlignmentRight;
    
    _label6 = [self setupLabelWithText:@"质量保修金" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _qualityBaoXiuMoneyLabel = [self setupLabelWithText:_qualityBaoXiuMoney TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _qualityBaoXiuMoneyLabel.textAlignment = NSTextAlignmentRight;
    
    _label11 = [self setupLabelWithText:@"计划开工日期" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _planStartDateLabel = [self setupLabelWithText:_startDate TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _planStartDateLabel.textAlignment = NSTextAlignmentRight;
    
    _label12 = [self setupLabelWithText:@"计划完成日期" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _planFinishDateLabel = [self setupLabelWithText:_endDate TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _planFinishDateLabel.textAlignment = NSTextAlignmentRight;
    
    _label13 = [self setupLabelWithText:@"合同工期(日历天)" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _heTongGongQiLabel = [self setupLabelWithText:_days TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _heTongGongQiLabel.textAlignment = NSTextAlignmentRight;
    
    _label25 = [self setupLabelWithText:@"发起人" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _faQiRenLabel = [self setupLabelWithText:_creator TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _faQiRenLabel.textAlignment = NSTextAlignmentRight;
    
    _label26 = [self setupLabelWithText:@"合同状态" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _heTongStateLabel = [self setupLabelWithText:_status TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _heTongStateLabel.textAlignment = NSTextAlignmentRight;
    if ([_heTongStateLabel.text isEqualToString:@"待审"] || [_heTongStateLabel.text    isEqualToString:@"审批中"]) {
        _heTongStateLabel.textColor = [UIColor orangeColor];
    }else if ([_heTongStateLabel.text isEqualToString:@"已审"]){
        _heTongStateLabel.textColor = [UIColor greenColor];
    }
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.mas_equalTo(_view).offset(16);
        make.width.mas_equalTo(82);
    }];
    [_heTongBianHaoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label1.mas_right).offset(16);
        make.centerY.mas_equalTo(_label1.mas_centerY);
        make.right.mas_equalTo(_view.mas_right).offset(-16);
        
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label1.mas_bottom).offset(16);
        make.left.mas_equalTo(_label1);
        make.width.mas_equalTo(84);
        
    }];
    [_projectNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label2.mas_right).offset(16);
        make.top.mas_equalTo(_label2.mas_top);
        make.right.mas_equalTo(_heTongBianHaoLabel.mas_right);
        
    }];
    
    if (_projectNameLabel.text.length > 0) {
        
        [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(_projectNameLabel.mas_bottom).offset(16);
            make.left.mas_equalTo(_label2);
            make.right.mas_equalTo(_label1.mas_right);
        }];
    }else{
        
        [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(_label2.mas_bottom).offset(16);
            make.left.mas_equalTo(_label2);
            make.right.mas_equalTo(_label1.mas_right);
        }];
    }
    [_heTongNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_heTongBianHaoLabel.mas_left);
        make.top.mas_equalTo(_label3.mas_top);
        make.right.mas_equalTo(_heTongBianHaoLabel.mas_right);
        
    }];
    
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_heTongNameLabel.mas_bottom).offset(16);
        make.left.mas_equalTo(_label3);
        
    }];
    [_jiaFangLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_projectNameLabel.mas_left);
        make.top.mas_equalTo(_label4.mas_top);
        make.right.mas_equalTo(_projectNameLabel.mas_right);
        
    }];
    
    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_jiaFangLabel.mas_bottom).offset(16);
        make.left.mas_equalTo(_label4);
        
    }];
    [_yiFangLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_jiaFangLabel.mas_left);
        make.top.mas_equalTo(_label5.mas_top);
        make.right.mas_equalTo(_jiaFangLabel.mas_right);
        
    }];
    
    [_label8 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_yiFangLabel.mas_bottom).offset(16);
        make.left.mas_equalTo(_label5);
        make.right.mas_equalTo(_label3.mas_right);
        
    }];
    [_heTongStyleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_yiFangLabel.mas_left);
        make.centerY.mas_equalTo(_label8.mas_centerY);
        make.right.mas_equalTo(_yiFangLabel.mas_right);
        
    }];
    
    [_label9 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label8.mas_bottom).offset(16);
        make.left.mas_equalTo(_label8);
        make.width.mas_equalTo(116);
        
    }];
    [_yuanHeTongValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label9.mas_right).offset(16);
        make.centerY.mas_equalTo(_label9.mas_centerY);
        make.right.mas_equalTo(_heTongStyleLabel.mas_right);
        
    }];
    
    [_label10 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label9.mas_bottom).offset(16);
        make.left.mas_equalTo(_label9);
    }];
    [_qianYueDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_heTongStyleLabel.mas_left);
        make.centerY.mas_equalTo(_label10.mas_centerY);
        make.right.mas_equalTo(_heTongStyleLabel.mas_right);
        
    }];
    
    [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label10.mas_bottom).offset(16);
        make.left.mas_equalTo(_label10);
        make.width.mas_equalTo(110);
    }];
    [_qualityBaoXiuMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label6.mas_right).offset(16);
        make.centerY.mas_equalTo(_label6.mas_centerY);
        make.right.mas_equalTo(_qianYueDateLabel.mas_right);
        
    }];
    
    [_label11 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label6.mas_bottom).offset(16);
        make.left.mas_equalTo(_label6);
        make.width.mas_equalTo(124);
    }];
    [_planStartDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label11.mas_right).offset(16);
        make.centerY.mas_equalTo(_label11.mas_centerY);
        make.right.mas_equalTo(_qualityBaoXiuMoneyLabel.mas_right);
        
    }];
    
    [_label12 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label11.mas_bottom).offset(16);
        make.left.mas_equalTo(_label11);
    }];
    [_planFinishDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_planStartDateLabel.mas_left);
        make.centerY.mas_equalTo(_label12.mas_centerY);
        make.right.mas_equalTo(_planStartDateLabel.mas_right);
        
    }];
    
    [_label13 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label12.mas_bottom).offset(16);
        make.left.mas_equalTo(_label12);
        make.width.mas_equalTo(158);
    }];
    [_heTongGongQiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label13.mas_right).offset(16);
        make.centerY.mas_equalTo(_label13.mas_centerY);
        make.right.mas_equalTo(_planFinishDateLabel.mas_right);
        
    }];
    
    [_label25 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label13.mas_bottom).offset(16);
        make.left.mas_equalTo(_label13);
        make.width.mas_equalTo(62);
    }];
    [_faQiRenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label25.mas_right).offset(16);
        make.centerY.mas_equalTo(_label25.mas_centerY);
        make.right.mas_equalTo(_heTongGongQiLabel.mas_right);
        
    }];
    
    [_label26 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label25.mas_bottom).offset(16);
        make.left.mas_equalTo(_label25);
    }];
    [_heTongStateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_qianYueDateLabel.mas_left);
        make.centerY.mas_equalTo(_label26.mas_centerY);
        make.right.mas_equalTo(_qianYueDateLabel.mas_right);
        
    }];
    
    //创建滚动查看视图
    [self setupCursor];
    
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo(UIScreenW);
        make.bottom.mas_equalTo(_cursor.mas_bottom).offset(16);
        
    }];
    
}

-(void)setupCursor{
    
    _titles = [NSMutableArray arrayWithObjects:@"承包范围", nil];
    
    _cursor = [[HACursor alloc]init];
    //    _cursor.backgroundColor = [UIColor colorWithRed:56.0 / 255.0 green:135.0 / 255.0 blue:250.0 / 255.0 alpha:1];
    _cursor.backgroundColor = [UIColor lightGrayColor];
    
    if (_heTongNameLabel.text.length > 26 && _heTongNameLabel.text.length < 39) {
        _cursor.frame = CGRectMake(0, 645, self.view.width, 45);
    }else if(_heTongNameLabel.text.length > 13 && _heTongNameLabel.text.length <= 26 && _projectNameLabel.text.length > 26 && _projectNameLabel.text.length < 39){
        _cursor.frame = CGRectMake(0, 610, self.view.width, 45);
    }else if (_heTongNameLabel.text.length <= 13 && _projectNameLabel.text.length > 26 && _projectNameLabel.text.length < 39){
        _cursor.frame = CGRectMake(0, 650, self.view.width, 45);
    }else if (_heTongNameLabel.text.length <= 13){
        _cursor.frame = CGRectMake(0, 580, self.view.width, 45);
    }
    
    _cursor.titles = self.titles;
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

- (NSMutableArray *)createPageViews{
    
    NSMutableArray *pageViews = [NSMutableArray array];
    
    for (NSInteger i = 0; i < self.titles.count; i++) {
        
        if (i == 0) {
            
            _cursor.rootScrollView.bounces = NO;
            
            _scrollView1 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height / 2)];
            
            _propjectChengBaoFanWeiView = [[JSEIMPPropjectChengBaoFanWeiView alloc] init];
            
            //发送通知
            [self postNotification];
            
            [_scrollView1 addSubview:_propjectChengBaoFanWeiView];
            
            [_propjectChengBaoFanWeiView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.edges.mas_equalTo(_scrollView1);
                make.width.mas_equalTo(UIScreenW);
                make.bottom.mas_equalTo(_propjectChengBaoFanWeiView.projectContentLabel.mas_bottom).offset(16);
                
            }];
            
            [pageViews addObject:_scrollView1];
            
        }
    }
    
    return pageViews;
}

-(void)postNotification{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"chengBaoFanWei" object:_chengBaoFanWei];
    
}

-(void)setupLookViewWithPath:(NSString *)path{
    
    NSURL *url = [NSURL fileURLWithPath:path];
    
    
    UIDocumentInteractionController *interactionController = [UIDocumentInteractionController interactionControllerWithURL:url];
    
    interactionController.delegate = self;
    //预览有其他软件打开按钮
    [interactionController presentPreviewAnimated:YES];
    
    //    CGRect navRect = self.navigationController.navigationBar.frame;
    //    navRect.size =CGSizeMake(1500.0f,40.0f);
    //
    //    //直接显示包含预览的菜单项
    //    [interactionController presentOptionsMenuFromRect:navRect inView:_view animated:YES];
    
}

-(UIViewController *)documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)controller{
    return self;
}
-(UIView *)documentInteractionControllerViewForPreview:(UIDocumentInteractionController *)controller{
    return self.view;
}
-(CGRect)documentInteractionControllerRectForPreview:(UIDocumentInteractionController *)controller{
    return  self.view.frame;
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
