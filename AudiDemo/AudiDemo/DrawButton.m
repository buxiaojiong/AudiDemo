//
//  DrawButton.m
//  AudiDemo
//
//  Created by sourcecode on 16/1/27.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "DrawButton.h"

@implementation DrawButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)layoutSubviews {
    [super layoutSubviews];
    
    // Center image
    CGPoint center = self.imageView.center;
    center.x = self.frame.size.width/2;
    center.y = self.imageView.frame.size.height/2;
    self.imageView.center = center;
    
    //Center text
    CGRect newFrame = [self titleLabel].frame;
    newFrame.origin.x = 0;
    newFrame.origin.y = self.imageView.frame.size.height-15;
    newFrame.size.width = self.frame.size.width;
    newFrame.size.height = 40;
    
    self.titleLabel.frame = newFrame;
    
//    [self.titleLabel sizeToFit];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

@end
