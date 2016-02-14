//
//  TouchImageView.m
//  AudiDemo
//
//  Created by sourcecode on 16/2/2.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "TouchImageView.h"

@implementation TouchImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //NSLog(@"delegate:%@",self.delegate);
    [self.delegate TouchesBegin:self.tag];
}

@end
