//
//  moveImageView.h
//  AudiDemo
//
//  Created by sourcecode on 16/1/28.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol moveImageViewDelegate <NSObject>

@optional
- (void)animalViewTouchesBegan:(UIImageView *)sender;
- (void)animalViewTouchesMoved:(UIImageView *)sender;
- (void)animalViewTouchesEnded:(UIImageView *)sender;

@end

@interface moveImageView : UIImageView

@property (nonatomic,weak)id<moveImageViewDelegate>delegate;

@end
