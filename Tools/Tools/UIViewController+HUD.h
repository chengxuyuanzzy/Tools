//
//  UIViewController+HUD.h
//  Tools
//
//  Created by 朱忠阳 on 2017/5/15.
//  Copyright © 2017年 朱忠阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HUD)

- (void)showHint:(NSString *)hint;

- (void)showHint:(NSString *)hint delay:(float)delay;

- (void)showHint:(NSString *)hint delya:(float)delay view:(UIView *)view;

- (void)hidesHUD;

@end
