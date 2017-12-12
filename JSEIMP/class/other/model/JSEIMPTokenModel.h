//
//  JSEIMPTokenModel.h
//  JSEIMP
//
//  Created by 朱建超 on 2017/12/4.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSEIMPTokenModel : NSObject

@property(nonatomic,strong)NSString *access_token;

@property(nonatomic,strong)NSString *expires_in;

@property(nonatomic,strong)NSString *token_type;

@end
