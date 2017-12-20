//
//  JSEIMPHeTongZhiFuTiaoKuanView.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/11/7.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPHeTongZhiFuTiaoKuanView.h"
#import <Masonry.h>

#define UIScreenW [UIScreen mainScreen].bounds.size.width
#define UIScreenH [UIScreen mainScreen].bounds.size.height

@implementation JSEIMPHeTongZhiFuTiaoKuanView{

    UILabel *_label1;
    
}

-(instancetype)init{

    if (self = [super init]) {
        
        [self setupUI];
        
    }

    return self;
}

-(void)setupUI{

    _label1 = [self setupLabelWithText:@"合同支付条款" Font:[UIFont systemFontOfSize:20] TextColor:[UIColor darkTextColor]];
    _zhiFuTiaoKuanLabel = [self setupLabelWithText:@"1、本工程质量要求为确保一次性验收合格。乙方必须严格按甲方要求和现行施工、验收规范进行供料和施工，确保通过分包工程验收。材料、配件进场前须通过甲方和监理的验收，进场材料各项检测指标必须符合规范要求。2、乙方需提供资料：企业营业执照、资质证书、安全生产许可证、各项工序报验及竣工验收资料、有关验收检测报告、规费缴纳证明等，如是复印件需加盖单位公章。3、该分包工程的施工质量必须通过甲方、监理部门的联合验收，严格按招标文件及设计文件的有关要求和标准进行施工。4、分包工程材料选用标准及具体做法详有关说明，构件断面尺寸统一为加工后净尺寸。安装后整体效果必须和招标图纸及图片保持一致，批量进场材料的材质、断面尺寸等指标须和样品保持一致；否则，乙方需无条件更换或返工至符合要求。5、乙方在完成每一道施工工序后，经认真自检、互检合格后，报甲方复检验收；甲方根据现行国家施工验收规范和合同要求对乙方的施工质量进行现场检测、验收。因不合格分包工程造成返工或整改的工料费全部由乙方承担，造成工期延误的，按违约责任相应条款执行。6、乙方的施工质量和进度必须满足甲方项目部及业主、监理公司的相关要求；否则，由此产生的经济处罚（包括业主、监理公司对甲方的质量和进度罚款）均由乙方承担。" Font:[UIFont systemFontOfSize:16] TextColor:[UIColor darkGrayColor]];
    _zhiFuTiaoKuanLabel.numberOfLines = 0;

}

-(void)layoutSubviews{

    [super layoutSubviews];
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(self.mas_top).offset(16);
        
    }];
    
    [_zhiFuTiaoKuanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label1.mas_bottom).offset(16);
        make.left.mas_equalTo(self.mas_left).offset(16);
        make.right.mas_equalTo(self.mas_right).offset(-16);
        
    }];

}

-(UILabel *)setupLabelWithText:(NSString *)text Font:(UIFont *)font TextColor:(UIColor *)textColor{
    
    UILabel *label = [[UILabel alloc] init];
    
    label.text = text;
    label.font = font;
    label.textColor = textColor;
    
    [self addSubview:label];
    
    return label;
    
}

@end
