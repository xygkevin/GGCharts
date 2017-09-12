//
//  GGBarData.m
//  GGCharts
//
//  Created by 黄舜 on 17/9/12.
//  Copyright © 2017年 I really is a farmer. All rights reserved.
//

#import "GGBarData.h"

@interface GGBarData () <BarDrawAbstract>
{
    DBarScaler * barScaler;
}

@end

@implementation GGBarData

/**
 * 初始化方法
 */
- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
        self.barWidth = 5;
        self.barFillColor = [UIColor blackColor];
        self.offSetRatio = CGPointMake(-.5f, -1.0f);
    }
    
    return self;
}

/**
 * 绘制折线点
 */
- (CGPoint *)points
{
    return self.lineBarScaler.linePoints;
}

/**
 * 柱状图结构体
 */
- (CGRect *)barRects
{
    return [(DBarScaler *)self.lineBarScaler barRects];
}

/**
 * 设置柱状图宽度
 */
- (void)setBarWidth:(CGFloat)barWidth
{
    _barWidth = barWidth;
    
    [(DBarScaler *)self.lineBarScaler setBarWidth:barWidth];
}

/**
 * 设置数据数组
 */
- (void)setDataAry:(NSArray<NSNumber *> *)dataAry
{
    [super setDataAry:dataAry];
    
    self.lineBarScaler.dataAry = dataAry;
}

/**
 * 柱状图底部价格
 */
- (void)setRoundNumber:(NSNumber *)roundNumber
{
    [super setRoundNumber:roundNumber];
    
    [(DBarScaler *)self.lineBarScaler setBottomPrice:roundNumber.floatValue];
}

/**
 * 柱状图定标器
 */
- (DLineScaler *)lineBarScaler
{
    if (barScaler == nil) {
        
        barScaler = [[DBarScaler alloc] init];
    }
    
    return barScaler;
}

@end
