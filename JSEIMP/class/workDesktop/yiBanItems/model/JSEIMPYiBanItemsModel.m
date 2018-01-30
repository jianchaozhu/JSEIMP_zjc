//
//  JSEIMPYiBanItemsModel.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/1/26.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPYiBanItemsModel.h"

@implementation JSEIMPYiBanItemsModel

+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"result":[YiBanItemsModel class]};
}

@end

@implementation YiBanItemsModel

+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"items":[YiBanItemsArrayModel class]};
}

@end

@implementation YiBanItemsArrayModel

+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"dataFields":[YiBanItemsDataFieldsArrayModel class]};
}

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

@end

@implementation YiBanItemsDataFieldsArrayModel

@end
