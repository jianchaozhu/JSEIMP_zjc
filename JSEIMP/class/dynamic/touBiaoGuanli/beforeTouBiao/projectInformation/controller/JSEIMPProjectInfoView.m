//
//  JSEIMPProjectInfoView.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/11/16.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPProjectInfoView.h"
#import <Masonry.h>

@interface JSEIMPProjectInfoView ()

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

@implementation JSEIMPProjectInfoView{
    
    UILabel *_label1;
    
    UILabel *_bianMaLabel;
    
    UILabel *_label2;
    
    UILabel *_projectNameLabel;
    
    UILabel *_label3;
    
    UILabel *_adressLabel;
    
    UILabel *_label5;
    
    UILabel *_label6;
    
    UILabel *_label7;
    
    UILabel *_label8;
    
    UILabel *_label9;
    
    UILabel *_label10;
    
    UILabel *_label11;
    
    UILabel *_label12;
    
    UILabel *_buildCompanyLabel;
    
    UILabel *_guiMoLabel;
    
    UILabel *_moneyFromLabel;
    
    UILabel *_zhaoBiaoStyleLabel;
    
    UILabel *_jieShaoPeopleLabel;
    
    UILabel *_touBiaoPeopleLabel;
    
    UILabel *_isZHongBiaoLabel;
}

-(instancetype)init{

    if (self = [super init]) {
        
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    
    //注册通知
    [self setNotification];
    
    _label1 = [self setupLabelWithText:@"编码" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label2 = [self setupLabelWithText:@"项目名称" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label3 = [self setupLabelWithText:@"项目地址" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label5 = [self setupLabelWithText:@"建设单位" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label6 = [self setupLabelWithText:@"规模" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label7 = [self setupLabelWithText:@"资金来源" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label8 = [self setupLabelWithText:@"招标模式" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label9 = [self setupLabelWithText:@"介绍人" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label10 = [self setupLabelWithText:@"投标人" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label11 = [self setupLabelWithText:@"是否中标" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _label12 = [self setupLabelWithText:@"说明" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    
}

-(void)setNotification{

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(bianHao:) name:@"bianHao" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(projectName:) name:@"projectName" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(address:) name:@"address" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(buildCompany:) name:@"buildCompany" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(guiMo:) name:@"guiMo" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moneyFrom:) name:@"moneyFrom" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(zhaoBiaoStyle:) name:@"zhaoBiaoStyle" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jieShaoPeople:) name:@"jieShaoPeople" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(touBiaoPeople:) name:@"touBiaoPeople" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isZhongBiao:) name:@"isZhongBiao" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shuoMing:) name:@"shuoMing" object:nil];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(number:) name:@"number" object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(zhongBiaoStatus:) name:@"zhongBiaoStatus" object:nil];

}

-(void)bianHao:(NSNotification *)notification{
    
    _bianHaoName = notification.object;
    
    _bianMaLabel = [self setupLabelWithText:_bianHaoName TextColor:[UIColor darkGrayColor] Font:[UIFont boldSystemFontOfSize:16]];
}

-(void)projectName:(NSNotification *)notification{
    
    _projectName = notification.object;
    
    _projectNameLabel = [self setupLabelWithText:_projectName TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _projectNameLabel.numberOfLines = 0;
    _projectNameLabel.textAlignment = NSTextAlignmentRight;
}

-(void)address:(NSNotification *)notification{
    
    _address = notification.object;
    
    _adressLabel = [self setupLabelWithText:_address TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _adressLabel.numberOfLines = 0;
    _adressLabel.textAlignment = NSTextAlignmentRight;
}

-(void)buildCompany:(NSNotification *)notification{
    
    _buildCompany = notification.object;
    
    _buildCompanyLabel = [self setupLabelWithText:_buildCompany TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _buildCompanyLabel.numberOfLines = 0;
    _buildCompanyLabel.textAlignment = NSTextAlignmentRight;
    
}

-(void)guiMo:(NSNotification *)notification{
    
    _guiMo = notification.object;
    
    _guiMoLabel = [self setupLabelWithText:[_guiMo stringByAppendingString:@"亩"] TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _guiMoLabel.textAlignment = NSTextAlignmentRight;
}

-(void)moneyFrom:(NSNotification *)notification{
    
    _moneyFrom = notification.object;
    
    _moneyFromLabel = [self setupLabelWithText:_moneyFrom TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _moneyFromLabel.textAlignment = NSTextAlignmentRight;
}

-(void)zhaoBiaoStyle:(NSNotification *)notification{
    
    _zhaoBiaoStyle = notification.object;
    
    _zhaoBiaoStyleLabel = [self setupLabelWithText:_zhaoBiaoStyle TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _zhaoBiaoStyleLabel.textAlignment = NSTextAlignmentRight;
}

-(void)jieShaoPeople:(NSNotification *)notification{
    
    _jieShaoPeople = notification.object;
    
    _jieShaoPeopleLabel = [self setupLabelWithText:_jieShaoPeople TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _jieShaoPeopleLabel.textAlignment = NSTextAlignmentRight;
}

-(void)touBiaoPeople:(NSNotification *)notification{
    
    _touBiaoPeople = notification.object;
    
    _touBiaoPeopleLabel = [self setupLabelWithText:_touBiaoPeople TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _touBiaoPeopleLabel.textAlignment = NSTextAlignmentRight;
}

-(void)isZhongBiao:(NSNotification *)notification{
    
    _isZhongBiao = notification.object;
    
    _isZHongBiaoLabel = [self setupLabelWithText:_isZhongBiao TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _isZHongBiaoLabel.textAlignment = NSTextAlignmentRight;
}

-(void)shuoMing:(NSNotification *)notification{
    
    _shuoMing = notification.object;
    
    _shuoMingLabel = [self setupLabelWithText:_shuoMing TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _shuoMingLabel.numberOfLines = 0;
}

-(void)layoutSubviews{

    [super layoutSubviews];

    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.mas_top).offset(16);
        make.left.mas_equalTo(self.mas_left).offset(16);
        
    }];
    
    [_bianMaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label1.mas_centerY);
        make.right.mas_equalTo(self.mas_right).offset(-16);
        
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label1.mas_left);
        make.top.mas_equalTo(_label1.mas_bottom).offset(16);
        make.width.mas_equalTo(82);
    }];
    
    [_projectNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label2.mas_right).offset(16);
        make.top.mas_equalTo(_label2.mas_top);
        make.right.mas_equalTo(_bianMaLabel.mas_right);
        
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label2.mas_left);
        make.top.mas_equalTo(_projectNameLabel.mas_bottom).offset(16);
        make.right.mas_equalTo(_label2.mas_right);
        
    }];
    
    [_adressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label3.mas_right).offset(16);
        make.top.mas_equalTo(_label3.mas_top);
        make.right.mas_equalTo(_projectNameLabel.mas_right);
        
    }];

    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label3.mas_left);
        make.top.mas_equalTo(_adressLabel.mas_bottom).offset(16);
        
    }];
    
    [_buildCompanyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_adressLabel.mas_left);
        make.right.mas_equalTo(_adressLabel.mas_right);
        make.centerY.mas_equalTo(_label5.mas_centerY);
        
    }];
    
    [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label5.mas_left);
        make.top.mas_equalTo(_label5.mas_bottom).offset(16);
    }];
    
    [_guiMoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(_buildCompanyLabel.mas_right);
        make.centerY.mas_equalTo(_label6.mas_centerY);
        
    }];
    
    [_label7 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label6.mas_left);
        make.top.mas_equalTo(_label6.mas_bottom).offset(16);
        
    }];
    
    [_label8 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label7.mas_left);
        make.top.mas_equalTo(_label7.mas_bottom).offset(16);
        
    }];
    
    [_label9 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label8.mas_left);
        make.top.mas_equalTo(_label8.mas_bottom).offset(16);
        
    }];
    
    [_label10 mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.left.mas_equalTo(_label9.mas_left);
        make.top.mas_equalTo(_label9.mas_bottom).offset(16);
    }];
    
    [_label11 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label10.mas_left);
        make.top.mas_equalTo(_label10.mas_bottom).offset(16);
        
    }];
    
    [_label12 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label11.mas_left);
        make.top.mas_equalTo(_label11.mas_bottom).offset(16);
        
    }];
    
    [_moneyFromLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(_guiMoLabel.mas_right);
        make.centerY.mas_equalTo(_label7.mas_centerY);
        
    }];
    
    [_zhaoBiaoStyleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(_moneyFromLabel.mas_right);
        make.centerY.mas_equalTo(_label8.mas_centerY);
        
    }];
    
    [_jieShaoPeopleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(_zhaoBiaoStyleLabel.mas_right);
        make.centerY.mas_equalTo(_label9.mas_centerY);
        
    }];
    
    [_touBiaoPeopleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(_jieShaoPeopleLabel.mas_right);
        make.centerY.mas_equalTo(_label10.mas_centerY);
        
    }];
    
    [_isZHongBiaoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(_touBiaoPeopleLabel.mas_right);
        make.centerY.mas_equalTo(_label11.mas_centerY);
        
    }];
    
    [_shuoMingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(_label12.mas_left);
        make.top.mas_equalTo(_label12.mas_bottom).offset(16);
        make.right.mas_equalTo(_isZHongBiaoLabel.mas_right);
    }];
    
}

-(UILabel *)setupLabelWithText:(NSString *)text TextColor:(UIColor *)textColor Font:(UIFont *)font{
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    
    [self addSubview:label];
    
    return label;
    
}

//-(void)zhongBiaoStatus:(NSNotification *)notification{
//
//    _zhongBiaoStatus = notification.object;
//
//    _isZHongBiaoLabel.text = @"";
//
//    _isZHongBiaoLabel = [self setupLabelWithText:_zhongBiaoStatus TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
//
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//
//    [userDefaults setObject:_isZHongBiaoLabel.text forKey:[@"zhongBiaoStatus" stringByAppendingString:[@(_number + 10) stringValue]]];
//
//    [userDefaults synchronize];
//
//}

//-(void)number:(NSNotification *)notification{
//
//    _number = [notification.object integerValue];
//
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//
//    _isZHongBiaoLabel = [self setupLabelWithText:[userDefaults objectForKey:[@"zhongBiaoStatus" stringByAppendingString:[@(_number) stringValue]]] TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
//
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushStatus:) name:@"pushStatus" object:nil];
//
//}

//-(void)pushStatus:(NSNotification *)notification{
//
//    NSLog(@"%@",notification.object);
//
//    _isZHongBiaoLabel = [self setupLabelWithText:notification.object TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
//}

@end
