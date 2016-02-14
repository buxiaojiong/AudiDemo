//
//  SpacePushAnimation.m
//  AudiDemo
//
//  Created by sourcecode on 16/1/29.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "SpacePushAnimation.h"

@implementation SpacePushAnimation
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext

{
    return 1.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext

{
    
    //目的ViewController
    
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //起始ViewController
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    //添加toView到上下文
    
    [[transitionContext containerView] insertSubview:toViewController.view belowSubview:fromViewController.view];
    
    [transitionContext containerView].backgroundColor = [UIColor whiteColor];
    
    //自定义动画
    
    toViewController.view.transform = CGAffineTransformMakeTranslation(2000, 0);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        fromViewController.view.transform = CGAffineTransformMakeTranslation(-1900,-250);
        
        toViewController.view.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
        fromViewController.view.transform = CGAffineTransformIdentity;
        
        // 声明过渡结束时调用 completeTransition: 这个方法
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
    
}
@end
