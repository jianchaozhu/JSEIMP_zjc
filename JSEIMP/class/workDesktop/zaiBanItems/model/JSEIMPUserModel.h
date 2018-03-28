//
//  JSEIMPUserModel.h
//  JSEIMP
//
//  Created by 朱建超 on 2018/3/20.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserArrayModel : NSObject

@property(nonatomic,strong)NSString *loginId;

@property(nonatomic,strong)NSString *userId;
//部门名称
@property(nonatomic,strong)NSString *userName;

@end


@interface JSEIMPUserModel : NSObject

@property(nonatomic,strong)NSMutableArray<UserArrayModel *> *result;

@end
