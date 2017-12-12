//
//  JSEIMPStaffStoreDetailController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/9/28.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPStaffStoreDetailController.h"
#import <Masonry.h>

#define UIScreesW [UIScreen mainScreen].bounds.size.width
#define UIScreesH [UIScreen mainScreen].bounds.size.height

@interface JSEIMPStaffStoreDetailController ()

@end

@implementation JSEIMPStaffStoreDetailController{

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
    
    UILabel *_label9;
    
    UILabel *_label10;
    
    UILabel *_label11;
    
    UILabel *_label12;
    
    UILabel *_label13;
    
    UILabel *_label14;
    
    UILabel *_label15;
    
    UILabel *_label16;
    
    UILabel *_label17;
    
    UILabel *_label18;
    
    UILabel *_label19;
    
    UILabel *_accountLabel;
    
    UILabel *_gongHaoLabel;
    
    UILabel *_sexLabel;

    UILabel *_chuShengDateLabel;
    
    UILabel *_companyLabel;
    
    UILabel *_buMenLabel;
    
    UILabel *_zhuanYeLabel;
    
    UILabel *_zhiWuLabel;
    
    UILabel *_xueLiLabel;
    
    UILabel *_telPhoneNumberLabel;
    
    UILabel *_phoneNumberLabel;
    
    UILabel *_engineerLabel;
    
    UILabel *_zhiJianYuanLabel;
    
    UILabel *_builderLabel;
    
    UILabel *_anQuanYuanLabel;
    
    UILabel *_shiGongYuanLabel;
    
    UILabel *_idCardLabel;
    
    UILabel *_mailLabel;
    
    UILabel *_beiZhuLabel;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = _staffName;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
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
    
    _label1 = [self setupLabelWithText:@"账号" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label2 = [self setupLabelWithText:@"工号" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label3 = [self setupLabelWithText:@"性别" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label4 = [self setupLabelWithText:@"出生日期" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label5 = [self setupLabelWithText:@"公司" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label6 = [self setupLabelWithText:@"部门" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label7 = [self setupLabelWithText:@"专业" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label8 = [self setupLabelWithText:@"职务" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label9 = [self setupLabelWithText:@"学历" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label10 = [self setupLabelWithText:@"手机" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label11 = [self setupLabelWithText:@"电话" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label12 = [self setupLabelWithText:@"工程师证书" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label13 = [self setupLabelWithText:@"质检员证书" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label14 = [self setupLabelWithText:@"建造师证书" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label15 = [self setupLabelWithText:@"安全员证书" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label16 = [self setupLabelWithText:@"施工员证书" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label17 = [self setupLabelWithText:@"身份证" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label18 = [self setupLabelWithText:@"邮箱" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _label19 = [self setupLabelWithText:@"备注" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _accountLabel = [self setupLabelWithText:@"E000001" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _gongHaoLabel = [self setupLabelWithText:_staffNumber Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _sexLabel = [self setupLabelWithText:@"男" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _chuShengDateLabel = [self setupLabelWithText:@"1990/10/23" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _companyLabel = [self setupLabelWithText:@"上海嘉实集团" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _buMenLabel = [self setupLabelWithText:@"信息部" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _zhuanYeLabel = [self setupLabelWithText:@"计算机" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _zhiWuLabel = [self setupLabelWithText:@"软件开发" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _xueLiLabel = [self setupLabelWithText:@"本科" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _telPhoneNumberLabel = [self setupLabelWithText:@"13838384388" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _phoneNumberLabel = [self setupLabelWithText:@"021-12345678" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _engineerLabel = [self setupLabelWithText:@"有" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _zhiJianYuanLabel = [self setupLabelWithText:@"有" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _builderLabel = [self setupLabelWithText:@"有" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _anQuanYuanLabel = [self setupLabelWithText:@"有" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _shiGongYuanLabel = [self setupLabelWithText:@"有" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _idCardLabel = [self setupLabelWithText:@"310105199911110033" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _mailLabel = [self setupLabelWithText:@"12345678@qq.com" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _beiZhuLabel = [self setupLabelWithText:@"页面，已发布的公告列表内容排布正常,发布人员等相关信息正确，点击新闻发布跳转到新闻发布页面。2.内容有效性判断，必填字段不可为空，公告内容中填写特殊字符和html关键字内容提交，显示正确。3.公告内容预览以及查看时和原格式保持一致。4.页面按钮功能检测，如各条目的展开和收起，编辑框中上的各页面各按钮如字体选择和段落格式选择切换和基本功能正常，各条目总数统计正常，页码标签跳转正常" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _beiZhuLabel.numberOfLines = 0;
    _beiZhuLabel.textAlignment = NSTextAlignmentLeft;
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.mas_equalTo(_view).offset(16);
        make.width.mas_equalTo(42);
        
    }];
    [_accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label1.mas_right).offset(16);
        make.centerY.mas_equalTo(_label1.mas_centerY);
        make.right.mas_equalTo(_view.mas_right).offset(-16);
        
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.mas_equalTo(_label1.mas_left);
        make.top.mas_equalTo(_label1.mas_bottom).offset(16);
        
    }];
    [_gongHaoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_accountLabel.mas_left);
        make.centerY.mas_equalTo(_label2.mas_centerY);
        make.right.mas_equalTo(_accountLabel.mas_right);
        
    }];

    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label2.mas_left);
        make.top.mas_equalTo(_label2.mas_bottom).offset(16);
        
    }];
    [_sexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_gongHaoLabel.mas_left);
        make.centerY.mas_equalTo(_label3.mas_centerY);
        make.right.mas_equalTo(_gongHaoLabel.mas_right);
        
    }];

    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label3.mas_left);
        make.top.mas_equalTo(_label3.mas_bottom).offset(16);
        make.width.mas_equalTo(82);
        
    }];
    [_chuShengDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label4.mas_right).offset(16);
        make.centerY.mas_equalTo(_label4.mas_centerY);
        make.right.mas_equalTo(_sexLabel.mas_right);
        
    }];

    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label3.mas_left);
        make.top.mas_equalTo(_label4.mas_bottom).offset(16);
        
    }];
    [_companyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_sexLabel.mas_left);
        make.centerY.mas_equalTo(_label5.mas_centerY);
        make.right.mas_equalTo(_sexLabel.mas_right);
    }];

    [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label5.mas_left);
        make.top.mas_equalTo(_label5.mas_bottom).offset(16);
        
    }];
    [_buMenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_companyLabel.mas_left);
        make.centerY.mas_equalTo(_label6.mas_centerY);
        make.right.mas_equalTo(_companyLabel.mas_right);
        
    }];

    [_label7 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label6.mas_left);
        make.top.mas_equalTo(_label6.mas_bottom).offset(16);
        
    }];
    [_zhuanYeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_buMenLabel.mas_left);
        make.centerY.mas_equalTo(_label7.mas_centerY);
        make.right.mas_equalTo(_buMenLabel.mas_right);
        
    }];

    [_label8 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label7.mas_left);
        make.top.mas_equalTo(_label7.mas_bottom).offset(16);
        
    }];
    [_zhiWuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_zhuanYeLabel.mas_left);
        make.centerY.mas_equalTo(_label8.mas_centerY);
        make.right.mas_equalTo(_zhuanYeLabel.mas_right);
        
    }];

    [_label9 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label8.mas_left);
        make.top.mas_equalTo(_label8.mas_bottom).offset(16);
        
    }];
    [_xueLiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_zhiWuLabel.mas_left);
        make.centerY.mas_equalTo(_label9.mas_centerY);
        make.right.mas_equalTo(_zhiWuLabel.mas_right);
        
    }];

    [_label10 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label9.mas_left);
        make.top.mas_equalTo(_label9.mas_bottom).offset(16);
        
    }];
    [_telPhoneNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_xueLiLabel.mas_left);
        make.centerY.mas_equalTo(_label10.mas_centerY);
        make.right.mas_equalTo(_xueLiLabel.mas_right);
        
    }];

    [_label11 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label10.mas_left);
        make.top.mas_equalTo(_label10.mas_bottom).offset(16);
        
    }];
    [_phoneNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_telPhoneNumberLabel.mas_left);
        make.centerY.mas_equalTo(_label11.mas_centerY);
        make.right.mas_equalTo(_telPhoneNumberLabel.mas_right);
        
    }];

    [_label12 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label11.mas_left);
        make.top.mas_equalTo(_label11.mas_bottom).offset(16);
        make.width.mas_equalTo(102);
        
    }];
    [_engineerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label12.mas_right).offset(16);
        make.centerY.mas_equalTo(_label12.mas_centerY);
        make.right.mas_equalTo(_phoneNumberLabel.mas_right);
        
    }];

    [_label13 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label12.mas_left);
        make.top.mas_equalTo(_label12.mas_bottom).offset(16);
        
    }];
    [_zhiJianYuanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_engineerLabel.mas_left);
        make.centerY.mas_equalTo(_label13.mas_centerY);
        make.right.mas_equalTo(_engineerLabel.mas_right);
        
    }];

    [_label14 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label13.mas_left);
        make.top.mas_equalTo(_label13.mas_bottom).offset(16);
    }];
    [_builderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_zhiJianYuanLabel.mas_left);
        make.centerY.mas_equalTo(_label14.mas_centerY);
        make.right.mas_equalTo(_zhiJianYuanLabel.mas_right);
        
    }];

    [_label15 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label14.mas_left);
        make.top.mas_equalTo(_label14.mas_bottom).offset(16);
        
    }];
    [_anQuanYuanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_builderLabel.mas_left);
        make.centerY.mas_equalTo(_label15.mas_centerY);
        make.right.mas_equalTo(_builderLabel.mas_right);
        
    }];

    [_label16 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label15.mas_left);
        make.top.mas_equalTo(_label15.mas_bottom).offset(16);
        
    }];
    [_shiGongYuanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_anQuanYuanLabel.mas_left);
        make.centerY.mas_equalTo(_label16.mas_centerY);
        make.right.mas_equalTo(_anQuanYuanLabel.mas_right);
        
    }];

    [_label17 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label16.mas_left);
        make.top.mas_equalTo(_label16.mas_bottom).offset(16);
        
    }];
    [_idCardLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label17.mas_right).offset(16);
        make.centerY.mas_equalTo(_label17.mas_centerY);
        make.right.mas_equalTo(_anQuanYuanLabel.mas_right);
        
    }];

    [_label18 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label17.mas_bottom).offset(16);
        make.left.mas_equalTo(_label1.mas_left);
        make.right.mas_equalTo(_label1.mas_right);
        
    }];
    [_mailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_accountLabel.mas_left);
        make.centerY.mas_equalTo(_label18.mas_centerY);
        make.right.mas_equalTo(_idCardLabel.mas_right);
        
    }];

    [_label19 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label18.mas_bottom).offset(16);
        make.left.mas_equalTo(_label18.mas_left);
        
    }];
    [_beiZhuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label19.mas_bottom).offset(16);
        make.left.mas_equalTo(_label19.mas_left);
        make.right.mas_equalTo(_mailLabel.mas_right);
        
    }];
    
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo(UIScreesW);
        make.bottom.mas_equalTo(_beiZhuLabel.mas_bottom).offset(16);
        
    }];
    
}

-(UILabel *)setupLabelWithText:(NSString *)text Font:(UIFont *)font TextColor:(UIColor *)textColor{
    
    UILabel *label = [[UILabel alloc] init];
    
    label.textAlignment = NSTextAlignmentRight;
    label.text = text;
    label.font = font;
    label.textColor = textColor;
    
    [_view addSubview:label];
    
    return label;
    
}

@end
