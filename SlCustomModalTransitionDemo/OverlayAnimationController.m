//
//  OverlayAnimationController.m
//  SlCustomModalTransitionDemo
//
//  Created by songlin on 2016/12/26.
//  Copyright © 2016年 songlin. All rights reserved.
//

#define kSystemVersionF [[[UIDevice currentDevice] systemVersion] floatValue]
#import "OverlayAnimationController.h"

@implementation OverlayAnimationController

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    UIView *fromView = fromVC.view;
    UIView *toView = toVC.view;
    CGFloat duration = [self transitionDuration:transitionContext];
    
    if (toVC.isBeingPresented) {
        [containerView addSubview:toView];
        CGFloat toViewWidth = containerView.frame.size.width * 2 / 3;
        CGFloat toViewHeight = containerView.frame.size.height * 2 / 3;
        toView.center = containerView.center;
        toView.bounds = CGRectMake(0, 0, 1, toViewHeight);
        if (kSystemVersionF > 8) {
            [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionTransitionNone animations:^{
                toView.bounds = CGRectMake(0, 0, toViewWidth, toViewHeight);
            } completion:^(BOOL finished) {
                BOOL isCancelled = [transitionContext transitionWasCancelled];
                [transitionContext completeTransition:!isCancelled];
            }];
        }else {
            UIView *dimmingView = [[UIView alloc]init];
            [containerView insertSubview:dimmingView belowSubview:toView];
            dimmingView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
            dimmingView.center = containerView.center;
            dimmingView.bounds = CGRectMake(0, 0, toViewWidth, toViewHeight);
            [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                dimmingView.bounds = containerView.bounds;
            } completion:^(BOOL finished) {
                BOOL isCancelled = [transitionContext transitionWasCancelled];
                [transitionContext completeTransition:!isCancelled];
            }];
        }
        
    }
    //Dismissal 转场中不要将 toView 添加到 containerView
    if (fromVC.isBeingDismissed) {
        CGFloat fromViewHeight = fromView ? fromView.frame.size.height:0 ;
        [UIView animateWithDuration:duration animations:^{
            fromView.bounds = CGRectMake(0, 0, 1, fromViewHeight);
        } completion:^(BOOL finished) {
            BOOL isCancelled = [transitionContext transitionWasCancelled];
            [transitionContext completeTransition:!isCancelled];
        }];
    }
}

@end
