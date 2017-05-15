//
//  UIViewController+HUD.m
//  Tools
//
//  Created by 朱忠阳 on 2017/5/15.
//  Copyright © 2017年 朱忠阳. All rights reserved.
//

#import "UIViewController+HUD.h"

#import <MBProgressHUD/MBProgressHUD.h>
#import <objc/runtime.h>

static const void *HttpRequestHUDKey = &HttpRequestHUDKey;

@implementation UIViewController (HUD)

- (MBProgressHUD *)HUD {
    return objc_getAssociatedObject(self, HttpRequestHUDKey);
}

- (void)setHUD:(MBProgressHUD *)HUD {
    objc_setAssociatedObject(self, HttpRequestHUDKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)showHint:(NSString *)hint {
    [self showHint:hint delay:0];
}

- (void)showHint:(NSString *)hint delay:(float)delay {
    UIView *view = [[UIApplication sharedApplication].delegate window];
    [self showHint:hint delya:delay view:view];
}

- (void)showHint:(NSString *)hint delya:(float)delay view:(UIView *)view {
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    HUD.label.text = hint;
    if (delay > 0) {
        [HUD hideAnimated:YES afterDelay:delay];
    }
    [self setHUD:HUD];
}

- (void)hidesHUD {
    [[self HUD] hideAnimated:YES];
}


@end
