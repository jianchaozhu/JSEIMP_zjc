//
//  JSEIMPYiBanItemsModel.h
//  JSEIMP
//
//  Created by 朱建超 on 2018/1/26.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YiBanItemsDataFieldsArrayModel : NSObject

@property(nonatomic,strong)NSString *dataType;

@property(nonatomic,strong)NSString *value;

@end

@interface YiBanItemsArrayModel : NSObject

@property(nonatomic,assign)NSInteger activityId;
//序号
@property(nonatomic,strong)NSString *ID;

@property(nonatomic,strong)NSString *activityName;
//名称
@property(nonatomic,strong)NSString *name;
//时间
@property(nonatomic,strong)NSString *processCreationTime;

@property(nonatomic,strong)NSMutableArray<YiBanItemsDataFieldsArrayModel *> *dataFields;

@end

@interface YiBanItemsModel : NSObject

@property(nonatomic,strong)NSMutableArray<YiBanItemsArrayModel *> *items;

@end

@interface JSEIMPYiBanItemsModel : NSObject

@property(nonatomic,strong)YiBanItemsModel *result;

@end
