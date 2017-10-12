//
//  UIView+placeholder.m
//  PlaceholderView
//
//  Created by sunkai on 2017/10/12.
//  Copyright © 2017年 CCWork. All rights reserved.
//

#import "UIView+placeholder.h"
#import <objc/runtime.h>

@implementation UIView (placeholder)

static void *holderViewKey = &holderViewKey;
static void *holderBlockKey = &holderBlockKey;
static void *scrollEnableKey = &scrollEnableKey;

- (UIView *)cq_placeholderView {
    return objc_getAssociatedObject(self, &holderViewKey);
}

- (void)setCq_placeholderView:(UIView *)cq_placeholderView {
    objc_setAssociatedObject(self , &holderViewKey, cq_placeholderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (PlaceholderReloadBlock)cq_placeholderReloadBlock {
    return objc_getAssociatedObject(self, &holderBlockKey);
}

- (void)setCq_placeholderReloadBlock:(PlaceholderReloadBlock)cq_placeholderReloadBlock {
    objc_setAssociatedObject(self, &holderBlockKey, cq_placeholderReloadBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSNumber *)cq_scrollEnabled {
    return objc_getAssociatedObject(self, &scrollEnableKey);
}

- (void)setCq_scrollEnabled:(NSNumber *)cq_scrollEnabled {
    objc_setAssociatedObject(self, &scrollEnableKey, cq_scrollEnabled, OBJC_ASSOCIATION_ASSIGN);
}

- (void)cq_showPlaceholderWithType:(CQPlaceholderViewType)type reloadBlock:(PlaceholderReloadBlock)block {
    
    
    if (self.cq_placeholderView) {
        [self.cq_placeholderView removeFromSuperview];
        self.cq_placeholderView = nil;
    }
    
    self.cq_placeholderView = [[UIView alloc] init];
    [self addSubview:self.cq_placeholderView];
    
    self.cq_placeholderView.backgroundColor = self.backgroundColor;
    
    self.cq_placeholderView.frame = self.bounds;
    self.cq_placeholderReloadBlock = block;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.frame) - 80) / 2.0, CGRectGetHeight(self.frame) / 2.0  - 80, 80, 80)];
    [self.cq_placeholderView addSubview:imageView];
    imageView.backgroundColor = [UIColor redColor];
    
    UILabel *descLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame) + 20, CGRectGetWidth(self.frame), 15)];
    descLabel.backgroundColor = [UIColor redColor];
    [self.cq_placeholderView addSubview:descLabel];
    
    UIButton *reloadButton = [[UIButton alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.frame) - 120) / 2.0f, CGRectGetMaxY(descLabel.frame) + 20, 120, 35)];
    [reloadButton setTitle:@"重新加载" forState:UIControlStateNormal];
    reloadButton.layer.borderWidth = 1.0f;
    reloadButton.layer.borderColor = [UIColor blackColor].CGColor;
    [reloadButton addTarget:self action:@selector(cq_reloadButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.cq_placeholderView addSubview:reloadButton];
    
    switch (type) {
        case CQPlaceholderViewTypeNoNetWork: {
            NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"noNetWork" ofType:@"pdf"];
            imageView.image = [UIImage imageWithContentsOfFile:imagePath];
            descLabel.text = @"网络异常";
        }
            break;
            
        case CQPlaceholderViewTypeNoData: {
            
        }
            break;
            
        default:
            break;
    }
}

- (void)cq_reloadButtonClick {
    if (self.cq_placeholderReloadBlock) {
        self.cq_placeholderReloadBlock();
    }
    
    [self.cq_placeholderView removeFromSuperview];
    self.cq_placeholderView = nil;
}

@end
