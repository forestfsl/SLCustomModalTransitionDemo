//
//  SLModalTransitionDelegate.m
//  SlCustomModalTransitionDemo
//
//  Created by songlin on 2016/12/26.
//  Copyright © 2016年 songlin. All rights reserved.
//

#import "SLModalTransitionDelegate.h"
#import "OverlayAnimationController.h"
#import "SlideAnimationController.h"
#import "OverlayPresentationController.h"

@implementation SLModalTransitionDelegate

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [OverlayAnimationController new];
//    
//    NSUInteger transitionType = TransitionTypeLeft;
//    SlideAnimationController *slide = [SlideAnimationController new];
//    slide.transitionType = transitionType;
//    return slide;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [OverlayAnimationController new];
    
//    NSUInteger transitionType = TransitionTypeDismissal;
//        SlideAnimationController *slide = [SlideAnimationController new];
//        slide.transitionType = transitionType;
//        return slide;
}



//在transition过程中处理其他的动画
-(UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {

    return [[OverlayPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

@end
