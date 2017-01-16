//
//  SlideAnimationController.m
//  SlCustomModalTransitionDemo
//
//  Created by songlin on 2016/12/26.
//  Copyright © 2016年 songlin. All rights reserved.
//

#import "SlideAnimationController.h"

@implementation SlideAnimationController

-(void)setTransitionType:(TransitionType)transitionType {
    _transitionType = transitionType;
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = fromVC.view;
    UIView *toView = toVC.view;
    
    CGFloat translation = containerView.frame.size.width;
    CGAffineTransform toViewTransform = CGAffineTransformIdentity;
    CGAffineTransform fromViewTransform = CGAffineTransformIdentity;
    
    switch (_transitionType) {
        case TransitionTypePush:
        case TransitionTypeRight:
            toViewTransform = CGAffineTransformMakeTranslation(translation, 0);
            fromViewTransform = CGAffineTransformMakeTranslation(-translation, 0);
            break;
        case TransitionTypePop:
        case TransitionTypeNone:
        case TransitionTypeLeft:
            toViewTransform = CGAffineTransformMakeTranslation(-translation, 0);
            fromViewTransform = CGAffineTransformMakeTranslation(translation, 0);
            break;
               default:
            break;
    }
    switch (_transitionType) {
        case TransitionTypePresention:
            translation = containerView.frame.size.height;
            toViewTransform = CGAffineTransformMakeTranslation(0, translation);
            fromViewTransform = CGAffineTransformMakeTranslation(0, 0);
             [containerView addSubview:toView];
            break;
        case TransitionTypeDismissal:
            toViewTransform = CGAffineTransformMakeTranslation(0, 0);
            fromViewTransform = CGAffineTransformMakeTranslation(0, translation);
            break;
        default:
            [containerView addSubview:toView];
            break;
    }
    toView.transform = toViewTransform;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromView.transform = fromViewTransform;
        toView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        fromView.transform = CGAffineTransformIdentity;
        toView.transform = CGAffineTransformIdentity;
        BOOL isCancelled = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!isCancelled];
    }];
    
}

@end
