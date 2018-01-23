//
//  JSEIMPDaiBanItemDetailModel.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/1/19.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPDaiBanItemDetailModel.h"

@implementation JSEIMPDaiBanItemDetailModel

+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"ContractDetails":[DaiBanItemDetaillModel class],@"Files":[DaiBanItemDetailArraylModel class]};
    
}

@end

@implementation DaiBanItemDetaillModel

@end

@implementation DaiBanItemDetailArraylModel

@end
