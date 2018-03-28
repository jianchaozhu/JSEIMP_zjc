//
//  JSEIMPBuMenModel.h
//  JSEIMP
//
//  Created by 朱建超 on 2018/3/20.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BuMenArrayModel : NSObject

@property(nonatomic,strong)NSString *code;

@property(nonatomic,strong)NSString *parentId;

@property(nonatomic,strong)NSString *unitId;
//部门名称
@property(nonatomic,strong)NSString *unitName;

@end

@interface JSEIMPBuMenModel : NSObject

@property(nonatomic,strong)NSMutableArray<BuMenArrayModel *> *result;

@end
