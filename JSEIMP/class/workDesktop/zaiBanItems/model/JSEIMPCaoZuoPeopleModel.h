//
//  JSEIMPCaoZuoPeopleModel.h
//  JSEIMP
//
//  Created by 朱建超 on 2018/1/25.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetCaoZuoPeopleArrayModel : NSObject

//登录id
@property(nonatomic,strong)NSString *loginId;
//角色id
@property(nonatomic,strong)NSString *roleId;
//用户id
@property(nonatomic,strong)NSString *userId;
//用户姓名
@property(nonatomic,strong)NSString *userName;
//用户身份Id
@property(nonatomic,strong)NSString *userStationId;
//用户单位ID
@property(nonatomic,strong)NSString *userUnitId;

@end

@interface GetCaoZuoPeopleModel : NSObject

@property(nonatomic,strong)NSMutableArray<GetCaoZuoPeopleArrayModel *> *items;

@end

@interface JSEIMPCaoZuoPeopleModel : NSObject

@property(nonatomic,strong)GetCaoZuoPeopleModel *result;

@end
