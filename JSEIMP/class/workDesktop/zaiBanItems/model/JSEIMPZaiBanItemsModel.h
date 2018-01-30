//
//  JSEIMPZaiBanItemsModel.h
//  JSEIMP
//
//  Created by 朱建超 on 2018/1/23.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZaiBanItemsDataFieldsArrayModel : NSObject

@property(nonatomic,strong)NSString *dataType;

@property(nonatomic,strong)NSString *value;
//流程实例ID
@property(nonatomic,assign)NSInteger processInstanceId;

@end

@interface ZaiBanItemsArrayModel : NSObject

@property(nonatomic,assign)NSInteger activityId;
//序号
@property(nonatomic,strong)NSString *ID;

@property(nonatomic,strong)NSString *activityName;
//名称
@property(nonatomic,strong)NSString *name;
//时间
@property(nonatomic,strong)NSString *processCreationTime;

@property(nonatomic,strong)NSMutableArray<ZaiBanItemsDataFieldsArrayModel *> *dataFields;

@end

@interface ZaiBanItemsModel : NSObject

@property(nonatomic,strong)NSMutableArray<ZaiBanItemsArrayModel *> *items;

@end

@interface JSEIMPZaiBanItemsModel : NSObject

@property(nonatomic,strong)ZaiBanItemsModel *result;

@end
