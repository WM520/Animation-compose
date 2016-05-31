//
//  ViewController.m
//  PopDemo
//
//  Created by David on 16/5/31.
//  Copyright © 2016年 WM. All rights reserved.
//

#import "ViewController.h"

static NSString *cellID = @"cell";

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation ViewController


- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array = @[  @"Transform3D",
                         @"lineation",
                         @"CAEmitterLayer",
                         @"POP",
                         @"Easing",
                         @"Replicator",
                         @"Emitter",
                         @"PresentLayer",
                         @"Transition",
                         @"DrawRect",
                         @"Crumbling",
                         @"TextAnimation",
                         @"CoolLabel",
                         ];
    self.dataArray = [NSMutableArray arrayWithArray:array];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:self.dataArray[indexPath.row] sender:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
