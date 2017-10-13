//
//  SecondViewController.m
//  PlaceholderView
//
//  Created by sunkai on 2017/10/12.
//  Copyright © 2017年 CCWork. All rights reserved.
//

#import "SecondViewController.h"
#import "UIView+placeholder.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(50, 50, CGRectGetWidth(self.view.frame) - 100, CGRectGetHeight(self.view.frame) - 100)];
    scrollView.scrollEnabled = NO;
    scrollView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:scrollView];
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:scrollView.bounds];
    textLabel.numberOfLines = 0;
    textLabel.text = @"1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n";
    [scrollView addSubview:textLabel];
    [textLabel sizeToFit];
    scrollView.contentSize = CGSizeMake(CGRectGetWidth(scrollView.frame), CGRectGetHeight(textLabel.frame));
    
    [scrollView cq_showPlaceholderWithType:CQPlaceholderViewTypeNoNetWork reloadBlock:^{
        NSLog(@"Will reload data");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
