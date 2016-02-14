//
//  AppDelegate.m
//  AudiDemo
//
//  Created by sourcecode on 16/1/25.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
//    NSString * resourcePath = [[NSBundle mainBundle] resourcePath];
//    NSString * videoPath = [resourcePath stringByAppendingPathComponent:@"Audi_A7_Sportback_Preroll_16sek.mp4"];
//    NSURL *videoURL = [[NSURL alloc] initFileURLWithPath:videoPath];
    
//    AVPlayer *player = [AVPlayer playerWithURL:videoURL];
//    moviePlayerController = [[AVPlayerViewController alloc] init];
//    moviePlayerController.player = player;
//    moviePlayerController.videoGravity = AVLayerVideoGravityResizeAspectFill;
//    moviePlayerController.delegate = self;
//    moviePlayerController.showsPlaybackControls = NO;
//    moviePlayerController.view.userInteractionEnabled = NO;
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:)name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
//    moviePlayerController.view.translatesAutoresizingMaskIntoConstraints = true;    //AVPlayerViewController 内部可能是用约束写的，这句可以禁用自动约束，消除报错
//    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScreen:)];
//    tap.numberOfTapsRequired = 1;
//    [moviePlayerController.contentOverlayView addGestureRecognizer:tap];
//    
//    self.window.rootViewController = moviePlayerController;
//    [self.window makeKeyAndVisible];
//    
//    [moviePlayerController.player play];
    MainViewController *mainVc = [[MainViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mainVc];
    
    self.window.rootViewController = nav;

//    self.window.rootViewController = [[MainViewController alloc] init];
    
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

- (void)tapScreen:(UITapGestureRecognizer *)tapGesture
{
    self.window.rootViewController = [[MainViewController alloc] init];
}


-(void)playbackFinished:(NSNotification *)notification{
    NSLog(@"视频播放完成.");
    self.window.rootViewController = [[MainViewController alloc] init];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
