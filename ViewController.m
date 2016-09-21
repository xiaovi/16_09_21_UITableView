//
//  ViewController.m
//  16_09_21_UITableView
//
//  Created by 姚懿恒 on 16/9/21.
//  Copyright © 2016年 姚懿恒. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:[self loadTableView]];

}
-(UITableView *)loadTableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds
                                                  style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma mark 以下为数据源方法


#pragma mark 一共有多少组数据
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

#pragma mark 每组数据中有多少行数据
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 4;
    }else{
        return 3;
    }
}

#pragma mark 每一行具体有什么数据
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    NSString *text = nil;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            text = @"婀娜";
        }else if (indexPath.row == 3){
            text = @"多姿";
        }
    }else{
        if (indexPath.row == 0) {
            text = @"小桥";
        }else if (indexPath.row == 2){
            text = @"大桥";
        }
    }

    cell.textLabel.text = text;

    return cell;
}


@end
