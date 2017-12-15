//
//  JSEIMPZhuanYeFenBaoHeTongModel.h
//  JSEIMP
//
//  Created by 朱建超 on 2017/12/15.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZhuanYeFenBaoHeTongModel : NSObject

@property(nonatomic,strong)NSString *ContractId;

@property(nonatomic,strong)NSString *ContractName;

@property(nonatomic,assign)NSInteger Status;

@end

@interface JSEIMPZhuanYeFenBaoHeTongModel : NSObject

@property(nonatomic,strong)NSMutableArray<ZhuanYeFenBaoHeTongModel *> *ContractList;

@property(nonatomic,assign)NSInteger Code;

@end
