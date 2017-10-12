//
//  ViewController.m
//  PlaceholderView
//
//  Created by sunkai on 2017/10/12.
//  Copyright © 2017年 CCWork. All rights reserved.
//

#import "ViewController.h"
#import "UIView+placeholder.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.view cq_showPlaceholderWithType:CQPlaceholderViewTypeNoData reloadBlock:^{
        SecondViewController *secondVC = [[SecondViewController alloc] init];
        [self presentViewController:secondVC animated:YES completion:nil];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
