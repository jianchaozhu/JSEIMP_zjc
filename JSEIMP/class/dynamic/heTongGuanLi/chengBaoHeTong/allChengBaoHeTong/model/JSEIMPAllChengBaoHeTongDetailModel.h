//
//  JSEIMPAllChengBaoHeTongDetailModel.h
//  JSEIMP
//
//  Created by 朱建超 on 2017/12/6.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AllChengBaoHeTongDetaillModel : NSObject
//合同编号
@property(nonatomic,strong)NSString *CONTRACTCODE;
//项目ID
@property(nonatomic,strong)NSString *PROJECTID;
//项目名称
@property(nonatomic,strong)NSString *PROJECTNAME;
//甲方名称
@property(nonatomic,strong)NSString *PARTYAName;
//乙方名称
@property(nonatomic,strong)NSString *PARTYBName;
//合同类型
@property(nonatomic,strong)NSString *CONTRACTTYPE;
//合同总价
@property(nonatomic,strong)NSString *AMOUNT;
//签约日期
@property(nonatomic,strong)NSString *CONTRACTDATE;
//开工日期
@property(nonatomic,strong)NSString *STARTDATE;
//竣工日期
@property(nonatomic,strong)NSString *ENDDATE;
//合同工期
@property(nonatomic,strong)NSString *DAYS;
//文明施工费
@property(nonatomic,strong)NSString *CIVILIZATIONFEE;
//创建人
@property(nonatomic,strong)NSString *CREATOR;
//承包范围
@property(nonatomic,strong)NSString *CONTENTTERM;
//质量条款
@property(nonatomic,strong)NSString *QUALITYTERM;
//施工条款
@property(nonatomic,strong)NSString *CIVILTERM;
//其他条款
@property(nonatomic,strong)NSString *OTHERTERM;

@end

@interface JSEIMPAllChengBaoHeTongDetailModel : NSObject

@property(nonatomic,strong)AllChengBaoHeTongDetaillModel *ContractDetails;

@property(nonatomic,assign)NSInteger Code;

@end
