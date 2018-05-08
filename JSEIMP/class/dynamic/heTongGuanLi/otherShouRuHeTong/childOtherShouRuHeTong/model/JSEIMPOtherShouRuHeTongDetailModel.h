//
//  JSEIMPOtherShouRuHeTongDetailModel.h
//  JSEIMP
//
//  Created by 朱建超 on 2018/3/12.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OtherShouRuHeTongDetailArraylModel : NSObject
//文件格式
@property(nonatomic,strong)NSString *FILEEXT;
//文件名
@property(nonatomic,strong)NSString *FILENAME;
//文件路径
@property(nonatomic,strong)NSString *FILEPATH;

@end


@interface OtherShouRuHeTongDetaillModel : NSObject
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
//创建人
@property(nonatomic,strong)NSString *CREATOR;
//内容及范围
@property(nonatomic,strong)NSString *CONTENTTERM;
//付款条款
@property(nonatomic,strong)NSString *PAYMENTTERM;
//其他条款
@property(nonatomic,strong)NSString *OTHERTERM;

@end

@interface JSEIMPOtherShouRuHeTongDetailModel : NSObject

@property(nonatomic,strong)OtherShouRuHeTongDetaillModel *ContractDetails;

@property(nonatomic,assign)NSInteger Code;

@property(nonatomic,strong)NSMutableArray<OtherShouRuHeTongDetailArraylModel *> *Files;

@end
