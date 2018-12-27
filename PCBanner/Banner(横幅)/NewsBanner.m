//
//  NewsBanner.m
//  Abe UI
//
//  Created by topfuture on 2017/10/17.
//  Copyright © 2017年 abe_liu. All rights reserved.
//

#import "NewsBanner.h"
@interface NewsBanner()
@property(nonatomic,assign)NSInteger pageCount;
@end
@implementation NewsBanner

- (instancetype)initWithFrame:(CGRect)frame {
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.clipsToBounds = YES;
        self.bannerLabel = [UILabel new];
        self.bannerLabel.font = [UIFont systemFontOfSize:16];
        self.bannerLabel.textColor = [UIColor blackColor];
        self.bannerLabel.userInteractionEnabled = YES;
        self.bannerLabel.frame=CGRectMake(0,(frame.size.height-16)/2.0 , frame.size.width, 20);
        [self addSubview:self.bannerLabel];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        [self.bannerLabel addGestureRecognizer:tap];
    }
    return self;
}
- (void)setBannerList:(NSArray *)bannerList {
    
    if (_bannerList!=bannerList) {
        _bannerList =[[NSArray alloc]init];
        _bannerList=bannerList;
        if (_bannerList.count!=0) {
            _bannerLabel.text=_bannerList[0];
        }
    }
}
- (void)tap:(UILabel *)laber {
    if (self.newsBannerDelegate &&[self.newsBannerDelegate respondsToSelector:@selector(newsBanner:didSelectIndex:)]) {
        [self.newsBannerDelegate newsBanner:self didSelectIndex:self.pageCount];
    }
    
}

- (void)start {
    if (self.bannerList.count!=0) {
        [NSTimer scheduledTimerWithTimeInterval:self.duration target:self selector:@selector(displayLabel) userInfo:nil repeats:YES];
    }
    
}
- (void)displayLabel {
    self.pageCount++;
    if (self.pageCount>=self.bannerList.count) {
        self.pageCount=0;
    }
    CATransition *animation = [CATransition animation];
    animation.duration = 0.5f ;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = YES;
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromTop;
    [self.bannerLabel.layer addAnimation:animation forKey:@"animationID"];
    self.bannerLabel.text = self.bannerList[self.pageCount];
    
}

@end
