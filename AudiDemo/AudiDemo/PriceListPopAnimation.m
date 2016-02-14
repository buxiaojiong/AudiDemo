//
//  PriceListPopAnimation.m
//  AudiDemo
//
//  Created by sourcecode on 16/1/29.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "PriceListPopAnimation.h"

@implementation PriceListPopAnimation
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
    
    toViewController.view.transform = CGAffineTransformMakeTranslation(-500,-800);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        fromViewController.view.transform = CGAffineTransformMakeTranslation(512+500,384+500);
        
        toViewController.view.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
        fromViewController.view.transform = CGAffineTransformIdentity;
        
        // 声明过渡结束时调用 completeTransition: 这个方法
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
    
}
@end
