//
//  lastPageViewController.m
//  Mayo-ipad
//
//  Created by Nagesh Kumar Uba on 11/15/14.
//  Copyright (c) 2014 rishabh srivastava. All rights reserved.
//

#import "lastPageViewController.h"

@implementation lastPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CALayer *btnLayer = [thankyou layer];
    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:10.0f];
    
    CALayer *btnLayer1 = [logout layer];
    [btnLayer1 setMasksToBounds:YES];
    [btnLayer1 setCornerRadius:10.0f];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"mayobg.png"]]];
    
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
