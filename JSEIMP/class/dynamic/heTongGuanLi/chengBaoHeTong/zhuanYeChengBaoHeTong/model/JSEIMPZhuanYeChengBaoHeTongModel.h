//
//  JSEIMPZhuanYeChengBaoHeTongModel.h
//  JSEIMP
//
//  Created by 朱建超 on 2017/12/11.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZhuanYeChengBaoHeTongModel : NSObject

@property(nonatomic,strong)NSString *ContractId;

@property(nonatomic,strong)NSString *ContractName;

@property(nonatomic,assign)NSInteger Status;

@end

@interface JSEIMPZhuanYeChengBaoHeTongModel : NSObject

@property(nonatomic,strong)NSMutableArray<ZhuanYeChengBaoHeTongModel *> *ContractList;

@property(nonatomic,assign)NSInteger Code;

@end
