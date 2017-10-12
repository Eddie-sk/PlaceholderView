//
//  UIView+placeholder.h
//  PlaceholderView
//
//  Created by sunkai on 2017/10/12.
//  Copyright © 2017年 CCWork. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CQPlaceholderViewType) {
    CQPlaceholderViewTypeNoNetWork,
    CQPlaceholderViewTypeNoData,
};

typedef void(^PlaceholderReloadBlock)(void);

@interface UIView (placeholder)

@property (nonatomic, strong) UIView *cq_placeholderView;
@property (nonatomic, copy) PlaceholderReloadBlock cq_placeholderReloadBlock;
@property (nonatomic, copy) NSNumber *cq_scrollEnabled;

- (void)cq_showPlaceholderWithType:(CQPlaceholderViewType)type reloadBlock:(PlaceholderReloadBlock)block;

@end
