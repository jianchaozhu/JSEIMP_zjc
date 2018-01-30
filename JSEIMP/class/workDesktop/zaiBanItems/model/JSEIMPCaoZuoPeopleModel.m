//
//  JSEIMPCaoZuoPeopleModel.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/1/25.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPCaoZuoPeopleModel.h"

@implementation JSEIMPCaoZuoPeopleModel

+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"result":[GetCaoZuoPeopleModel class]};
}

@end

@implementation GetCaoZuoPeopleModel

+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"items":[GetCaoZuoPeopleArrayModel class]};
}

@end

@implementation GetCaoZuoPeopleArrayModel

@end
