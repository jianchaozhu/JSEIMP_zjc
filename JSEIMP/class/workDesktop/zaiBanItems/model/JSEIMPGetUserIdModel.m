//
//  JSEIMPGetUserIdModel.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/1/30.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPGetUserIdModel.h"

@implementation JSEIMPGetUserIdModel

+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"result":[GetUserIdModel class]};
}

@end

@implementation GetUserIdModel

+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"inComeActivity":[GetInComeActivityModel class]};
}

@end

@implementation GetInComeActivityModel

+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"workItems":[GetUserIdArrayModel class]};
}

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

@end

@implementation GetUserIdArrayModel

@end
