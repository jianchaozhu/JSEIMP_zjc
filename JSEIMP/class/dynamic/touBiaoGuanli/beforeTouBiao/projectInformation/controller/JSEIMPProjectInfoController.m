//
//  JSEIMPProjectInfoController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/10/9.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPProjectInfoController.h"
#import "HACursor.h"
#import "UIView+Extension.h"
#import "JSEIMPTouBiaoDetailController.h"
#import <Masonry.h>
#import "HATestView.h"
#import "JSEIMPProjectInfoView.h"
#import "JSEIMPTouBiaoGuanLiEditView.h"
#import "JSEIMPWriteZhongBiaoNoteController.h"
#import "JSEIMPNetWorking.h"

#define UIScreenW [UIScreen mainScreen].bounds.size.width
#define UIScreenH [UIScreen mainScreen].bounds.size.height

@interface JSEIMPProjectInfoController ()<JSEIMPTouBiaoGuanLiEditViewDelagate>

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) NSMutableArray *pageViews;

@property(nonatomic,strong)NSString *address;
//建设单位
@property(nonatomic,strong)NSString *buildCompany;
//规模
@property(nonatomic,strong)NSString *guiMo;
//资金来源
@property(nonatomic,strong)NSString *moneyFrom;
//招标模式
@property(nonatomic,strong)NSString *zhaoBiaoStyle;
//介绍人
@property(nonatomic,strong)NSString *jieShaoPeople;
//投标人
@property(nonatomic,strong)NSString *touBiaoPeople;
//是否中标
@property(nonatomic,strong)NSString *isZhongBiao;
//说明
@property(nonatomic,strong)NSString *shuoMing;

@end

@implementation JSEIMPProjectInfoController{

    HACursor *_cursor;
    
    UIScrollView *_scrollView1;
    
    JSEIMPProjectInfoView *_projectInfoView;
    
    JSEIMPTouBiaoGuanLiEditView *_touBiaoGuanLiEditView;
    
    UIView *_touchView;
    
    JSEIMPWriteZhongBiaoNoteController *_writeZhongBiaoNoteController;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleViewLabel = [[UILabel alloc] init];
    titleViewLabel.frame = CGRectMake(0, 0, 180, 40);
    titleViewLabel.numberOfLines = 0;
    titleViewLabel.font = [UIFont systemFontOfSize:16];
    titleViewLabel.text = _projectName;
    titleViewLabel.textAlignment = NSTextAlignmentCenter;
    
    self.navigationItem.titleView = titleViewLabel;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
//    //添加右边的按钮
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(clickAddButton)];
//    
//    self.navigationItem.rightBarButtonItem = addButton;
    [self getData];
    
//    [self setupUI];
    
}

//-(void)clickAddButton{
//    
//    //    if (_canInformationPut == YES) {
//    
//    _touchView = [[UIView alloc] init];
//    
//    //子视图透明度不随父视图透明度改变
//    _touchView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.0];
//    
//    [self.view addSubview:_touchView];
//    
//    _touBiaoGuanLiEditView = [[[NSBundle mainBundle] loadNibNamed:@"JSEIMPTouBiaoGuanLiEditView" owner:nil options:nil] lastObject];
//    
//    _touBiaoGuanLiEditView.backgroundColor = [UIColor colorWithRed:235.0 / 255.0 green:235.0 / 255.0 blue:241.0 / 255.0 alpha:1];
//    _touBiaoGuanLiEditView.layer.cornerRadius = 5;
//    _touBiaoGuanLiEditView.clipsToBounds = YES;
//    _touBiaoGuanLiEditView.delegate = self;
//    
//    [_touchView insertSubview:_touBiaoGuanLiEditView atIndex:0];
//    
//    [_touchView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.top.left.bottom.right.mas_equalTo(self.view);
//        
//    }];
//    
//    [_touBiaoGuanLiEditView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.top.mas_equalTo(self.navigationController.navigationBar.mas_bottom);
//        make.right.mas_equalTo(self.view.mas_right);
//        make.width.mas_equalTo(160);
//        make.height.mas_equalTo(45);
//        
//    }];
//    
//    //点击手势
//    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchEvent)];
//    
//    [_touchView addGestureRecognizer:tapGestureRecognizer];
//    
//    //    }
//    //    else if (_canInformationPut == NO){
//    //
//    //        [self setupAlertLabelWithTitle:@"对不起，您没有此权限" Rect:CGRectMake(self.view.center.x - 90, self.view.center.y + 100, 180, 50)];
//    //
//    //    }
//    
//}

-(void)touchEvent{
    
    [_touchView removeFromSuperview];
    
}

- (void)returnAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)getData{

    NSLog(@"%@",_projectID);
    
    [JSEIMPNetWorking getTouBiaoDetailListWithProjectID:_projectID OnSuccess:^(NSString *address,NSString *buildCompany,NSString *guiMo,NSString *moneyFrom,NSString *zhaoBiaoStyle,NSString *jieShaoPeople,NSString *touBiaoPeople,NSString *isZhongBiao,NSString *shuoMing){

        _address = address.copy;
        _buildCompany = buildCompany.copy;
        _guiMo = guiMo.copy;
        _moneyFrom = moneyFrom.copy;
        _zhaoBiaoStyle = zhaoBiaoStyle.copy;
        _jieShaoPeople = jieShaoPeople.copy;
        _touBiaoPeople = touBiaoPeople.copy;
        _isZhongBiao = isZhongBiao.copy;
        _shuoMing = shuoMing.copy;
        
        [self setupUI];
        
    } onErrorInfo:nil];

}

-(void)setupUI{

    UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:view];
    
//    self.titles = @[@"项目信息",@"工程考察",@"现场踏勘",@"投标文件摘要",@"标书信息",@"投标保证金",@"履约保证金",@"人员备案情况",@"项目手续办理",@"项目奖项",@"标后分析"];
    
    self.titles = @[@"项目信息"];
    
    _cursor = [[HACursor alloc]init];
    _cursor.backgroundColor = [UIColor colorWithRed:56.0 / 255.0 green:135.0 / 255.0 blue:250.0 / 255.0 alpha:1];
    _cursor.frame = CGRectMake(0, 64, self.view.width, 45);
    _cursor.titles = self.titles;
    _cursor.pageViews = [self createPageViews];
    _cursor.navLineColor = [UIColor blueColor];
    //设置根滚动视图的高度
    _cursor.rootScrollViewHeight = self.view.frame.size.height - 153;
    //默认值是白色
    _cursor.titleNormalColor = [UIColor whiteColor];
    //默认值是白色
    _cursor.titleSelectedColor = [UIColor orangeColor];
    //是否显示排序按钮
    _cursor.showSortbutton = YES;
    //默认的最小值是5，小于默认值的话按默认值设置
    _cursor.minFontSize = 13;
    //默认的最大值是25，小于默认值的话按默认值设置，大于默认值按设置的值处理
    _cursor.maxFontSize = 16;
    //cursor.isGraduallyChangFont = NO;
    //在isGraduallyChangFont为NO的时候，isGraduallyChangColor不会有效果
    //cursor.isGraduallyChangColor = NO;
    [self.view addSubview:_cursor];

}

- (NSMutableArray *)createPageViews{
    
    NSMutableArray *pageViews = [NSMutableArray array];
    
    for (NSInteger i = 0; i < self.titles.count; i++) {
        if(i == 0){
            
            _cursor.rootScrollView.bounces = NO;
            
            _scrollView1 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height / 2)];
            
            _projectInfoView = [[JSEIMPProjectInfoView alloc] init];
            
            [self postNotification];
            
            [_scrollView1 addSubview:_projectInfoView];
            
            [_projectInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.edges.mas_equalTo(_scrollView1);
                make.width.mas_equalTo(UIScreenW);
                make.bottom.mas_equalTo(_projectInfoView.shuoMingLabel.mas_bottom).offset(16);
            }];
            
            [pageViews addObject:_scrollView1];
            
//            _cursor.rootScrollView.bounces = NO;
//            UIScrollView *scrollView = [[UIScrollView alloc] init];
//            JSEIMPTouBiaoDetailController *touBiaoDetailController = [JSEIMPTouBiaoDetailController new];
//            touBiaoDetailController.projectName = _projectTitle;
//            touBiaoDetailController.bianHaoName = _bianHao;
//            touBiaoDetailController.view.frame = scrollView.frame;
//            [scrollView addSubview:touBiaoDetailController.view];
//            [touBiaoDetailController.view mas_makeConstraints:^(MASConstraintMaker *make) {
//                
//                make.edges.mas_equalTo(scrollView);
//                make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
//                make.bottom.mas_equalTo(touBiaoDetailController.label10.mas_bottom).offset(10);
//            }]; 
//            [pageViews addObject:scrollView];
            
        }else{
        
            HATestView *textView = [[HATestView alloc]init];
            //textView.tag = i;
            textView.label.text = self.titles[i];
            [pageViews addObject:textView];
        }
        
    }
    
    return pageViews;

}

#pragma mark - 发送通知
-(void)postNotification{

    [[NSNotificationCenter defaultCenter] postNotificationName:@"bianHao" object:_projectCode];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"projectName" object:_projectName];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"address" object:_address];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"buildCompany" object:_buildCompany];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"guiMo" object:_guiMo];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"moneyFrom" object:_moneyFrom];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"zhaoBiaoStyle" object:_zhaoBiaoStyle];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"jieShaoPeople" object:_jieShaoPeople];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"touBiaoPeople" object:_touBiaoPeople];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"isZhongBiao" object:_isZhongBiao];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"shuoMing" object:_shuoMing];
//    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"number" object:@(_number)];
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"pushStatus" object:_zhongBiaoStatus];

}

#pragma mark - JSEIMPTouBiaoGuanLiEditViewDelagate
-(void)pushToZhongBiaoTongZhiShuController{

    _writeZhongBiaoNoteController = [JSEIMPWriteZhongBiaoNoteController new];
    
    _writeZhongBiaoNoteController.projectName = _projectName;
    
    [self.navigationController pushViewController:_writeZhongBiaoNoteController animated:YES];
    
    [_touchView removeFromSuperview];
    [_touBiaoGuanLiEditView removeFromSuperview];

}

@end
