//
//  JSEIMPBaoBiaoDetailController.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/10/25.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPBaoBiaoDetailController.h"
#import <AFNetworking.h>
#import <QuickLook/QuickLook.h>
#import <Masonry.h>

#define UIScreenW [UIScreen mainScreen].bounds.size.width
#define UIScreenH [UIScreen mainScreen].bounds.size.height

@interface JSEIMPBaoBiaoDetailController ()<UIDocumentInteractionControllerDelegate>

@property(nonatomic,strong)NSString *path;

@property(nonatomic,strong)NSString *fileNameString;

@end

@implementation JSEIMPBaoBiaoDetailController{

    UIScrollView *_scrollView;
    
    UIView *_view;
    
    UILabel *_label1;
    
    UILabel *_projectNameLabel;

    UILabel *_label2;
    
    UILabel *_buildMoneyLabel;
    
    UILabel *_label3;
    
    UILabel *_buildMianJiLabel;
    
    UILabel *_label4;
    
    UILabel *_moneyFromLabel;
    
    UILabel *_label5;
    
    UILabel *_projectManagerLabel;
    
    UILabel *_label6;
    
    UILabel *_kaiGongDateLabel;
    
    UILabel *_label7;
    
    UILabel *_junGongDataLabel;
    
    UILabel *_label8;
    
    UILabel *_buildCompanyLabel;
    
    UILabel *_label9;
    
    UILabel *_areaLabel;
    
    UILabel *_label10;
    
    UILabel *_zhongBiaoNoteLabel;
    
    UILabel *_label11;
    
    UILabel *_heTongLabel;
    
    UILabel *_label12;
    
    UILabel *_junGongYanShouBaoGaoLabel;
    
    UILabel *_label13;
    
    UILabel *_jiangXiangLabel;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = _projectName;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
    //添加右边的按钮
    UIBarButtonItem *baoBiaoButton = [[UIBarButtonItem alloc] initWithTitle:@"预览报表" style:UIBarButtonItemStyleDone target:self action:@selector(clickButton)];
    
    self.navigationItem.rightBarButtonItem = baoBiaoButton;
    
    [self setupUI];
    
}

-(void)clickButton{
    
    [self download];
    
}

//下载任务
-(void)download{
    //创建会话管理者
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    manager.securityPolicy.validatesDomainName = NO;
    manager.securityPolicy.allowInvalidCertificates = YES;
    //确定请求路径
    NSURL *url=[NSURL URLWithString:@"http://192.168.2.55:8080/Upload/2017/8/17/1024.xlsx"];
    //创建请求对象
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    _fileNameString = [_projectName stringByAppendingString:@".xlsx"];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSString *filePath = [path stringByAppendingPathComponent:_fileNameString];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL result = [fileManager fileExistsAtPath:filePath];
    
    if (result == YES) {
        
//        [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
        
        [self setupLookViewWithPath:filePath];
    }else if (result == NO){
    
        //封装下载任务
        NSURLSessionDownloadTask *downloadTask=[manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
            //打印下载进度
            NSLog(@"%f",1.0*downloadProgress.completedUnitCount/downloadProgress.totalUnitCount);
            //这里的targetPath是文件存储的临时路径（不安全的）
        } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
            //拼接安全的文件路径
            
            _path=[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:_fileNameString];
            //返回路径的url
            
            return [NSURL fileURLWithPath:_path];
            //下载完成后调用 这里的filePath是文件最终的存储路径
        } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
            
            if (error) {
                
                NSLog(@"%@",error);
            }
            
            [self setupLookViewWithPath:_path];
            
            NSLog(@"%@",filePath);
        }];
        //提交请求
        [downloadTask resume];
    }
}

- (void)returnAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller

{
    
    return 1;
}

-(void)setupLookViewWithPath:(NSString *)path{

    NSURL *url = [NSURL fileURLWithPath:path];
    
    UIDocumentInteractionController *interactionController = [UIDocumentInteractionController interactionControllerWithURL:url];
    interactionController.delegate = self;
    
    //预览有其他软件打开按钮
    [interactionController presentPreviewAnimated:YES];
    
//    CGRect navRect = self.navigationController.navigationBar.frame;
//    navRect.size =CGSizeMake(1500.0f,40.0f);
//    
//    //直接显示包含预览的菜单项
//    [interactionController presentOptionsMenuFromRect:navRect inView:_view animated:YES];

}

-(UIViewController *)documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)controller{
    return self;
}
-(UIView *)documentInteractionControllerViewForPreview:(UIDocumentInteractionController *)controller{
    return _view;
}
-(CGRect)documentInteractionControllerRectForPreview:(UIDocumentInteractionController *)controller{
    return  _view.frame;
}

-(void)setupUI{
    
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:_scrollView];
    
    _view = [[UIView alloc] initWithFrame:_scrollView.bounds];
    
    _view.backgroundColor = [UIColor whiteColor];
    
    [_scrollView addSubview:_view];
    
    _label1 = [self setupLabelWithText:@"项目名称" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _projectNameLabel = [self setupLabelWithText:_projectName TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _projectNameLabel.numberOfLines = 0;
    _projectNameLabel.textAlignment = NSTextAlignmentRight;
    
    _label2 = [self setupLabelWithText:@"工程造价(万元)" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _buildMoneyLabel = [self setupLabelWithText:_projectBuildMoney TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _buildMoneyLabel.textAlignment = NSTextAlignmentRight;
    
    _label3 = [self setupLabelWithText:@"建筑面积(平方米)" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _buildMianJiLabel = [self setupLabelWithText:_buildMianJi TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _buildMianJiLabel.textAlignment = NSTextAlignmentRight;
    
    _label4 = [self setupLabelWithText:@"资金来源" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _moneyFromLabel = [self setupLabelWithText:@"私（民）营投资" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _moneyFromLabel.textAlignment = NSTextAlignmentRight;
    
    _label5 = [self setupLabelWithText:@"项目经理" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _projectManagerLabel = [self setupLabelWithText:@"姚辉" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _projectManagerLabel.textAlignment = NSTextAlignmentRight;
    
    _label6 = [self setupLabelWithText:@"开工日期" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _kaiGongDateLabel = [self setupLabelWithText:@"2006-05-16" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _kaiGongDateLabel.textAlignment = NSTextAlignmentRight;
    
    _label7 = [self setupLabelWithText:@"竣工日期" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _junGongDataLabel = [self setupLabelWithText:@"2010-01-18" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _junGongDataLabel.textAlignment = NSTextAlignmentRight;
    
    _label8 = [self setupLabelWithText:@"建设单位" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _buildCompanyLabel = [self setupLabelWithText:@"郑州新银科置业有限公司有限公司" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _buildCompanyLabel.numberOfLines = 0;
    _buildCompanyLabel.textAlignment = NSTextAlignmentRight;
    
    _label9 = [self setupLabelWithText:@"区域" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _areaLabel = [self setupLabelWithText:@"中原" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _areaLabel.textAlignment = NSTextAlignmentRight;
    
    _label10 = [self setupLabelWithText:@"中标通知书" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _zhongBiaoNoteLabel = [self setupLabelWithText:@"档案室" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _zhongBiaoNoteLabel.textAlignment = NSTextAlignmentRight;
    
    _label11 = [self setupLabelWithText:@"合同" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _heTongLabel = [self setupLabelWithText:@"档案室" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _heTongLabel.textAlignment = NSTextAlignmentRight;
    
    _label12 = [self setupLabelWithText:@"竣工验收报告" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _junGongYanShouBaoGaoLabel = [self setupLabelWithText:@"档案室" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _junGongYanShouBaoGaoLabel.textAlignment = NSTextAlignmentRight;
    
    _label13 = [self setupLabelWithText:@"奖项" TextColor:[UIColor darkTextColor] Font:[UIFont systemFontOfSize:20]];
    _jiangXiangLabel = [self setupLabelWithText:@"0" TextColor:[UIColor darkGrayColor] Font:[UIFont systemFontOfSize:16]];
    _jiangXiangLabel.textAlignment = NSTextAlignmentRight;
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.mas_equalTo(_view).offset(16);
        make.width.mas_equalTo(82);
    }];
    [_projectNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label1.mas_top);
        make.left.mas_equalTo(_label1.mas_right).offset(16);
        make.right.mas_equalTo(_view.mas_right).offset(-16);
        
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_projectNameLabel.mas_bottom).offset(16);
        make.left.mas_equalTo(_label1.mas_left);
        make.width.mas_equalTo(138);
    }];
    [_buildMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label2.mas_centerY);
        make.right.mas_equalTo(_projectNameLabel.mas_right);
        make.left.mas_equalTo(_label2.mas_right).offset(16);
        
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label2.mas_bottom).offset(16);
        make.left.mas_equalTo(_label2.mas_left);
        make.width.mas_equalTo(158);
    }];
    [_buildMianJiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label3.mas_centerY);
        make.right.mas_equalTo(_buildMoneyLabel.mas_right);
        make.left.mas_equalTo(_label3.mas_right).offset(16);
        
    }];
    
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label3.mas_bottom).offset(16);
        make.left.mas_equalTo(_label3.mas_left);
        
    }];
    [_moneyFromLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label4.mas_centerY);
        make.right.mas_equalTo(_projectNameLabel.mas_right);
        make.left.mas_equalTo(_projectNameLabel.mas_left);
        
    }];
    
    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label4.mas_bottom).offset(16);
        make.left.mas_equalTo(_label4.mas_left);
        
    }];
    [_projectManagerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label5.mas_centerY);
        make.right.mas_equalTo(_moneyFromLabel.mas_right);
        make.left.mas_equalTo(_moneyFromLabel.mas_left);
        
    }];
    
    [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label5.mas_bottom).offset(16);
        make.left.mas_equalTo(_label5.mas_left);
        
    }];
    [_kaiGongDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label6.mas_centerY);
        make.right.mas_equalTo(_projectManagerLabel.mas_right);
        make.left.mas_equalTo(_projectManagerLabel.mas_left);
        
    }];
    
    [_label7 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label6.mas_bottom).offset(16);
        make.left.mas_equalTo(_label6.mas_left);
        
    }];
    [_junGongDataLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label7.mas_centerY);
        make.right.mas_equalTo(_kaiGongDateLabel.mas_right);
        make.left.mas_equalTo(_kaiGongDateLabel.mas_left);
        
    }];
    
    [_label8 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label7.mas_bottom).offset(16);
        make.left.mas_equalTo(_label7.mas_left);
        
    }];
    [_buildCompanyLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label8.mas_top);
        make.right.mas_equalTo(_junGongDataLabel.mas_right);
        make.left.mas_equalTo(_junGongDataLabel.mas_left);
        
    }];
    
    [_label9 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_buildCompanyLabel.mas_bottom).offset(16);
        make.left.mas_equalTo(_label8.mas_left);
        make.width.mas_equalTo(42);
        
    }];
    [_areaLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label9.mas_centerY);
        make.right.mas_equalTo(_buildCompanyLabel.mas_right);
        make.left.mas_equalTo(_label9.mas_right).offset(16);
        
    }];
    
    [_label10 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label9.mas_bottom).offset(16);
        make.left.mas_equalTo(_label9.mas_left);
        make.width.mas_equalTo(102);
        
    }];
    [_zhongBiaoNoteLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label10.mas_centerY);
        make.right.mas_equalTo(_areaLabel.mas_right);
        make.left.mas_equalTo(_label10.mas_right).offset(16);
        
    }];
    
    [_label11 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label10.mas_bottom).offset(16);
        make.left.mas_equalTo(_label10.mas_left);
        
    }];
    [_heTongLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label11.mas_centerY);
        make.right.mas_equalTo(_areaLabel.mas_right);
        make.left.mas_equalTo(_areaLabel.mas_left);
        
    }];
    
    [_label12 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label11.mas_bottom).offset(16);
        make.left.mas_equalTo(_label11.mas_left);
        make.width.mas_equalTo(124);
        
    }];
    [_junGongYanShouBaoGaoLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label12.mas_centerY);
        make.right.mas_equalTo(_heTongLabel.mas_right);
        make.left.mas_equalTo(_label12.mas_right).offset(16);
        
    }];
    
    [_label13 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_label12.mas_bottom).offset(16);
        make.left.mas_equalTo(_label12.mas_left);
        
    }];
    [_jiangXiangLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_label13.mas_centerY);
        make.right.mas_equalTo(_heTongLabel.mas_right);
        make.left.mas_equalTo(_heTongLabel.mas_left);
        
    }];
    
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_equalTo(UIScreenW);
        make.bottom.mas_equalTo(_label13.mas_bottom).offset(16);
    }];
    
}

-(UILabel *)setupLabelWithText:(NSString *)text TextColor:(UIColor *)textColor Font:(UIFont *)font{
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    
    [_view addSubview:label];
    
    return label;
    
}

@end
