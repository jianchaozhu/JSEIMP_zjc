//
//  JSEIMPFuJianView.m
//  JSEIMP
//
//  Created by 朱建超 on 2017/11/7.
//  Copyright © 2017年 朱建超. All rights reserved.
//

#import "JSEIMPFuJianView.h"
#import <AFNetworking.h>

static NSString *cellID = @"cellID";

@interface JSEIMPFuJianView ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *fileNameMArray;

@property(nonatomic,strong)NSMutableArray *filePathMArray;

@property(nonatomic,assign)NSInteger row;

@end

@implementation JSEIMPFuJianView{
    
    UITableViewCell *_cell;
    
}

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        self.delegate = self;
        self.dataSource= self;
        
        [self setupUI];
    }

    return self;
}

-(void)setupUI{

    //注册通知
    [self setNotification];

}

-(void)setNotification{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fileNameMArray:) name:@"fileNameMArray" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(filePathMArray:) name:@"filePathMArray" object:nil];
    
}

-(void)fileNameMArray:(NSNotification *)notification{
    
    _fileNameMArray = notification.object;

}

-(void)filePathMArray:(NSNotification *)notification{
    
    _filePathMArray = notification.object;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self downloadWithURLString:_filePathMArray[indexPath.row] fileName:_fileNameMArray[indexPath.row]];
    
}


-(void)downloadWithURLString:(NSString *)urlString fileName:(NSString *)fileName{
    //创建会话管理者
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    manager.securityPolicy.validatesDomainName = NO;
    manager.securityPolicy.allowInvalidCertificates = YES;
    //确定请求路径
    NSURL *url=[NSURL URLWithString:urlString];
    //创建请求对象
    NSURLRequest *request=[NSURLRequest requestWithURL:url];

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSString *filePath = [path stringByAppendingPathComponent:fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL result = [fileManager fileExistsAtPath:filePath];
    
    if (result == YES) {
        
//        [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"exisFilePath" object:filePath];
//
    }else if (result == NO){
        
        //封装下载任务
        NSURLSessionDownloadTask *downloadTask=[manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
            //打印下载进度
            NSLog(@"%f",1.0*downloadProgress.completedUnitCount/downloadProgress.totalUnitCount);
            //这里的targetPath是文件存储的临时路径（不安全的）
        } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
            //拼接安全的文件路径
            
            _path=[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:fileName];
            //返回路径的url
            
            return [NSURL fileURLWithPath:_path];
            //下载完成后调用 这里的filePath是文件最终的存储路径
        } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
            
            if (error) {
                
                NSLog(@"%@",error);
            }
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"filePath" object:_path];
            
            NSLog(@"%@",filePath);
        }];
        //提交请求
        [downloadTask resume];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _fileNameMArray.count;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 50;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    _cell= [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (_cell == nil) {
        
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
    }

    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [_cell.imageView setImage:[UIImage imageNamed:@"word"]];
    _cell.textLabel.text = _fileNameMArray[indexPath.row];
    _cell.textLabel.numberOfLines = 0;
    _cell.textLabel.font = [UIFont systemFontOfSize:16];
    
    return _cell;

}

-(void)layoutIfNeeded{

    [super layoutIfNeeded];

}

@end
