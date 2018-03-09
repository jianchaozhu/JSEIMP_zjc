//
//  JSEIMPOtherShouRuHeTongModel.h
//  JSEIMP
//
//  Created by 朱建超 on 2018/3/9.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OtherShouRuHeTongModel : NSObject

@property(nonatomic,strong)NSString *ContractId;

@property(nonatomic,strong)NSString *ContractName;

@property(nonatomic,assign)NSInteger Status;

@end

@interface JSEIMPOtherShouRuHeTongModel : NSObject

@property(nonatomic,strong)NSMutableArray<OtherShouRuHeTongModel *> *ContractList;

@property(nonatomic,assign)NSInteger Code;

@end
