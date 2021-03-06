//
//  JSEIMPZaiBanItemsDetailController.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/1/23.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPZaiBanItemsDetailController.h"
#import "JSEIMPNetWorking.h"
#import "JSEIMPSuggestController.h"
#import "JSEIMPBackReasonController.h"
#import "JSEIMPWorkDesktopController.h"
#import "JSEIMPChaoSongController.h"
#import "JSEIMPZhuanQianReasonController.h"
#import <Masonry.h>

#define UIScreenW [UIScreen mainScreen].bounds.size.width
#define UIScreenH [UIScreen mainScreen].bounds.size.height

@interface JSEIMPZaiBanItemsDetailController ()
//合同编号
@property(nonatomic,strong)NSString *contractCode;
//甲方
@property(nonatomic,strong)NSString *jiaFangName;
//乙方
@property(nonatomic,strong)NSString *yiFangName;
//合同类型
@property(nonatomic,strong)NSString *contractType;
//合同总价
@property(nonatomic,strong)NSString *amount;
//项目名称
@property(nonatomic,strong)NSString *projectName;
//签约日期
@property(nonatomic,strong)NSString *finalQianYueDate;
//创建人
@property(nonatomic,strong)NSString *creator;
//状态
@property(nonatomic,strong)NSString *status;
//targetActivityId
@property(nonatomic,strong)NSMutableArray *targetActivityIdMArray;
//returnTargetActivityInstanceId
@property(nonatomic,assign)NSInteger returnTargetActivityInstanceId;
//userID
@property(nonatomic,strong)NSMutableArray *userIdMArray;
//canReturnPrevious(可退回上一步)
@property(nonatomic,assign)NSInteger canReturnPrevious;
//canDestroy(可取消)
@property(nonatomic,assign)NSInteger canDestroy;
//canSend(可发送)
@property(nonatomic,assign)NSInteger canSend;
//canExpandCopy(可抄送)
@property(nonatomic,assign)NSInteger canExpandCopy;
//canTransferVerify(可转签)
@property(nonatomic,assign)NSInteger canTransferVerify;
//canExpandVerify(可加签)
@property(nonatomic,assign)NSInteger canExpandVerify;
//下一节点岗位
@property(nonatomic,strong)NSMutableArray *nameMArray;

@end

@implementation JSEIMPZaiBanItemsDetailController{
    
    UIScrollView *_scrollView;
    
    UIView *_view;
    
    UIButton *_button;
    
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
    
    UILabel *_heTongStyleLabel;
    
    UILabel *_label7;
    
    UILabel *_heTongValueLabel;
    
    UILabel *_label8;
    
    UILabel *_qianYueDateLabel;
    
    UILabel *_label9;
    
    UILabel *_creatorLabel;
    
    UILabel *_label10;
    
    UILabel *_statusLabel;
    
    UIButton *_agreeButton;
    
    UIButton *_canReturnPreviousButton;//退回上一步按钮
    
    UIButton *_cancelButton;//取消按钮
    
    UIButton *_canSendButton;//发送按钮
    
    UIButton *_canExpandCopyButton;//抄送按钮
    
    UIButton *_canTransferVerifyButton;//转签按钮
    
    UIButton *_canExpandVerifyButton;//加签按钮
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
    
}

- (void)returnAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)getData{
    NSLog(@"%@",_contractId);
    
    [JSEIMPNetWorking getDaiBanItemDetailWithContractID:_contractId OnSuccess:^(NSString *contractCode,NSString *projectName,NSString *jiaFangName,NSString *yiFangName,NSString *contractType,NSString *amount,NSString *finalQianYueDate,NSString *creator,NSString *status){
        
        _contractCode = contractCode.copy;
        _projectName = projectName.copy;
        _jiaFangName = jiaFangName.copy;
        _yiFangName = yiFangName.copy;
        _contractType = contractType.copy;
        _amount = amount.copy;
        _finalQianYueDate = finalQianYueDate.copy;
        _creator = creator.copy;
        _status = status.copy;
        
        [self isShowButtons];
        
    } onErrorInfo:nil];
}

-(void)setupUI{
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 108)];
    
    [self.view addSubview:_scrollView];
    
    _view = [[UIView alloc] initWithFrame:_scrollView.bounds];
    
    _view.backgroundColor = [UIColor whiteColor];
    
    [_scrollView addSubview:_view];
    
    _agreeButton = [self setButtonWithBackgroundColor:[UIColor colorWithRed:51.0 / 255.0 green:122.0 / 255.0 blue:183.0 / 255.0 alpha:1] Title:@"同意" Tag:1 TitleColor:[UIColor whiteColor] Target:@selector(clickButton:)];
    _canReturnPreviousButton = [self setButtonWithBackgroundColor:[UIColor colorWithRed:51.0 / 255.0 green:122.0 / 255.0 blue:183.0 / 255.0 alpha:1] Title:@"退回上一步" Tag:2 TitleColor:[UIColor whiteColor] Target:@selector(clickButton:)];
    _cancelButton = [self setButtonWithBackgroundColor:[UIColor colorWithRed:51.0 / 255.0 green:122.0 / 255.0 blue:183.0 / 255.0 alpha:1] Title:@"取消" Tag:3 TitleColor:[UIColor whiteColor] Target:@selector(clickButton:)];
    _canSendButton = [self setButtonWithBackgroundColor:[UIColor colorWithRed:51.0 / 255.0 green:122.0 / 255.0 blue:183.0 / 255.0 alpha:1] Title:@"发送" Tag:4 TitleColor:[UIColor whiteColor] Target:@selector(clickButton:)];
    _canExpandCopyButton = [self setButtonWithBackgroundColor:[UIColor colorWithRed:51.0 / 255.0 green:122.0 / 255.0 blue:183.0 / 255.0 alpha:1] Title:@"抄送" Tag:5 TitleColor:[UIColor whiteColor] Target:@selector(clickButton:)];
    _canTransferVerifyButton = [self setButtonWithBackgroundColor:[UIColor colorWithRed:51.0 / 255.0 green:122.0 / 255.0 blue:183.0 / 255.0 alpha:1] Title:@"转签" Tag:6 TitleColor:[UIColor whiteColor] Target:@selector(clickButton:)];
    _canExpandVerifyButton = [self setButtonWithBackgroundColor:[UIColor colorWithRed:51.0 / 255.0 green:122.0 / 255.0 blue:183.0 / 255.0 alpha:1] Title:@"加签" Tag:7 TitleColor:[UIColor whiteColor] Target:@selector(clickButton:)];
    
    _label1 = [self setupLabelWithText:@"合同编号" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _heTongBianHaoLabel = [self setupLabelWithText:_contractCode TextColor:[UIColor darkGrayColor] Font:[UIFont boldSystemFontOfSize:16]];
    _heTongBianHaoLabel.textAlignment = NSTextAlignmentRight;
    
    _label2 = [self setupLabelWithText:@"项目名称" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _projectNameLabel = [self setupLabelWithText:_projectName TextColor:[UIColor darkGrayColor] Font:[UIFont boldSystemFontOfSize:16]];
    _projectNameLabel.textAlignment = NSTextAlignmentRight;
    _projectNameLabel.numberOfLines = 0;
    
    _label3 = [self setupLabelWithText:@"合同名称" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _heTongNameLabel = [self setupLabelWithText:_contractName TextColor:[UIColor darkGrayColor] Font:[UIFont boldSystemFontOfSize:16]];
    _heTongNameLabel.textAlignment = NSTextAlignmentRight;
    _heTongNameLabel.numberOfLines = 0;
    
    _label4 = [self setupLabelWithText:@"甲方" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _jiaFangLabel = [self setupLabelWithText:_jiaFangName TextColor:[UIColor darkGrayColor] Font:[UIFont boldSystemFontOfSize:16]];
    _jiaFangLabel.textAlignment = NSTextAlignmentRight;
    _jiaFangLabel.numberOfLines = 0;
    
    _label5 = [self setupLabelWithText:@"乙方" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _yiFangLabel = [self setupLabelWithText:_yiFangName TextColor:[UIColor darkGrayColor] Font:[UIFont boldSystemFontOfSize:16]];
    _yiFangLabel.textAlignment = NSTextAlignmentRight;
    _yiFangLabel.numberOfLines = 0;
    
    _label6 = [self setupLabelWithText:@"合同类型" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _heTongStyleLabel = [self setupLabelWithText:_contractType TextColor:[UIColor darkGrayColor] Font:[UIFont boldSystemFontOfSize:16]];
    _heTongStyleLabel.textAlignment = NSTextAlignmentRight;
    
    _label7 = [self setupLabelWithText:@"合同总价(元)" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _heTongValueLabel = [self setupLabelWithText:_amount TextColor:[UIColor darkGrayColor] Font:[UIFont boldSystemFontOfSize:16]];
    _heTongValueLabel.textAlignment = NSTextAlignmentRight;
    
    _label8 = [self setupLabelWithText:@"签约日期" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _qianYueDateLabel = [self setupLabelWithText:_finalQianYueDate TextColor:[UIColor darkGrayColor] Font:[UIFont boldSystemFontOfSize:16]];
    _qianYueDateLabel.textAlignment = NSTextAlignmentRight;
    
    _label9 = [self setupLabelWithText:@"创建人" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _creatorLabel = [self setupLabelWithText:_creator TextColor:[UIColor darkGrayColor] Font:[UIFont boldSystemFontOfSize:16]];
    _creatorLabel.textAlignment = NSTextAlignmentRight;
    
    _label10 = [self setupLabelWithText:@"合同状态" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _statusLabel = [self setupLabelWithText:_status TextColor:[UIColor darkGrayColor] Font:[UIFont boldSystemFontOfSize:16]];
    _statusLabel.textAlignment = NSTextAlignmentRight;
    if ([_statusLabel.text isEqualToString:@"待审"] || [_statusLabel.text    isEqualToString:@"审批中"]) {
        _statusLabel.textColor = [UIColor orangeColor];
    }else if ([_statusLabel.text isEqualToString:@"已审"]){
        _statusLabel.textColor = [UIColor greenColor];
    }
    
//    if (_canReturnPrevious == 1) {
//
//        [_beforeButton mas_makeConstraints:^(MASConstraintMaker *make) {
//
//            make.top.mas_equalTo(_view.mas_top).offset(16);
//            make.right.mas_equalTo(_view.mas_right).offset(-16);
//            make.width.mas_equalTo(102);
//            make.height.mas_equalTo(20);
//        }];
//
//        [_agreeButton mas_makeConstraints:^(MASConstraintMaker *make) {
//
//            make.centerY.mas_equalTo(_beforeButton.mas_centerY);
//            make.right.mas_equalTo(_beforeButton.mas_left);
//            make.width.mas_equalTo(50);
//            make.height.mas_equalTo(20);
//        }];
//    }else if (_canReturnPrevious == 0){
//
//        [_agreeButton mas_makeConstraints:^(MASConstraintMaker *make) {
//
//            make.top.mas_equalTo(_view.mas_top).offset(16);
//            make.right.mas_equalTo(_view.mas_right).offset(-16);
//            make.width.mas_equalTo(50);
//            make.height.mas_equalTo(20);
//        }];
//    }
    
    NSLog(@"抄送：%zd,转签：%zd,加签：%zd 取消：%zd,退回上一步：%zd",_canExpandCopy,_canTransferVerify,_canExpandVerify,_canDestroy,_canReturnPrevious);
//    if (_canDestroy == 1 && _canSend == 1 && _canExpandCopy == 1 && _canTransferVerify == 1) {
//        //转签
//        [_canTransferVerifyButton mas_makeConstraints:^(MASConstraintMaker *make) {
//
//            make.top.mas_equalTo(_view.mas_top).offset(16);
//            make.right.mas_equalTo(_view.mas_right).offset(-16);
//            make.width.mas_equalTo(50);
//            make.height.mas_equalTo(20);
//        }];
//        //抄送
//        [_canExpandCopyButton mas_makeConstraints:^(MASConstraintMaker *make) {
//
//            make.top.mas_equalTo(_canTransferVerifyButton.mas_top);
//            make.right.mas_equalTo(_canTransferVerifyButton.mas_left);
//            make.width.mas_equalTo(_canTransferVerifyButton.mas_width);
//            make.height.mas_equalTo(_canTransferVerifyButton.mas_height);
//        }];
//        [_canSendButton mas_makeConstraints:^(MASConstraintMaker *make) {
//
//            make.top.mas_equalTo(_canExpandCopyButton.mas_top);
//            make.right.mas_equalTo(_canExpandCopyButton.mas_left);
//            make.width.mas_equalTo(_canExpandCopyButton.mas_width);
//            make.height.mas_equalTo(_canExpandCopyButton.mas_height);
//        }];
//        [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
//
//            make.top.mas_equalTo(_canSendButton.mas_top);
//            make.right.mas_equalTo(_canSendButton.mas_left);
//            make.width.mas_equalTo(_canSendButton.mas_width);
//            make.height.mas_equalTo(_canSendButton.mas_height);
//        }];
//
//    }else
    if (_canSend == 1 && _canReturnPrevious == 1 && _canExpandCopy == 1){
        //退回上一步按钮
        [_canReturnPreviousButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(_view.mas_top).offset(16);
            make.right.mas_equalTo(_view.mas_right).offset(-16);
            make.width.mas_equalTo(102);
            make.height.mas_equalTo(20);
        }];
        //抄送按钮
        [_canExpandCopyButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.mas_equalTo(_canReturnPreviousButton.mas_centerY);
            make.right.mas_equalTo(_canReturnPreviousButton.mas_left);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(20);
        }];
        //同意按钮
        [_agreeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.mas_equalTo(_canExpandCopyButton.mas_centerY);
            make.right.mas_equalTo(_canExpandCopyButton.mas_left);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(20);
        }];
    }else if (_canSend == 1 && _canReturnPrevious == 0 && _canExpandCopy == 1){
        //抄送按钮
        [_canExpandCopyButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(_view.mas_top).offset(16);
            make.right.mas_equalTo(_view.mas_right).offset(-16);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(20);
        }];
        //同意按钮
        [_agreeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.mas_equalTo(_canExpandCopyButton.mas_centerY);
            make.right.mas_equalTo(_canExpandCopyButton.mas_left);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(20);
        }];
    }
//    else if (_canExpandCopy == 1 && _canTransferVerify == 1 && _canExpandVerify == 1){
//        //转签
//        [_canTransferVerifyButton mas_makeConstraints:^(MASConstraintMaker *make) {
//
//            make.top.mas_equalTo(_view.mas_top).offset(16);
//            make.right.mas_equalTo(_view.mas_right).offset(-16);
//            make.width.mas_equalTo(50);
//            make.height.mas_equalTo(20);
//        }];
//        //抄送
//        [_canExpandCopyButton mas_makeConstraints:^(MASConstraintMaker *make) {
//
//            make.top.mas_equalTo(_canTransferVerifyButton.mas_top);
//            make.right.mas_equalTo(_canTransferVerifyButton.mas_left);
//            make.width.mas_equalTo(_canTransferVerifyButton.mas_width);
//            make.height.mas_equalTo(_canTransferVerifyButton.mas_height);
//        }];
//        //加签
//        [_canExpandVerifyButton mas_makeConstraints:^(MASConstraintMaker *make) {
//
//            make.top.mas_equalTo(_canExpandCopyButton.mas_top);
//            make.right.mas_equalTo(_canExpandCopyButton.mas_left);
//            make.width.mas_equalTo(_canExpandCopyButton.mas_width);
//            make.height.mas_equalTo(_canExpandCopyButton.mas_height);
//        }];
//        [_agreeButton mas_makeConstraints:^(MASConstraintMaker *make) {
//
//            make.top.mas_equalTo(_canExpandVerifyButton.mas_top);
//            make.right.mas_equalTo(_canExpandVerifyButton.mas_left);
//            make.width.mas_equalTo(_canExpandVerifyButton.mas_width);
//            make.height.mas_equalTo(_canExpandVerifyButton.mas_height);
//        }];
//    }
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_view).offset(52);
        make.left.mas_equalTo(_view).offset(16);
        make.width.mas_equalTo(82);
    }];
    [_heTongBianHaoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label1.mas_right).offset(16);
        make.centerY.mas_equalTo(_label1.mas_centerY);
        make.right.mas_equalTo(_view.mas_right).offset(-16);
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label1.mas_bottom).offset(16);
        make.left.mas_equalTo(_label1.mas_left);
        make.right.mas_equalTo(_label1.mas_right);
    }];
    [_projectNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label2.mas_right).offset(16);
        make.top.mas_equalTo(_label2.mas_top);
        make.right.mas_equalTo(_heTongBianHaoLabel.mas_right);
    }];
    
    if (_projectName != nil) {
        
        [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(_projectNameLabel.mas_bottom).offset(16);
            make.left.mas_equalTo(_label2.mas_left);
            make.right.mas_equalTo(_label2.mas_right);
        }];
    }else{
        
        [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(_label2.mas_bottom).offset(16);
            make.left.mas_equalTo(_label2.mas_left);
            make.right.mas_equalTo(_label2.mas_right);
        }];
    }
    [_heTongNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label3.mas_right).offset(16);
        make.top.mas_equalTo(_label3.mas_top);
        make.right.mas_equalTo(_projectNameLabel.mas_right);
    }];
    
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_heTongNameLabel.mas_bottom).offset(16);
        make.left.mas_equalTo(_label3.mas_left);
        make.width.mas_equalTo(42);
    }];
    [_jiaFangLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label4.mas_right).offset(16);
        make.top.mas_equalTo(_label4.mas_top);
        make.right.mas_equalTo(_heTongNameLabel.mas_right);
    }];
    
    if (_jiaFangName != nil) {
        
        [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(_jiaFangLabel.mas_bottom).offset(16);
            make.left.mas_equalTo(_label4.mas_left);
            make.right.mas_equalTo(_label4.mas_right);
        }];
    }else{
        
        [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(_label4.mas_bottom).offset(16);
            make.left.mas_equalTo(_label4.mas_left);
            make.right.mas_equalTo(_label4.mas_right);
        }];
    }
    [_yiFangLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label5.mas_right).offset(16);
        make.top.mas_equalTo(_label5.mas_top);
        make.right.mas_equalTo(_jiaFangLabel.mas_right);
    }];
    
    if (_yiFangName != nil) {
        
        [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(_yiFangLabel.mas_bottom).offset(16);
            make.left.mas_equalTo(_label5.mas_left);
            make.right.mas_equalTo(_label3.mas_right);
        }];
    }else{
        
        [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(_label5.mas_bottom).offset(16);
            make.left.mas_equalTo(_label5.mas_left);
            make.right.mas_equalTo(_label3.mas_right);
        }];
    }
    [_heTongStyleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label6.mas_right).offset(16);
        make.centerY.mas_equalTo(_label6.mas_centerY);
        make.right.mas_equalTo(_yiFangLabel.mas_right);
    }];
    
    [_label7 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label6.mas_bottom).offset(16);
        make.left.mas_equalTo(_label6.mas_left);
        make.width.mas_equalTo(116);
    }];
    [_heTongValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label7.mas_right).offset(16);
        make.centerY.mas_equalTo(_label7.mas_centerY);
        make.right.mas_equalTo(_heTongStyleLabel.mas_right);
    }];
    
    [_label8 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label7.mas_bottom).offset(16);
        make.left.mas_equalTo(_label7.mas_left);
        make.right.mas_equalTo(_label6.mas_right);
    }];
    [_qianYueDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label8.mas_right).offset(16);
        make.centerY.mas_equalTo(_label8.mas_centerY);
        make.right.mas_equalTo(_heTongValueLabel.mas_right);
    }];
    
    [_label9 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label8.mas_bottom).offset(16);
        make.left.mas_equalTo(_label8.mas_left);
        make.width.mas_equalTo(62);
    }];
    [_creatorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label9.mas_right).offset(16);
        make.centerY.mas_equalTo(_label9.mas_centerY);
        make.right.mas_equalTo(_qianYueDateLabel.mas_right);
    }];
    
    [_label10 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label9.mas_bottom).offset(16);
        make.left.mas_equalTo(_label9.mas_left);
        make.right.mas_equalTo(_label8.mas_right);
    }];
    [_statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label10.mas_right).offset(16);
        make.centerY.mas_equalTo(_label10.mas_centerY);
        make.right.mas_equalTo(_creatorLabel.mas_right);
    }];
    
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo(UIScreenW);
        make.bottom.mas_equalTo(_label10.mas_bottom).offset(16);
    }];
}

-(void)isShowButtons{
    
    [JSEIMPNetWorking getUserIdAndReturnTargetActivityInstanceIdWithActivityId:_activityId OnSuccess:^(NSInteger canReturnPrevious,NSInteger canRevokeBack,NSInteger canDestroy,NSInteger canSend,NSInteger canSignup,NSInteger canExpandCopy,NSInteger canTransferVerify,NSInteger canExpandVerify,NSInteger returnTargetActivityInstanceId,NSMutableArray *userIdMArray){
        
        _canReturnPrevious = canReturnPrevious;//退回上一步按钮判断
        _canDestroy = canDestroy;//取消按钮判断
        _canSend = canSend;//发送按钮判断
        _canExpandCopy = canExpandCopy;//抄送按钮判断
        _canTransferVerify = canTransferVerify;//转签按钮判断
        _canExpandVerify = canExpandVerify;//加签按钮判断
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self setupUI];
        });
    } onErrorInfo:nil];
}

-(void)clickButton:(UIButton *)button{
    
    if (button.tag == 1) {
        
        [self agreeMethod];
    }else if (button.tag == 2){
        
        [self comeBackMethod];
    }else if (button.tag == 3){
        
        [self setAlertView];
    }else if (button.tag == 4){
        
        [self sendMethod];
    }else if (button.tag == 5){
        
        [self goToChaoSongVCWithButton:button];
    }else if (button.tag == 6){
        
        [self goToZhuanQianReasonVC];
    }else if (button.tag == 7){
        
        [self goToChaoSongVCWithButton:button];
    }
}

//跳转到转签原因控制器
-(void)goToZhuanQianReasonVC{
    
    JSEIMPZhuanQianReasonController *zhuanQianReasonController = [JSEIMPZhuanQianReasonController new];
    
    zhuanQianReasonController.activityId = _activityId;
    zhuanQianReasonController.buttonText = _canTransferVerifyButton.titleLabel.text;
    
    [self.navigationController pushViewController:zhuanQianReasonController animated:YES];
}

//跳转到抄送控制器
-(void)goToChaoSongVCWithButton:(UIButton *)button{
    
    JSEIMPChaoSongController *chaoSongController = [JSEIMPChaoSongController new];
    
    chaoSongController.activityId = _activityId;
    if (button.tag == 5) {
     
        chaoSongController.buttonText = _canExpandCopyButton.titleLabel.text;
    }else if (button.tag == 7){
        
        chaoSongController.buttonText = _canExpandVerifyButton.titleLabel.text;
    }
    
    [self.navigationController pushViewController:chaoSongController animated:YES];
}

//跳转到加签控制器
-(void)goJiaQianVC{
    
    
}

-(void)sendMethod{
    
    [JSEIMPNetWorking GetTatgetActivityIdWithActivityId:_activityId OnSuccess:^(NSMutableArray *targetActivityIdMArray,NSMutableArray *nameMArray){
        
        _targetActivityIdMArray = targetActivityIdMArray.copy;
        _nameMArray = nameMArray.copy;
        
        [self goToSuggestVCWithName:_nameMArray[0]];
    } onErrorInfo:nil];
}
//警告提示框
-(void)setAlertView{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"确定要取消流程？将删除该申请记录！" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        [self cancelMethod];
    }];
    UIAlertAction *action2= [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        NSLog(@"取消");
    }];
    
    [alert addAction:action1];
    [alert addAction:action2];

    [self presentViewController:alert animated:YES completion:^{

    }];
}

-(void)comeBackMethod{
    
    [JSEIMPNetWorking getUserIdAndReturnTargetActivityInstanceIdWithActivityId:_activityId OnSuccess:^(NSInteger canReturnPrevious,NSInteger canRevokeBack,NSInteger canDestroy,NSInteger canSend,NSInteger canSignup,NSInteger canExpandCopy,NSInteger canTransferVerify,NSInteger canExpandVerify,NSInteger returnTargetActivityInstanceId,NSMutableArray *userIdMArray){
        
        _canReturnPrevious = canReturnPrevious;
        _returnTargetActivityInstanceId = returnTargetActivityInstanceId;
        _userIdMArray = userIdMArray.copy;
        
        [self goToReasonVC];
    } onErrorInfo:nil];
}

-(void)agreeMethod{

    [JSEIMPNetWorking GetTatgetActivityIdWithActivityId:_activityId OnSuccess:^(NSMutableArray *targetActivityIdMArray,NSMutableArray *nameMArray){

        _targetActivityIdMArray = targetActivityIdMArray.copy;
        _nameMArray = nameMArray.copy;

        [self goToSuggestVCWithName:_nameMArray[0]];
    } onErrorInfo:nil];
}

#pragma mark - 取消方法
-(void)cancelMethod{
    
    [JSEIMPNetWorking PostCancelStepWithActivityId:_activityId OnSuccess:^{
        
        for(UIViewController *controller in self.navigationController.viewControllers) {
            
            if([controller isKindOfClass:[JSEIMPWorkDesktopController class]]) {
                
                [self.navigationController popToViewController:controller animated:YES];
            }
        }
    } onErrorInfo:nil];
}

-(void)goToReasonVC{
    
    JSEIMPBackReasonController *backReasonController = [JSEIMPBackReasonController new];
    
    backReasonController.userIdMArray = _userIdMArray;
    backReasonController.activityId = _activityId;
    backReasonController.returnTargetActivityInstanceId = _returnTargetActivityInstanceId;
    
    [self.navigationController pushViewController:backReasonController animated:YES];
}

-(void)goToSuggestVCWithName:(NSString *)name{
    
    JSEIMPSuggestController *suggestController = [JSEIMPSuggestController new];
    
    suggestController.targetActivityId = _targetActivityIdMArray[0];
    suggestController.processInstanceId = _processInstanceId;
    suggestController.activityId = _activityId;
    suggestController.name = name;
    
    [self.navigationController pushViewController:suggestController animated:YES];
}

-(UILabel *)setupLabelWithText:(NSString *)text TextColor:(UIColor *)textColor Font:(UIFont *)font{
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    
    [_view addSubview:label];
    
    return label;
    
}

-(UIButton *)setButtonWithBackgroundColor:(UIColor *)backgroundcolor Title:(NSString *)title Tag:(NSInteger)tag TitleColor:(UIColor *)titleColor Target:(SEL)target{
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _button.backgroundColor = backgroundcolor;
    _button.tag = tag;
    [_button addTarget:self action:target forControlEvents:UIControlEventTouchUpInside];
    _button.layer.cornerRadius = 5;
    _button.clipsToBounds = YES;
    [_button setTitle:title forState:UIControlStateNormal];
    [_button setTitleColor:titleColor forState:UIControlStateNormal];
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

@end
