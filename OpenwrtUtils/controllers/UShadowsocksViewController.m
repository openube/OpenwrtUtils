//
//  UShadowsocksViewController.m
//  OpenwrtUtils
//
//  Created by 陈鼎星 on 2017/5/15.
//  Copyright © 2017年 陈鼎星. All rights reserved.
//

#import "UShadowsocksViewController.h"
#import "URouterConfig.h"

@interface UShadowsocksViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datasource;
@end

@implementation UShadowsocksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Shadowsocks";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(backBarButtonPressed:)];

    self.datasource = [NSMutableArray array];

    [self.view addSubview:self.tableView];

//    [[URouterConfig sharedInstance] showSystemInfo:^(NSDictionary *systemInfo) {
//      self.systemInfo = systemInfo;
//    }];
//
//    [[URouterConfig sharedInstance] showSystemBoard:^(NSDictionary *systemBoard) {
//      self.systemBoard = systemBoard;
//      [self.tableView reloadData];
//    }];
//    
//    //在多线程里执行长时间操作，在主线程刷新界面
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [[URouterConfig sharedInstance] showDiskInfo:^(NSDictionary *diskInfo) {
//            self.diskInfo = diskInfo;
//        }];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.tableView reloadData];
//        });
//    });
}

- (void)backBarButtonPressed:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource && UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return 4;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 11, 150, 21)];
            label.text = @"启用";
            cell.accessoryType = UITableViewCellAccessoryNone;
            [cell.contentView addSubview:label];
            
            UISwitch *enabled = [[UISwitch alloc] initWithFrame:CGRectMake(320, 7, 0, 0)];
            [enabled setOn:YES];
            [cell.contentView addSubview:enabled];
        }
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 11, 150, 21)];
            label.text = @"服务器地址";
            cell.accessoryType = UITableViewCellAccessoryNone;
            [cell.contentView addSubview:label];
        }
        if (indexPath.row == 1) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 11, 150, 21)];
            label.text = @"服务器端口";
            cell.accessoryType = UITableViewCellAccessoryNone;
            [cell.contentView addSubview:label];
            
//            if (self.systemInfo) {
//                UILabel *labelDesp = [[UILabel alloc] initWithFrame:CGRectMake(120, 11, 250, 21)];
//                labelDesp.textAlignment = NSTextAlignmentRight;
//                labelDesp.text = self.systemBoard[@"release"][@"description"];
//                [cell.contentView addSubview:labelDesp];
//            }
        }
        if (indexPath.row == 2) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 11, 150, 21)];
            label.text = @"密码";
            cell.accessoryType = UITableViewCellAccessoryNone;
            [cell.contentView addSubview:label];
            
//            if (self.systemInfo) {
//                UILabel *labelUptime = [[UILabel alloc] initWithFrame:CGRectMake(120, 11, 250, 21)];
//                labelUptime.textAlignment = NSTextAlignmentRight;
//                int num_seconds = [self.systemInfo[@"uptime"] intValue];
//                
//                int days = num_seconds / (60 * 60 * 24);
//                num_seconds -= days * (60 * 60 * 24);
//                int hours = num_seconds / (60 * 60);
//                num_seconds -= hours * (60 * 60);
//                int minutes = num_seconds / 60;
//                num_seconds -= minutes * 60;
//                if (days > 0) {
//                    labelUptime.text = [NSString stringWithFormat:@"%d天%d小时%d分钟%d秒", days, hours, minutes, num_seconds];
//                } else if (hours > 0){
//                    labelUptime.text = [NSString stringWithFormat:@"%d小时%d分钟%d秒", hours, minutes, num_seconds];
//                } else if (minutes > 0){
//                    labelUptime.text = [NSString stringWithFormat:@"%d分钟%d秒", minutes, num_seconds];
//                } else {
//                    labelUptime.text = [NSString stringWithFormat:@"%d秒", num_seconds];
//                }
//                [cell.contentView addSubview:labelUptime];
//            }
        }
        if (indexPath.row == 3) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 11, 150, 21)];
            label.text = @"加密方式";
            cell.accessoryType = UITableViewCellAccessoryNone;
            [cell.contentView addSubview:label];
            
//            if (self.diskInfo) {
//                UILabel *labelTotal = [[UILabel alloc] initWithFrame:CGRectMake(120, 11, 250, 21)];
//                labelTotal.textAlignment = NSTextAlignmentRight;
//                labelTotal.text = self.diskInfo[@"total"];
//                [cell.contentView addSubview:labelTotal];
//            }
        }
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

#pragma mark -

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

@end