//
//  JSEIMPDaiBanItemsModel.h
//  JSEIMP
//
//  Created by 朱建超 on 2018/1/12.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DaiBanItemsDataFieldsArrayModel : NSObject

@property(nonatomic,strong)NSString *dataType;

@property(nonatomic,strong)NSString *value;

@end

@interface DaiBanItemsArrayModel : NSObject

@property(nonatomic,assign)NSInteger activityId;
//序号
@property(nonatomic,strong)NSString *ID;

@property(nonatomic,strong)NSString *activityName;
//名称
@property(nonatomic,strong)NSString *name;
//时间
@property(nonatomic,strong)NSString *processCreationTime;

@property(nonatomic,strong)NSMutableArray<DaiBanItemsDataFieldsArrayModel *> *dataFields;

@end

@interface DaiBanItemsModel : NSObject

@property(nonatomic,strong)NSMutableArray<DaiBanItemsArrayModel *> *items;

@end

@interface JSEIMPDaiBanItemsModel : NSObject

@property(nonatomic,strong)DaiBanItemsModel *result;

@end
