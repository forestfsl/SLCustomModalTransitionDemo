//
//  PresentingViewController.m
//  SlCustomModalTransitionDemo
//
//  Created by songlin on 2016/12/26.
//  Copyright © 2016年 songlin. All rights reserved.
//

#import "PresentingViewController.h"
#import "SLModalTransitionDelegate.h"
#import "PresenntedViewController.h"

@interface PresentingViewController ()

@property (nonatomic, strong) SLModalTransitionDelegate *presentTransitionDelegate ;

@end

@implementation PresentingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 .FullScreen 的时候，presentingView 的移除和添加由 UIKit 负责，在 presentation 转场结束后被移除，dismissal 转场结束时重新回到原来的位置；
 .Custom 的时候，presentingView 依然由 UIKit 负责，但 presentation 转场结束后不会被移除。
 */



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    PresenntedViewController *toVC = [segue destinationViewController];
    self.presentTransitionDelegate = [SLModalTransitionDelegate new];
    toVC.transitioningDelegate = self.presentTransitionDelegate;
    toVC.modalPresentationStyle = UIModalPresentationCustom;
    [super prepareForSegue:segue sender:sender];
}


@end
