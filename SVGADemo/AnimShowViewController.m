//
//  AnimShowViewController.m
//  SVGADemo
//
//  Created by 栗子 on 2018/12/14.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/    https://github.com/lrxlizi/     https://blog.csdn.net/qq_33608748. All rights reserved.
//

#import "AnimShowViewController.h"

@interface AnimShowViewController ()
@property (nonatomic,strong)SVGAPlayer *player;
@property (nonatomic,strong) SVGAParser *parser;
@property (nonatomic, assign) NSInteger count;

@end

@implementation AnimShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   self.view.backgroundColor = [UIColor blackColor];
   self.parser = [[SVGAParser alloc]init];
    self.player = [[SVGAPlayer alloc]initWithFrame:CGRectMake(0,100, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:self.player];
    [self.parser parseWithNamed:self.type inBundle:[NSBundle mainBundle] completionBlock:^(SVGAVideoEntity * _Nonnull videoItem) {
        if (videoItem != nil) {
            self.player.videoItem = videoItem;
            [self.player startAnimation];
        }
    } failureBlock:^(NSError * _Nonnull error) {
        
    }];
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-100,SCREEN_HEIGHT - 50, 100, 30)];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn setTitle:@"下一个" forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(btnClicekd) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)btnClicekd{
    NSString *avga;
    if (self.animAll.count>self.count) {
       avga = self.animAll[self.count];
    }else{
        avga = self.animAll[0];
        self.count = 0;
    }
    self.count++;
    [self.parser parseWithNamed:avga inBundle:[NSBundle mainBundle] completionBlock:^(SVGAVideoEntity * _Nonnull videoItem) {
        if (videoItem != nil) {
            self.player.videoItem = videoItem;
            [self.player startAnimation];
        }
    } failureBlock:^(NSError * _Nonnull error) {
        
    }];
    
}

/**
 
 如果你感觉设计师您的SVGA文件中的某个图片不是很好或者是想替换再或者添加一些文字之类的 找设计师重新做一分是不是太浪费时间和资源了
 以下方法帮你1秒替换你想要替换的图片
 //替换sample-1_0 中的某个图片 到SVGA Animation 官网 --->立即体验 --->选择文件(把SVGA文件导入)--->浏览素材 找到图片对应的key
 替换图片
 方法1
 CALayer *iconLayer = [CALayer layer];
 iconLayer.cornerRadius = 84.0;
 iconLayer.masksToBounds = YES;
 iconLayer.borderWidth = 4.0;
 iconLayer.borderColor = [UIColor colorWithRed:0xea/255.0 green:0xb3/255.0 blue:0x7d/255.0 alpha:1.0].CGColor;
 [player setImage:[UIImage imageNamed:@"img_11"] forKey:@"toufa" referenceLayer:iconLayer];
 
 方法2
 [player setImage:[UIImage imageNamed:@"img_11"] forKey:@"GuangHuan"]
 
 方法3
 [player setImageWithURL:[NSURL URLWithString:@"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1394810059,1006539018&fm=200&gp=0.jpg"] forKey:@"GuangHuan"];
 
 动态添加文字
 NSShadow * shadow = [ NSShadow  new ];
 shadow .shadowColor = [UIColor blackColor ];
 shadow .shadowOffset = CGSizeMake(0, 1);
 NSAttributedString *text = [[NSAttributedString alloc]initWithString:@"快乐跑" attributes:@{
 NSForegroundColorAttributeName :[UIColor redColor],
 NSFontAttributeName:[UIFont boldSystemFontOfSize:20],
 NSShadowAttributeName:shadow
 }];
 [self.player setAttributedText:text forKey:@"GuangHuan"];
 
具体使用可以预览https://blog.csdn.net/qq_33608748/article/details/84791617
 
 */



@end
