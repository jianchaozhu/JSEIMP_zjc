//
//  JSEIMPBackUserInfoModel.h
//  JSEIMP
//
//  Created by 朱建超 on 2018/1/31.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetBackUserInfoModel : NSObject

@property(nonatomic,strong)NSString *loginId;

@property(nonatomic,strong)NSString *roleId;

@property(nonatomic,strong)NSString *userId;

@property(nonatomic,strong)NSString *userName;

@property(nonatomic,strong)NSString *userStationId;

@property(nonatomic,strong)NSString *userUnitId;

@end

@interface JSEIMPBackUserInfoModel : NSObject

@property(nonatomic,strong)GetBackUserInfoModel *result;

@end
