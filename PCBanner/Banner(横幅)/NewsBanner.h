//
//  NewsBanner.h
//  Abe UI
//
//  Created by topfuture on 2017/10/17.
//  Copyright © 2017年 abe_liu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsBanner;
@protocol NewsBannerDelegate<NSObject>

- (void)newsBanner:(NewsBanner *)newsBanner didSelectIndex:(NSInteger)selectIndex;

@end
@interface NewsBanner : UIView

/**
 数据源
 */
@property(nonatomic,strong)NSArray *bannerList;

/**
 滚动时间
 */
@property(nonatomic,assign)NSTimeInterval  duration;

/**
 显示label
 */
@property(nonatomic,strong)UILabel *bannerLabel;
@property(nonatomic,weak)id<NewsBannerDelegate>newsBannerDelegate;


-(void)start;
@end
