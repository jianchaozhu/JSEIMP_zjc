//
//  JSEIMPGetTargetActivityIdModel.h
//  JSEIMP
//
//  Created by 朱建超 on 2018/1/24.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetTargetActivityIdArrayModel : NSObject

//targetActivityId
@property(nonatomic,strong)NSString *to;

@end

@interface GetTargetActivityIdModel : NSObject

@property(nonatomic,strong)NSMutableArray<GetTargetActivityIdArrayModel *> *items;

@end

@interface JSEIMPGetTargetActivityIdModel : NSObject

@property(nonatomic,strong)GetTargetActivityIdModel *result;

@end
