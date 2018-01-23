//
//  JSEIMPZaiBanItemsModel.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/1/23.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPZaiBanItemsModel.h"

@implementation JSEIMPZaiBanItemsModel

+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"result":[ZaiBanItemsModel class]};
}

@end

@implementation ZaiBanItemsModel

+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"items":[ZaiBanItemsArrayModel class]};
}

@end

@implementation ZaiBanItemsArrayModel

+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"dataFields":[ZaiBanItemsDataFieldsArrayModel class]};
}

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

@end

@implementation ZaiBanItemsDataFieldsArrayModel

@end
