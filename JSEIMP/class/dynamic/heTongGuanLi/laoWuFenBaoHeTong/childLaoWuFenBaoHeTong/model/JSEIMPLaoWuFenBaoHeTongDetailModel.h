//
//  JSEIMPLaoWuFenBaoHeTongDetailModel.h
//  JSEIMP
//
//  Created by 朱建超 on 2018/2/6.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LaoWuFenBaoHeTongDetailArraylModel : NSObject
//文件格式
@property(nonatomic,strong)NSString *FILEEXT;
//文件名
@property(nonatomic,strong)NSString *FILENAME;
//文件路径
@property(nonatomic,strong)NSString *FILEPATH;

@end

@interface LaoWuFenBaoHeTongDetaillModel : NSObject
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
//日历天数
@property(nonatomic,strong)NSString *DAYS;
//创建人
@property(nonatomic,strong)NSString *CREATOR;
//承包工程内容及范围
@property(nonatomic,strong)NSString *CONTENTTERM;
//质量标准
@property(nonatomic,strong)NSString *QUALITYTERM;
//材料、设备供应
@property(nonatomic,strong)NSString *EQUIPMENTTERM;
//付款条款
@property(nonatomic,strong)NSString *PAYMENTTERM;
//保证金交付退还
@property(nonatomic,strong)NSString *DEPOSITTERM;
//其他条款
@property(nonatomic,strong)NSString *OTHERTERM;

@end

@interface JSEIMPLaoWuFenBaoHeTongDetailModel : NSObject

@property(nonatomic,strong)LaoWuFenBaoHeTongDetaillModel *ContractDetails;

@property(nonatomic,assign)NSInteger Code;

@property(nonatomic,strong)NSMutableArray<LaoWuFenBaoHeTongDetailArraylModel *> *Files;

@end
