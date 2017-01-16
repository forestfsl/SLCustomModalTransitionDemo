//
//  OverlayPresentationController.m
//  SlCustomModalTransitionDemo
//
//  Created by songlin on 2016/12/26.
//  Copyright © 2016年 songlin. All rights reserved.
//

#import "OverlayPresentationController.h"

@implementation OverlayPresentationController



-(void)presentationTransitionWillBegin {
    _dimmingView = [[UIView alloc]init];
    [self.containerView addSubview:_dimmingView];
    CGFloat dimmingViewInitailWidth = self.containerView.frame.size.width * 2 / 3;
    CGFloat dimmingViewInitailHeight = self.containerView.frame.size.height * 2 / 3;
//    _dimmingView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    _dimmingView.backgroundColor = [UIColor greenColor];
    _dimmingView.center = self.containerView.center;
    _dimmingView.bounds = CGRectMake(0, 0, dimmingViewInitailWidth, dimmingViewInitailHeight);
    
    [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        _dimmingView.bounds = self.containerView.bounds;
    } completion:nil];
}

-(void)dismissalTransitionWillBegin {
    [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        _dimmingView.alpha = 0.0;
    } completion:nil];
}

-(void)containerViewWillLayoutSubviews {
    _dimmingView.center = self.containerView.center;
    _dimmingView.bounds = self.containerView.bounds;
    
    CGFloat width = self.containerView.frame.size.width * 2 / 3;
    CGFloat height = self.containerView.frame.size.height * 2 / 3;
    self.presentedView.center = self.containerView.center;
    self.presentedView.bounds = CGRectMake(0, 0, width, height);
}

@end
