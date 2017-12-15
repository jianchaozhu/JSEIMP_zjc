//
//  JSEIMPZhuanYeFenBaoHeTongDetailModel.h
//  JSEIMP
//
//  Created by 朱建超 on 2017/12/15.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZhuanYeFenBaoHeTongDetailArraylModel : NSObject
//文件格式
@property(nonatomic,strong)NSString *FILEEXT;
//文件名
@property(nonatomic,strong)NSString *FILENAME;
//文件路径
@property(nonatomic,strong)NSString *FILEPATH;

@end

@interface ZhuanYeFenBaoHeTongDetaillModel : NSObject
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
//第三方名称
@property(nonatomic,strong)NSString *PARTYCName;
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
//质量保修金
@property(nonatomic,strong)NSString *REPAIEFEE;
//创建人
@property(nonatomic,strong)NSString *CREATOR;
//承包范围
@property(nonatomic,strong)NSString *CONTENTTERM;

@end

@interface JSEIMPZhuanYeFenBaoHeTongDetailModel : NSObject

@property(nonatomic,strong)ZhuanYeFenBaoHeTongDetaillModel *ContractDetails;

@property(nonatomic,assign)NSInteger Code;

@property(nonatomic,strong)NSMutableArray<ZhuanYeFenBaoHeTongDetailArraylModel *> *Files;


@end
