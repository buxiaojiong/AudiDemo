//
//  moveImageView.m
//  AudiDemo
//
//  Created by sourcecode on 16/1/28.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "moveImageView.h"

@implementation moveImageView
{
    CGPoint beginPoint;
}

- (void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    // Retrieve the touch point
    beginPoint = [[touches anyObject] locationInView:self]; //记录第一个点，以便计算移动距离
    
    if ([self.delegate respondsToSelector: @selector(animalViewTouchesBegan:)]) //设置代理类，在图像移动的时候，可以做一些处理
        [self.delegate animalViewTouchesBegan:self];
}
- (void) touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
    // Move relative to the original touch point
    // 计算移动距离，并更新图像的frame
    CGPoint pt = [[touches anyObject] locationInView:self];
    CGRect frame = [self frame];
    frame.origin.x += pt.x - beginPoint.x;
    frame.origin.y += pt.y - beginPoint.y;
    [self setFrame:frame];
    if ([self.delegate respondsToSelector: @selector(animalViewTouchesMoved:)])
        [self.delegate animalViewTouchesMoved:self];
}
- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if ([self.delegate respondsToSelector: @selector(animalViewTouchesEnded:)])
        [self.delegate animalViewTouchesEnded:self];
}

@end
