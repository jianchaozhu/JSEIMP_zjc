//
//  JSEIMPFarmerBaoZhengJinDetailController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/10/11.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPFarmerBaoZhengJinDetailController.h"
#import <Masonry.h>
#import "JSEIMPNetWorking.h"

@interface JSEIMPFarmerBaoZhengJinDetailController ()
//建设单位
@property(nonatomic,strong)NSString *owner;
//缴纳日期
@property(nonatomic,strong)NSString *payDate;
//退款日期
@property(nonatomic,strong)NSString *refundDate;
//缴纳账户
@property(nonatomic,strong)NSString *payAccount;
//是否中标
@property(nonatomic,strong)NSString *winflg;
//备注
@property(nonatomic,strong)NSString *comment;

@end

@interface JSEIMPFarmerBaoZhengJinDetailController (){
    
    UIScrollView *_scrollView;
    
    UIView *_view;
    
    UILabel *_label1;
    
    UILabel *_label2;
    
    UILabel *_label3;
    
    UILabel *_label4;
    
    UILabel *_label5;
    
    UILabel *_label6;
    
    UILabel *_label7;
    
    UILabel *_label8;
    
    UILabel *_buildCompanyLabel;
    
    UILabel *_projectNameLabel;
    
    UILabel *_baoZhengJinLabel;
    
    UILabel *_payDateLabel;
    
    UILabel *_backDateLabel;
    
    UILabel *_payAccountLabel;
    
    UILabel *_isZhongBiaoLabel;
    
    UILabel *_beiZhuLabel;
    
}

@end

@implementation JSEIMPFarmerBaoZhengJinDetailController

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
    
    [self getData];
//    [self setupUI];
    
}

- (void)returnAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)getData{

    [JSEIMPNetWorking getFarmerBaoZhengJinDetailWithDepositId:_depositId OnSuccess:^(NSString *buildCompany,NSString *finalJiaoNaDate,NSString *finalTuiKuanDate,NSString *jiaoNaAccount,NSString *finalIsZhongBiao,NSString *beiZhu){
        
        _owner = buildCompany.copy;
        _payDate = finalJiaoNaDate.copy;
        _refundDate = finalTuiKuanDate.copy;
        _payAccount = jiaoNaAccount.copy;
        _winflg = finalIsZhongBiao.copy;
        _comment = beiZhu.copy;
        
        [self setupUI];
        
    } onErrorInfo:nil];

}

-(void)setupUI{
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 108)];
    
    [self.view addSubview:_scrollView];
    
    _view = [[UIView alloc] initWithFrame:_scrollView.bounds];
    
    _view.backgroundColor = [UIColor whiteColor];
    
    [_scrollView addSubview:_view];
    
    _label1 = [self setupLabelWithText:@"建设单位" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label2 = [self setupLabelWithText:@"项目名称" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label3 = [self setupLabelWithText:@"保证金金额(万元)" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label4 = [self setupLabelWithText:@"缴纳日期" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label5 = [self setupLabelWithText:@"退款日期" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label6 = [self setupLabelWithText:@"缴纳账户" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label7 = [self setupLabelWithText:@"是否中标" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label8 = [self setupLabelWithText:@"备注" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    
    _buildCompanyLabel = [self setupLabelWithText:_owner TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _buildCompanyLabel.numberOfLines = 0;
    _buildCompanyLabel.textAlignment = NSTextAlignmentRight;
    
    _projectNameLabel = [self setupLabelWithText:_projectName TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _projectNameLabel.numberOfLines = 0;
    _projectNameLabel.textAlignment = NSTextAlignmentRight;
    
    _baoZhengJinLabel = [self setupLabelWithText:_depositAmount TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _baoZhengJinLabel.textAlignment = NSTextAlignmentRight;
    
    _payDateLabel = [self setupLabelWithText:_payDate TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _payDateLabel.textAlignment = NSTextAlignmentRight;
    
    _backDateLabel = [self setupLabelWithText:_refundDate TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _backDateLabel.textAlignment = NSTextAlignmentRight;
    
    _payAccountLabel = [self setupLabelWithText:_payAccount TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _payAccountLabel.numberOfLines = 0;
    _payAccountLabel.textAlignment = NSTextAlignmentRight;
    
    _isZhongBiaoLabel = [self setupLabelWithText:_winflg TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _isZhongBiaoLabel.textAlignment = NSTextAlignmentRight;
    
    _beiZhuLabel = [self setupLabelWithText:_comment TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _beiZhuLabel.numberOfLines = 0;
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.mas_equalTo(_view).offset(16);
        make.width.mas_equalTo(82);
        
    }];
    [_buildCompanyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label1.mas_right).offset(16);
        make.top.mas_equalTo(_label1.mas_top);
        make.right.mas_equalTo(_view.mas_right).offset(-16);
        
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_buildCompanyLabel.mas_bottom).offset(16);
        make.left.mas_equalTo(_label1.mas_left);
        
    }];
    [_projectNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_buildCompanyLabel.mas_left);
        make.top.mas_equalTo(_label2.mas_top);
        make.right.mas_equalTo(_buildCompanyLabel.mas_right);
        
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_projectNameLabel.mas_bottom).offset(16);
        make.left.mas_equalTo(_label2.mas_left);
        make.width.mas_equalTo(158);
    }];
    [_baoZhengJinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label3.mas_centerY);
        make.right.mas_equalTo(_projectNameLabel.mas_right);
        make.left.mas_equalTo(_label3.mas_right).offset(16);
        
    }];
    
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label3.mas_bottom).offset(16);
        make.left.mas_equalTo(_label3.mas_left);
        
    }];
    [_payDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_projectNameLabel.mas_left);
        make.centerY.mas_equalTo(_label4.mas_centerY);
        make.right.mas_equalTo(_projectNameLabel.mas_right);
        
    }];
    
    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label4.mas_bottom).offset(16);
        make.left.mas_equalTo(_label4.mas_left);
        
    }];
    [_backDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_payDateLabel.mas_left);
        make.centerY.mas_equalTo(_label5.mas_centerY);
        make.right.mas_equalTo(_payDateLabel.mas_right);
        
    }];
    
    [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label5.mas_bottom).offset(16);
        make.left.mas_equalTo(_label5.mas_left);
        
    }];
    [_payAccountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label6.mas_top);
        make.left.mas_equalTo(_backDateLabel.mas_left);
        make.right.mas_equalTo(_backDateLabel.mas_right);
        
    }];
    
    if (_payAccountLabel.text != nil) {
    
        [_label7 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(_payAccountLabel.mas_bottom).offset(16);
            make.left.mas_equalTo(_label6.mas_left);
        }];
    }else{
    
        [_label7 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(_label6.mas_bottom).offset(16);
            make.left.mas_equalTo(_label6.mas_left);
        }];
    }
    [_isZhongBiaoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_payAccountLabel.mas_left);
        make.centerY.mas_equalTo(_label7.mas_centerY);
        make.right.mas_equalTo(_payAccountLabel.mas_right);
        
    }];
    
    [_label8 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label7.mas_bottom).offset(16);
        make.left.mas_equalTo(_label7.mas_left);
        
    }];
    [_beiZhuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label8.mas_left);
        make.top.mas_equalTo(_label8.mas_bottom).offset(16);
        make.right.mas_equalTo(_isZhongBiaoLabel.mas_right);
        
    }];
    
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_beiZhuLabel.mas_bottom).offset(16);
        
    }];
    
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
