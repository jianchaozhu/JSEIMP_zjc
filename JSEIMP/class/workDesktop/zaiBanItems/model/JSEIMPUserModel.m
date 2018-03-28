//
//  JSEIMPUserModel.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/3/20.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPUserModel.h"

@implementation JSEIMPUserModel

+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"result":[UserArrayModel class]};
}

@end

@implementation UserArrayModel

@end
