//
//  ViewController.m
//  PCBanner
//
//  Created by Abe_liu on 2017/12/1.
//  Copyright © 2017年 Abe_liu. All rights reserved.
//

#import "ViewController.h"
#import "NewsBanner.h"

@interface ViewController ()<NewsBannerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NewsBanner *banner=[[NewsBanner alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 30)];
    banner.newsBannerDelegate=self;
    banner.center=self.view.center;
    banner.duration=2.0f;
    banner.bannerList=@[@"现在是滚动显示第一条",@"现在是滚动显示的第二条",@"现在显示的是第三条",@"现在显示的是第四条"];
    [banner start];
    [self.view addSubview:banner];
    
    
}
-(void)newsBanner:(NewsBanner *)newsBanner didSelectIndex:(NSInteger)selectIndex{
    NSLog(@"selectedIndex%ld",selectIndex);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
