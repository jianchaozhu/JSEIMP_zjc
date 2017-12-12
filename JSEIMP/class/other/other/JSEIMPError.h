//
//  JSEIMPError.h
//  JSEIMP
//
//  Created by 朱建超 on 2017/12/1.
//  Copyright © 2017年 朱建超. All rights reserved.
//

typedef enum : NSUInteger {
    noError,//没有错误
    otherError,//其他错误
    noNet,//无网络
    error_500,//用户名或密码错误
    noData,//数据为空
    noUserData,//用户信息为空
    error_400//用户名或密码错误
} JSEIMPError;
