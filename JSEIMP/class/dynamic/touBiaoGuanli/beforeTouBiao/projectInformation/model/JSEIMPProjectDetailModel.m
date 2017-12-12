//
//  JSEIMPProjectDetailModel.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/11/24.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPProjectDetailModel.h"
#import <MJExtension.h>

@implementation JSEIMPProjectDetailModel

+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"ProjectDetails":[ProjectDetailModel class]};
    
}

@end

@implementation ProjectDetailModel

@end
