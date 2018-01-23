//
//  JSEIMPDaiBanItemsModel.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/1/12.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPDaiBanItemsModel.h"

@implementation JSEIMPDaiBanItemsModel

+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"result":[DaiBanItemsModel class]};
}

@end

@implementation DaiBanItemsModel

+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"items":[DaiBanItemsArrayModel class]};
}

@end

@implementation DaiBanItemsArrayModel

+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"dataFields":[DaiBanItemsDataFieldsArrayModel class]};
}

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

@end

@implementation DaiBanItemsDataFieldsArrayModel

@end
