//
//  ViewController.m
//  SVGADemo
//
//  Created by 栗子 on 2018/12/14.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/    https://github.com/lrxlizi/     https://blog.csdn.net/qq_33608748. All rights reserved.
//

#import "ViewController.h"
#import "AnimShowViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray  *animArr;
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.animArr              = @[@"angel",@"EmptyState",
                                  @"halloween",@"HamburgerArrow",
                                  @"heartbeat",@"kingset",
                                  @"PinJump",@"posche",
                                  @"rose",@"TwitterHeart",
                                  @"Walkthrough"];
    
    self.tableView            = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate   = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
  
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.animArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IDCELL"];
    if (!cell) {
        cell              = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"IDCELL"];
    }
    cell.textLabel.text   = self.animArr[indexPath.row];
    cell.selectionStyle   = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AnimShowViewController *animShow = [AnimShowViewController new];
    animShow.type                    = self.animArr[indexPath.row];
    animShow.animAll                 = self.animArr;
    [self.navigationController pushViewController:animShow animated:YES];
    
}

@end
