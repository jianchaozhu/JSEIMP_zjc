//
//  JSEIMPGetTargetActivityIdModel.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/1/24.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPGetTargetActivityIdModel.h"

@implementation JSEIMPGetTargetActivityIdModel

+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"result":[GetTargetActivityIdModel class]};
}

@end

@implementation GetTargetActivityIdModel

+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"items":[GetTargetActivityIdArrayModel class]};
}

@end

@implementation GetTargetActivityIdArrayModel

@end
