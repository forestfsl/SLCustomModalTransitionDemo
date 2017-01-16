//
//  SlideAnimationController.h
//  SlCustomModalTransitionDemo
//
//  Created by songlin on 2016/12/26.
//  Copyright © 2016年 songlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,TransitionType){
    TransitionTypeNone,
    TransitionTypePop,
    TransitionTypePush,
    TransitionTypeLeft,
    TransitionTypeRight,
    TransitionTypePresention,
    TransitionTypeDismissal
};

@interface SlideAnimationController : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) TransitionType transitionType;

@end
