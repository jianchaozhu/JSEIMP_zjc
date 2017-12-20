//
//  JSEIMPNewChengBaoFanWeiView.h
//  JSEIMP
//
//  Created by 朱建超 on 2017/11/15.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JSEIMPNewChengBaoFanWeiViewDelegate <NSObject>

-(void)changeScrollViewFrame;

-(void)recoverScrollViewFrame;

@end

@interface JSEIMPNewChengBaoFanWeiView : UIView

@property(nonatomic,strong)UITextView *chengBaoFanTextView;

@property(nonatomic,strong) UILabel *chengBaoFanWeiPlaceLabel;

@property(nonatomic,weak)id <JSEIMPNewChengBaoFanWeiViewDelegate> delagete;

@end
