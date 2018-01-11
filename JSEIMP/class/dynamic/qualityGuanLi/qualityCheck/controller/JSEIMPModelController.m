//
//  JSEIMPModelController.m
//  JSEIMP
//
//  Created by 朱建超 on 2018/1/9.
//  Copyright © 2018年 朱建超. All rights reserved.
//

#import "JSEIMPModelController.h"
#import "JSEIMPNetWorking.h"
#import "JSEIMPNewQualityCheckController.h"

@interface JSEIMPModelController ()

@end

@implementation JSEIMPModelController{
    
    UIWebView *_webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
    [self setupUI];
}

-(void)setupUI{
    
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    _webView.scrollView.bounces = NO;
    [self.view addSubview:_webView];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(self.view.center.x, 20, 200, 20);
    label.text = @"海棠华庭模型演示";
    label.textColor = [UIColor darkTextColor];
    [_webView addSubview:label];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    backButton.frame = CGRectMake(20, 20, 40, 30);
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(clickBackButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [_webView addSubview:backButton];
    
    [JSEIMPNetWorking getDaXiangYunTokenwithSuccessBlock:^(NSString *finalURLString){
        
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:finalURLString]]];
    }];
}

-(void)clickBackButton:(UIButton *)button{
    
    for(UIViewController *controller in self.navigationController.viewControllers) {
        
        if([controller isKindOfClass:[JSEIMPNewQualityCheckController class]]) {
            
            self.navigationController.navigationBarHidden = NO;
            
            [self.navigationController popToViewController:controller animated:YES];
        }
    }
}

@end
