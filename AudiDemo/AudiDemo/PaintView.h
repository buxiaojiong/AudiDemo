//
//  PaintView.h
//  PaintDemo
//
//  Created by delacro on 12-5-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaintView : UIView

@property(nonatomic,retain) UIColor *paintColor;
@property(nonatomic,assign) BOOL erase;
@property (nonatomic,strong) NSMutableArray *linesArray;
@property (nonatomic,strong)UIImageView *penView;
@property (nonatomic,strong)UIImageView *radiererView;
@end
