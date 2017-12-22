//
//  JSEIMPCaiGouHeTongDetailController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/12/20.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPCaiGouHeTongDetailController.h"
#import "JSEIMPNetWorking.h"
#import "UIView+Extension.h"
#import "JSEIMPQualityBiaoZhunView.h"
#import "JSEIMPJiaoFuPlaceView.h"
#import "JSEIMPFuKuanTiaoKuanView.h"
#import "JSEIMPYanShouMethodView.h"
#import "HACursor.h"
#import <Masonry.h>

#define UIScreenW [UIScreen mainScreen].bounds.size.width
#define UIScreenH [UIScreen mainScreen].bounds.size.height

@interface JSEIMPCaiGouHeTongDetailController ()<UIDocumentInteractionControllerDelegate>

@property(nonatomic,strong)NSMutableArray *titles;

@property(nonatomic,strong)NSString *filePath;

@property(nonatomic,strong)NSString *exisFilePath;
//合同编号
@property(nonatomic,strong)NSString *contractCode;

@property(nonatomic,strong)NSString *projectName;

@property(nonatomic,strong)NSString *jiaFangName;

@property(nonatomic,strong)NSString *yiFangName;

@property(nonatomic,strong)NSString *diSanFangName;
//合同类型
@property(nonatomic,strong)NSString *contractType;
//合同总价
@property(nonatomic,strong)NSString *amount;

@property(nonatomic,strong)NSString *qianYueDate;

@property(nonatomic,strong)NSString *creator;
//质量标准
@property(nonatomic,strong)NSString *qualityBiaoZhun;
//交付地点
@property(nonatomic,strong)NSString *jiaoFuPlace;
//付款条款
@property(nonatomic,strong)NSString *fuKuanTiaoKuan;
//验收方式
@property(nonatomic,strong)NSString *yanShouMethod;
//其他条款
@property(nonatomic,strong)NSString *otherTiaoKuan;
//附件类型
@property(nonatomic,strong)NSMutableArray *fileTypeMArray;
//附件名称
@property(nonatomic,strong)NSMutableArray *fileNameMArray;
//附件路径
@property(nonatomic,strong)NSMutableArray *filePathMArray;

@end

@implementation JSEIMPCaiGouHeTongDetailController{
    
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
    
    UILabel *_diSanFangNameLabel;
    
    UILabel *_label7;
    
    UILabel *_heTongStyleLabel;
    
    UILabel *_label8;
    
    UILabel *_heTongValueLabel;
    
    UILabel *_label9;
    
    UILabel *_qianYueDateLabel;
    
    UILabel *_label10;
    
    UILabel *_faQiRenLabel;
    
    UILabel *_label11;
    
    UILabel *_heTongStatusLabel;
    
    HACursor *_cursor;
    
    UIScrollView *_scrollView1;
    
    UIScrollView *_scrollView2;
    
    UIScrollView *_scrollView3;
    
    UIScrollView *_scrollView4;
    
    JSEIMPQualityBiaoZhunView *_qualityBiaoZhunView;
    
    JSEIMPJiaoFuPlaceView *_jiaoFuPlaceView;
    
    JSEIMPFuKuanTiaoKuanView *_fuKuanTiaoKuanView;
    
    JSEIMPYanShouMethodView *_yanShouMethodView;
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
    [JSEIMPNetWorking getCaiGouHeTongDetailWithContractId:_contractId OnSuccess:^(NSString *contractCode,NSString *projectName,NSString *jiaFangName,NSString *yiFangName,NSString *diSanFangName,NSString *contractType,NSString *amount,NSString *qianYueDate,NSString *creator,NSString *qualityBiaoZhun,NSString *jiaoFuPlace,NSString *fuKuanTiaoKuan,NSString *yanShouMethod,NSString *otherTiaoKuan,NSMutableArray *fileTypeMArray,NSMutableArray *fileNameMArray,NSMutableArray *filePathMArray){
        
        _contractCode = contractCode.copy;
        _projectName = projectName.copy;
        _jiaFangName = jiaFangName.copy;
        _yiFangName = yiFangName.copy;
        _diSanFangName = diSanFangName.copy;
        _contractType = contractType.copy;
        _amount = amount.copy;
        _qianYueDate = qianYueDate.copy;
        _creator = creator.copy;
        _qualityBiaoZhun = qualityBiaoZhun.copy;
        _jiaoFuPlace = jiaoFuPlace.copy;
        _fuKuanTiaoKuan = fuKuanTiaoKuan.copy;
        _yanShouMethod = yanShouMethod.copy;
        _otherTiaoKuan = otherTiaoKuan.copy;
        _fileTypeMArray = fileTypeMArray.copy;
        _fileNameMArray = fileNameMArray.copy;
        _filePathMArray = filePathMArray.copy;
        
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
    
    _label6 = [self setupLabelWithText:@"第三方" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _diSanFangNameLabel = [self setupLabelWithText:_diSanFangName TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _diSanFangNameLabel.textAlignment = NSTextAlignmentRight;
    _diSanFangNameLabel.numberOfLines = 0;
    
    _label7 = [self setupLabelWithText:@"合同类型" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _heTongStyleLabel = [self setupLabelWithText:_contractType TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _heTongStyleLabel.textAlignment = NSTextAlignmentRight;
    _heTongStyleLabel.numberOfLines = 0;
    
    _label8 = [self setupLabelWithText:@"合同总价(元)" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _heTongValueLabel = [self setupLabelWithText:_amount TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _heTongValueLabel.textAlignment = NSTextAlignmentRight;
    
    _label9 = [self setupLabelWithText:@"签约日期" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _qianYueDateLabel = [self setupLabelWithText:_qianYueDate TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _qianYueDateLabel.textAlignment = NSTextAlignmentRight;
    
    _label10 = [self setupLabelWithText:@"发起人" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _faQiRenLabel = [self setupLabelWithText:_creator TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _faQiRenLabel.textAlignment = NSTextAlignmentRight;
    
    _label11 = [self setupLabelWithText:@"合同状态" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _heTongStatusLabel = [self setupLabelWithText:_status TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _heTongStatusLabel.textAlignment = NSTextAlignmentRight;
    if ([_heTongStatusLabel.text isEqualToString:@"待审"] || [_heTongStatusLabel.text    isEqualToString:@"审批中"]) {
        _heTongStatusLabel.textColor = [UIColor orangeColor];
    }else if ([_heTongStatusLabel.text isEqualToString:@"已审"]){
        _heTongStatusLabel.textColor = [UIColor greenColor];
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
    
    [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_yiFangLabel.mas_bottom).offset(16);
        make.left.mas_equalTo(_label5);
        make.width.mas_equalTo(62);
        
    }];
    [_diSanFangNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label6.mas_right).offset(16);
        make.top.mas_equalTo(_label6.mas_top);
        make.right.mas_equalTo(_yiFangLabel.mas_right);
        
    }];
    
    [_label7 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label6.mas_bottom).offset(16);
        make.left.mas_equalTo(_label6);
        make.right.mas_equalTo(_label3.mas_right);
        
    }];
    [_heTongStyleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_heTongNameLabel.mas_left);
        make.centerY.mas_equalTo(_label7.mas_centerY);
        make.right.mas_equalTo(_diSanFangNameLabel.mas_right);
        
    }];
    
    [_label8 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label7.mas_bottom).offset(16);
        make.left.mas_equalTo(_label7);
        make.width.mas_equalTo(116);
        
    }];
    [_heTongValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label8.mas_right).offset(16);
        make.centerY.mas_equalTo(_label8.mas_centerY);
        make.right.mas_equalTo(_heTongStyleLabel.mas_right);
        
    }];
    
    [_label9 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label8.mas_bottom).offset(16);
        make.left.mas_equalTo(_label8);
    }];
    [_qianYueDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_heTongStyleLabel.mas_left);
        make.centerY.mas_equalTo(_label9.mas_centerY);
        make.right.mas_equalTo(_heTongValueLabel.mas_right);
    }];
    
    [_label10 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label9.mas_bottom).offset(16);
        make.left.mas_equalTo(_label9);
        make.right.mas_equalTo(_label6.mas_right);
    }];
    [_faQiRenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label10.mas_right).offset(16);
        make.centerY.mas_equalTo(_label10.mas_centerY);
        make.right.mas_equalTo(_qianYueDateLabel.mas_right);
        
    }];
    
    [_label11 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label10.mas_bottom).offset(16);
        make.left.mas_equalTo(_label10);
        make.right.mas_equalTo(_label9.mas_right);
    }];
    [_heTongStatusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_qianYueDateLabel.mas_left);
        make.centerY.mas_equalTo(_label11.mas_centerY);
        make.right.mas_equalTo(_faQiRenLabel.mas_right);
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
    
    _titles = [NSMutableArray arrayWithObjects:@"质量标准",@"交付地点",@"支付条款",@"验收方式", nil];
    
    _cursor = [[HACursor alloc]init];
    //    _cursor.backgroundColor = [UIColor colorWithRed:56.0 / 255.0 green:135.0 / 255.0 blue:250.0 / 255.0 alpha:1];
    _cursor.backgroundColor = [UIColor lightGrayColor];
    
    if (_heTongNameLabel.text.length > 26 && _heTongNameLabel.text.length < 39) {
        _cursor.frame = CGRectMake(0, 510, self.view.width, 45);
    }else if(_heTongNameLabel.text.length > 13 && _heTongNameLabel.text.length <= 26 && _projectNameLabel.text.length > 26 && _projectNameLabel.text.length < 39){
        _cursor.frame = CGRectMake(0, 470, self.view.width, 45);
    }else if (_heTongNameLabel.text.length <= 13 && _projectNameLabel.text.length > 26 && _projectNameLabel.text.length < 39){
        _cursor.frame = CGRectMake(0, 510, self.view.width, 45);
    }else if (_heTongNameLabel.text.length <= 13){
        _cursor.frame = CGRectMake(0, 440, self.view.width, 45);
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
            _qualityBiaoZhunView = [[JSEIMPQualityBiaoZhunView alloc] init];
            _qualityBiaoZhunView.label1.text = @"质量标准";
            //发送通知
            [[NSNotificationCenter defaultCenter] postNotificationName:@"qualityBiaoZhun" object:_qualityBiaoZhun];
            
            [_scrollView1 addSubview:_qualityBiaoZhunView];
            
            [_qualityBiaoZhunView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.edges.mas_equalTo(_scrollView1);
                make.width.mas_equalTo(UIScreenW);
                make.bottom.mas_equalTo(_qualityBiaoZhunView.qualityBiaoZhunLabel.mas_bottom).offset(16);
            }];
            [pageViews addObject:_scrollView1];
        }else if (i == 1){
            
            _cursor.rootScrollView.bounces = NO;
            _scrollView2 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height / 2)];
            _jiaoFuPlaceView = [[JSEIMPJiaoFuPlaceView alloc] init];
            //发送通知
            [[NSNotificationCenter defaultCenter] postNotificationName:@"jiaoFuPlace" object:_jiaoFuPlace];
            
            [_scrollView2 addSubview:_jiaoFuPlaceView];
            
            [_jiaoFuPlaceView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.edges.mas_equalTo(_scrollView2);
                make.width.mas_equalTo(UIScreenW);
                make.bottom.mas_equalTo(_jiaoFuPlaceView.jiaoFuPlaceLabel.mas_bottom).offset(16);
            }];
            [pageViews addObject:_scrollView2];
        }else if (i == 2){
            
            _cursor.rootScrollView.bounces = NO;
            _scrollView3 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height / 2)];
            _fuKuanTiaoKuanView = [[JSEIMPFuKuanTiaoKuanView alloc] init];
            _fuKuanTiaoKuanView.label1.text = @"支付条款";
            //发送通知
            [[NSNotificationCenter defaultCenter] postNotificationName:@"fuKuanTiaoKuan" object:_fuKuanTiaoKuan];
            
            [_scrollView3 addSubview:_fuKuanTiaoKuanView];
            
            [_fuKuanTiaoKuanView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.edges.mas_equalTo(_scrollView3);
                make.width.mas_equalTo(UIScreenW);
                make.bottom.mas_equalTo(_fuKuanTiaoKuanView.fuKuanTiaoKuanLabel.mas_bottom).offset(16);
            }];
            [pageViews addObject:_scrollView3];
        }else if (i == 3){
            
            _cursor.rootScrollView.bounces = NO;
            _scrollView4 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height / 2)];
            _yanShouMethodView = [[JSEIMPYanShouMethodView alloc] init];
            //发送通知
            [[NSNotificationCenter defaultCenter] postNotificationName:@"yanShouMethod" object:_yanShouMethod];
            
            [_scrollView4 addSubview:_yanShouMethodView];
            
            [_yanShouMethodView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.edges.mas_equalTo(_scrollView4);
                make.width.mas_equalTo(UIScreenW);
                make.bottom.mas_equalTo(_yanShouMethodView.yanShouMethodLabel.mas_bottom).offset(16);
            }];
            [pageViews addObject:_scrollView4];
        }
//        else if (i == 1){
//
//            _cursor.rootScrollView.bounces = NO;
//            _scrollView2 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height / 2)];
//            _scrollView2.scrollEnabled = YES;
//            _calculateMethodView = [[JSEIMPCalculateMethodView alloc] init];
//            //发送通知
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"calculateMethod" object:_calculateMethod];
//
//            [_scrollView2 addSubview:_calculateMethodView];
//
//            [_calculateMethodView mas_makeConstraints:^(MASConstraintMaker *make) {
//
//                make.edges.mas_equalTo(_scrollView2);
//                make.width.mas_equalTo(UIScreenW);
//                make.bottom.mas_equalTo(_calculateMethodView.calculateMethodLabel.mas_bottom).offset(16);
//            }];
//            [pageViews addObject:_scrollView2];
//        }else if (i == 2){
//
//            _cursor.rootScrollView.bounces = NO;
//            _scrollView3 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height / 2)];
//            _qualityBiaoZhunView = [[JSEIMPQualityBiaoZhunView alloc] init];
//            //发送通知
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"qualityBiaoZhun" object:_qualityBiaoZhun];
//
//            [_scrollView3 addSubview:_qualityBiaoZhunView];
//
//            [_qualityBiaoZhunView mas_makeConstraints:^(MASConstraintMaker *make) {
//
//                make.edges.mas_equalTo(_scrollView3);
//                make.width.mas_equalTo(UIScreenW);
//                make.bottom.mas_equalTo(_qualityBiaoZhunView.qualityBiaoZhunLabel.mas_bottom).offset(16);
//            }];
//            [pageViews addObject:_scrollView3];
//        }else if (i == 3){
//
//            _cursor.rootScrollView.bounces = NO;
//            _scrollView4 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height / 2)];
//            _wenMingShiGongView = [[JSEIMPWenMingShiGongView alloc] init];
//            //发送通知
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"wenMingShiGong" object:_wenMingShiGong];
//
//            [_scrollView4 addSubview:_wenMingShiGongView];
//
//            [_wenMingShiGongView mas_makeConstraints:^(MASConstraintMaker *make) {
//
//                make.edges.mas_equalTo(_scrollView4);
//                make.width.mas_equalTo(UIScreenW);
//                make.bottom.mas_equalTo(_wenMingShiGongView.wenMingShiGongLabel.mas_bottom).offset(16);
//            }];
//            [pageViews addObject:_scrollView4];
//        }else if (i == 4){
//
//            _cursor.rootScrollView.bounces = NO;
//            _scrollView5 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height / 2)];
//            _fuKuanTiaoKuanView = [[JSEIMPFuKuanTiaoKuanView alloc] init];
//            //发送通知
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"fuKuanTiaoKuan" object:_fuKuanTiaoKuan];
//
//            [_scrollView5 addSubview:_fuKuanTiaoKuanView];
//
//            [_fuKuanTiaoKuanView mas_makeConstraints:^(MASConstraintMaker *make) {
//
//                make.edges.mas_equalTo(_scrollView5);
//                make.width.mas_equalTo(UIScreenW);
//                make.bottom.mas_equalTo(_fuKuanTiaoKuanView.fuKuanTiaoKuanLabel.mas_bottom).offset(16);
//            }];
//            [pageViews addObject:_scrollView5];
//        }else if (i == 5){
//
//            _cursor.rootScrollView.bounces = NO;
//            _scrollView6 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height / 2)];
//            _jiaoFuTuiHuanView = [[JSEIMPJiaoFuTuiHuanView alloc] init];
//            //发送通知
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"jiaoFuTuiHuan" object:_jiaoFuTuiHuan];
//
//            [_scrollView6 addSubview:_jiaoFuTuiHuanView];
//
//            [_jiaoFuTuiHuanView mas_makeConstraints:^(MASConstraintMaker *make) {
//
//                make.edges.mas_equalTo(_scrollView6);
//                make.width.mas_equalTo(UIScreenW);
//                make.bottom.mas_equalTo(_jiaoFuTuiHuanView.jiaoFuTuiHuanLabel.mas_bottom).offset(16);
//            }];
//            [pageViews addObject:_scrollView6];
//        }else if (i == 6){
//
//            _cursor.rootScrollView.bounces = NO;
//            _scrollView7 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height / 2)];
//            _otherTiaoKuanView = [[JSEIMPOtherTiaoKuanView alloc] init];
//            //发送通知
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"otherTiaoKuan" object:_otherTiaoKuan];
//
//            [_scrollView7 addSubview:_otherTiaoKuanView];
//
//            [_otherTiaoKuanView mas_makeConstraints:^(MASConstraintMaker *make) {
//
//                make.edges.mas_equalTo(_scrollView7);
//                make.width.mas_equalTo(UIScreenW);
//                make.bottom.mas_equalTo(_otherTiaoKuanView.otherTiaoKuanLabel.mas_bottom).offset(16);
//            }];
//            [pageViews addObject:_scrollView7];
//        }else if(i == 7){
//
//            _fuJianView = [JSEIMPFuJianView new];
//
//            [self postNotification];
//
//            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(filePath:) name:@"filePath" object:nil];
//            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(exisFilePath:) name:@"exisFilePath" object:nil];
//
//            [pageViews addObject:_fuJianView];
//
//        }
    }

    return pageViews;
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
