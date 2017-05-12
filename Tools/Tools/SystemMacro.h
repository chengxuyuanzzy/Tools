//
//  SystemMacro.h
//  Tools
//
//  Created by 朱忠阳 on 2017/5/12.
//  Copyright © 2017年 朱忠阳. All rights reserved.
//

#ifndef SystemMacro_h
#define SystemMacro_h

/** DEBUG LOG **/
#ifndef __OPTIMIZE__
#define DebugLog(...) NSLog(__VA_ARGS__)
#else
#define DebugLog(...){}
#endif
/** MainScreen Height&Width **/
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

#define Level WIDTH/375
#define Verticl HEIGHT/667
/** 系统空间默认高度 **/
#define kStatusBarHeight       (20.f)
#define kNavigationHeight      (44.f)
#define kTableBarHeight        (49.f)
#define kEnglishKeyboardHeight (216.f)
#define kChineseKeyboardHeight (252.f)
/** 当前版本 **/
#define kFSystemVersion   ([[[UIDevice currentDevice] systemVersion] floatValue])
#define kDSystemVersion   ([[[UIDevice currentDevice] systemVersion] doubleValue])
#define IOS7              (kFSystemVersion >= 7.0 && kFSystemVersion < 8.0)
#define Pad               (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
/** 当前语言 **/
#define kLanguage  ([[NSLocale preferredLanguages] objectAtIndex:0])
/** 手机型号 **/
#define iPhoneRetina     ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
CGSizeEqualToSize(CGSizeMake(640, 960), \
[[UIScreen mainScreen] currentMode].size) : \
NO)
#define iPhone5          ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
CGSizeEqualToSize(CGSizeMake(640, 1136), \
[[UIScreen mainScreen] currentMode].size) : \
NO)
#define iPhone6          ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
CGSizeEqualToSize(CGSizeMake(750, 1334), \
[[UIScreen mainScreen] currentMode].size) : \
NO)
#define iPhone6P          ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
CGSizeEqualToSize(CGSizeMake(1242, 2208), \
[[UIScreen mainScreen] currentMode].size) : \
NO)
/** 颜色 **/
#define kUIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
/** UUID **/
#define UUID [[[UIDevice currentDevice] identifierForVendor] UUIDString]
/** 秒数 */
#define Seconds(Days)    (24.f * 60.f * 60.f * (Days))
/** 本地持久化 **/
#define kUserDefaults [NSUserDefaults standardUserDefaults]

#endif /* SystemMacro_h */
