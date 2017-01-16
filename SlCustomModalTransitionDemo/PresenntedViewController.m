//
//  PresenntedViewController.m
//  SlCustomModalTransitionDemo
//
//  Created by songlin on 2016/12/26.
//  Copyright © 2016年 songlin. All rights reserved.
//

#import "PresenntedViewController.h"

@interface PresenntedViewController ()
@property (weak, nonatomic) IBOutlet UIButton *dismissButton;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *inputTextFieldWidthCons;

@end

@implementation PresenntedViewController
- (IBAction)dismiss:(id)sender {
    _inputTextFieldWidthCons.constant = 0;
    [UIView animateWithDuration:0.4 animations:^{
        self.dismissButton.transform = CGAffineTransformMakeRotation(3 * M_PI);
        [self.inputTextField layoutIfNeeded];
//        self.dismissButton.transform = CGAffineTransformMakeScale(0.1, 0.1);
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:true completion:nil];
    }];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dismissButton.alpha = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    _inputTextFieldWidthCons.constant = self.view.frame.size.width * 2 / 3;
    [UIView animateWithDuration:0.3 animations:^{
        self.dismissButton.alpha = 1;
        [self.inputTextField layoutIfNeeded];
    }];
}



@end
