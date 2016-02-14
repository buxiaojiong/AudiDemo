//
//  TouchImageView.h
//  AudiDemo
//
//  Created by sourcecode on 16/2/2.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ImageViewDelegate
@optional

-(void)TouchesBegin:(NSInteger)imageTag;

@end

@interface TouchImageView : UIImageView
@property (nonatomic,assign) id<ImageViewDelegate> delegate;
@end
