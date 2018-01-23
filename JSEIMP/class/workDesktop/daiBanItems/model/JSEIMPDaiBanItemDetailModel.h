//
//  JSEIMPDaiBanItemDetailModel.h
//  JSEIMP
//
//  Created by 朱建超 on 2018/1/19.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DaiBanItemDetailArraylModel : NSObject
//文件格式
@property(nonatomic,strong)NSString *FILEEXT;
//文件名
@property(nonatomic,strong)NSString *FILENAME;
//文件路径
@property(nonatomic,strong)NSString *FILEPATH;

@end

@interface DaiBanItemDetaillModel : NSObject
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
//合同名称
@property(nonatomic,strong)NSString *CONTRACTNAME;
//签约日期
@property(nonatomic,strong)NSString *CONTRACTDATE;
//创建人
@property(nonatomic,strong)NSString *CREATOR;
//合同状态
@property(nonatomic,assign)NSInteger STATUS;

@end

@interface JSEIMPDaiBanItemDetailModel : NSObject

@property(nonatomic,strong)DaiBanItemDetaillModel *ContractDetails;

@property(nonatomic,assign)NSInteger Code;

@property(nonatomic,strong)NSMutableArray<DaiBanItemDetailArraylModel *> *Files;

@end
