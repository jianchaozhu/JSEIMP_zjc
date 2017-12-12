//
//  JSEIMPAplicationController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/9/5.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPAplicationController.h"
#import <SDCycleScrollView.h>

#define ScreenW [UIScreen mainScreen].bounds.size.width

@interface JSEIMPAplicationController ()<SDCycleScrollViewDelegate>

@end

@implementation JSEIMPAplicationController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"应用";
    
    [self setupUI];
    
}

-(void)setupUI{

    NSArray *imageNames = @[@"h1",
                            @"h2",
                            @"h3",
                            @"h4",
                            ];
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 64, ScreenW, 180) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
    
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    cycleScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:cycleScrollView];
    
    cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
//    CGFloat buttonH = 60;
//    CGFloat buttonW = 50;
//    
//    int lieNum = 4;
//    
//    CGFloat jianJu = (self.view.frame.size.width - 200) / 5;
//    
//    NSArray *imageNameArray = @[@"sheBeiGuanLi",@"wuZiGuanLi",@"caiGouGuanLi",@"tuZhiGuanLi",@"jiXiaoGuanLi",@"knowledge",@"sheJiGuanLi",@"shengJiGuanLi",@"yunWeiGuanLi",@"HRGuanLi",@"guanLiJiaShiCang"];
//    
//    NSArray *labelTitleArray = @[@"设备管理",@"物资管理",@"采购管理",@"图纸管理",@"绩效管理",@"知识管理",@"设计管理",@"审计管理",@"运维管理",@"HR管理",@"管理驾驶舱"];
//    
//    for (int i = 0; i < labelTitleArray.count; i++) {
//        
//        int hang = i / lieNum;
//        int lie = i % lieNum;
//        
//        CGFloat buttonX = jianJu + (jianJu + buttonW) * lie;
//        CGFloat buttonY = jianJu + (jianJu + buttonH) * hang;
//        
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        
//        button.frame = CGRectMake(buttonX, buttonY + 240, buttonW, buttonH);
//        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
//        [button setImage:[UIImage imageNamed:imageNameArray[i]] forState:UIControlStateNormal];
//        
//        button.titleLabel.font = [UIFont systemFontOfSize:14];
//        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//        [button setTitle:labelTitleArray[i] forState:UIControlStateNormal];
//        [button setTitleEdgeInsets:UIEdgeInsetsMake(50 ,-60.0, 0.0, -30.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
//        
//        [button setImageEdgeInsets:UIEdgeInsetsMake(-15, 10, 0.0, 0.0)];//图片距离右边框距离减少图片的宽度，其它不边
//        
//        [self.view addSubview:button];
//        
//    }
    
}

@end
