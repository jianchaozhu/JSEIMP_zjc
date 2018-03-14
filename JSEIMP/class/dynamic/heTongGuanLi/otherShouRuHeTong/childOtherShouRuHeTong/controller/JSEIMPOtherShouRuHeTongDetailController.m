//
//  JSEIMPOtherShouRuHeTongDetailController.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/3/12.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPOtherShouRuHeTongDetailController.h"
#import "HACursor.h"
#import <Masonry.h>
#import "JSEIMPNetWorking.h"
#import "UIView+Extension.h"
#import "JSEIMPContentAndRangeView.h"
#import "JSEIMPFuKuanTiaoKuanView.h"
#import "JSEIMPOtherTiaoKuanView.h"
#import "JSEIMPFuJianView.h"

#define UIScreenW [UIScreen mainScreen].bounds.size.width
#define UIScreenH [UIScreen mainScreen].bounds.size.height

@interface JSEIMPOtherShouRuHeTongDetailController ()<UIDocumentInteractionControllerDelegate>

@property(nonatomic,strong)NSMutableArray *titles;

@property(nonatomic,strong)NSString *filePath;

@property(nonatomic,strong)NSString *exisFilePath;
//合同编号
@property(nonatomic,strong)NSString *contractCode;

@property(nonatomic,strong)NSString *projectName;

@property(nonatomic,strong)NSString *jiaFangName;

@property(nonatomic,strong)NSString *yiFangName;

@property(nonatomic,strong)NSString *diSanFangName;

@property(nonatomic,strong)NSString *contractType;

@property(nonatomic,strong)NSString *amount;

@property(nonatomic,strong)NSString *qianYueDate;

@property(nonatomic,strong)NSString *creator;

@property(nonatomic,strong)NSString *contentAndRange;

@property(nonatomic,strong)NSString *fuKuanTiaoKuan;

@property(nonatomic,strong)NSString *otherTiaoKuan;
//附件类型
@property(nonatomic,strong)NSMutableArray *fileTypeMArray;
//附件名称
@property(nonatomic,strong)NSMutableArray *fileNameMArray;
//附件路径
@property(nonatomic,strong)NSMutableArray *filePathMArray;

@end

@implementation JSEIMPOtherShouRuHeTongDetailController{
    
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
    
    UILabel *_diSanFangLabel;
    
    UILabel *_label7;
    
    UILabel *_heTongStyleLabel;
    
    UILabel *_label8;
    
    UILabel *_heTongValueLabel;
    
    UILabel *_label9;
    
    UILabel *_qianYueDateLabel;
    
    UILabel *_label10;
    
    UILabel *_faQiRenLabel;
    
    UILabel *_label11;
    
    UILabel *_heTongStateLabel;
    
    HACursor *_cursor;
    
    UIScrollView *_scrollView1;
    
    UIScrollView *_scrollView2;
    
    UIScrollView *_scrollView3;
    
    JSEIMPContentAndRangeView *_contentAndRangeView;
    
    JSEIMPFuKuanTiaoKuanView *_fuKuanTiaoKuanView;
    
    JSEIMPOtherTiaoKuanView *_otherTiaoKuanView;
    
    JSEIMPFuJianView *_fuJianView;
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
    
    [JSEIMPNetWorking getOtherShouRuHeTongDetailWithContractId:_contractId OnSuccess:^(NSString *contractCode,NSString *projectName,NSString *jiaFangName,NSString *yiFangName,NSString *diSanFangName,NSString *contractType,NSString *amount,NSString *finalQianYueDate,NSString *creator,NSString *contentAndRange,NSString *fuKuanTiaoKuan,NSString *otherTiaoKuan,NSMutableArray *fileTypeMArray,NSMutableArray *fileNameMArray,NSMutableArray *filePathMArray){
        
        _contractCode = contractCode.copy;
        _projectName = projectName.copy;
        _jiaFangName = jiaFangName.copy;
        _yiFangName = yiFangName.copy;
        _diSanFangName = diSanFangName.copy;
        _contractType = contractType.copy;
        _amount = amount.copy;
        _qianYueDate = finalQianYueDate.copy;
        _creator = creator.copy;
        _contentAndRange = contentAndRange.copy;
        _fuKuanTiaoKuan = fuKuanTiaoKuan.copy;
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
    _diSanFangLabel = [self setupLabelWithText:_diSanFangName TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _diSanFangLabel.textAlignment = NSTextAlignmentRight;
    _diSanFangLabel.numberOfLines = 0;
    
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
    
    [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_yiFangLabel.mas_bottom).offset(16);
        make.left.mas_equalTo(_label5);
        make.width.mas_equalTo(62);
        
    }];
    [_diSanFangLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
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
        make.right.mas_equalTo(_diSanFangLabel.mas_right);
        
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
        make.width.mas_equalTo(62);
    }];
    [_faQiRenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label10.mas_right).offset(16);
        make.centerY.mas_equalTo(_label10.mas_centerY);
        make.right.mas_equalTo(_qianYueDateLabel.mas_right);
    }];

    [_label11 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label10.mas_bottom).offset(16);
        make.left.mas_equalTo(_label9.mas_left);
        make.right.mas_equalTo(_label9.mas_right);
    }];
    [_heTongStateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label11.mas_right).offset(16);
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
    
    _titles = [NSMutableArray arrayWithObjects:@"内容及范围",@"付款条款",@"其他条款",@"附件", nil];
    
    _cursor = [[HACursor alloc]init];
    //    _cursor.backgroundColor = [UIColor colorWithRed:56.0 / 255.0 green:135.0 / 255.0 blue:250.0 / 255.0 alpha:1];
    _cursor.backgroundColor = [UIColor lightGrayColor];
    
    if (_heTongNameLabel.text.length > 26 && _heTongNameLabel.text.length < 39) {
        _cursor.frame = CGRectMake(0, 620, self.view.width, 45);
    }else if(_heTongNameLabel.text.length > 13 && _heTongNameLabel.text.length <= 26 && _projectNameLabel.text.length > 26 && _projectNameLabel.text.length < 39){
        _cursor.frame = CGRectMake(0, 580, self.view.width, 45);
    }else if (_heTongNameLabel.text.length <= 13 && _projectNameLabel.text.length > 26 && _projectNameLabel.text.length < 39){
        _cursor.frame = CGRectMake(0, 450, self.view.width, 45);
    }else if (_heTongNameLabel.text.length <= 13){
        _cursor.frame = CGRectMake(0, 400, self.view.width, 45);
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
            _contentAndRangeView = [[JSEIMPContentAndRangeView alloc] init];
            //发送通知
            [[NSNotificationCenter defaultCenter] postNotificationName:@"contentAndRange" object:_contentAndRange];
            [_scrollView1 addSubview:_contentAndRangeView];

            [_contentAndRangeView mas_makeConstraints:^(MASConstraintMaker *make) {

                make.edges.mas_equalTo(_scrollView1);
                make.width.mas_equalTo(UIScreenW);
                make.bottom.mas_equalTo(_contentAndRangeView.contentAndRangeLabel.mas_bottom).offset(16);
            }];
            [pageViews addObject:_scrollView1];
        }else if (i == 1){
            
            _cursor.rootScrollView.bounces = NO;
            _scrollView2 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height / 2)];
            _fuKuanTiaoKuanView = [[JSEIMPFuKuanTiaoKuanView alloc] init];
            //发送通知
            [[NSNotificationCenter defaultCenter] postNotificationName:@"fuKuanTiaoKuan" object:_fuKuanTiaoKuan];
            [_scrollView2 addSubview:_fuKuanTiaoKuanView];
            
            [_fuKuanTiaoKuanView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.edges.mas_equalTo(_scrollView2);
                make.width.mas_equalTo(UIScreenW);
                make.bottom.mas_equalTo(_fuKuanTiaoKuanView.fuKuanTiaoKuanLabel.mas_bottom).offset(16);
            }];
            [pageViews addObject:_scrollView2];
        }else if (i == 2){
            
            _cursor.rootScrollView.bounces = NO;
            _scrollView3 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height / 2)];
            _otherTiaoKuanView = [[JSEIMPOtherTiaoKuanView alloc] init];
            //发送通知
            [[NSNotificationCenter defaultCenter] postNotificationName:@"otherTiaoKuan" object:_otherTiaoKuan];
            [_scrollView3 addSubview:_otherTiaoKuanView];
            
            [_otherTiaoKuanView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.edges.mas_equalTo(_scrollView3);
                make.width.mas_equalTo(UIScreenW);
                make.bottom.mas_equalTo(_otherTiaoKuanView.otherTiaoKuanLabel.mas_bottom).offset(16);
            }];
            [pageViews addObject:_scrollView3];
        }else if (i == 3){
            
            _fuJianView = [JSEIMPFuJianView new];
            
            [self postNotification];
            
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(filePath:) name:@"filePath" object:nil];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(exisFilePath:) name:@"exisFilePath" object:nil];
            
            [pageViews addObject:_fuJianView];
        }
    }

    return pageViews;
}

-(void)filePath:(NSNotification *)notification{
    
    _filePath = notification.object;
    
    [self setupLookViewWithPath:_filePath];
    
}

-(void)exisFilePath:(NSNotification *)notification{
    
    _exisFilePath = notification.object;
    
    [self setupLookViewWithPath:_exisFilePath];
    
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

#pragma mark - 发送通知
-(void)postNotification{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"fileNameMArray" object:_fileNameMArray];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"filePathMArray" object:_filePathMArray];
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
