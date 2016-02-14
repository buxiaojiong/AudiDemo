//
//  AppDelegate.h
//  AudiDemo
//
//  Created by sourcecode on 16/1/25.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,AVPlayerViewControllerDelegate>
{
    AVPlayerViewController *moviePlayerController;
}

@property (strong, nonatomic) UIWindow *window;


@end

