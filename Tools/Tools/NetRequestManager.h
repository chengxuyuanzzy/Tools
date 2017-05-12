//
//  NetRequestManager.h
//  Tools
//
//  Created by 朱忠阳 on 2017/5/12.
//  Copyright © 2017年 朱忠阳. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef NS_ENUM(NSInteger, NetworkType) {
    Get = 0,
    Post
};

typedef NS_ENUM(NSInteger, NetStatus) {
    WiFi = 0,
    WWAN,//蜂窝
    UnKnown,//不识别网络
    NotNet//没有网络(断网)
};

@interface NetRequestManager : AFHTTPSessionManager

@property (nonatomic, assign) NSInteger networkStatus;

+ (id)shareManager;

/**
 数据请求

 @param url 网址
 @param params 请求体
 @param type 类型 0--GET  1--POST
 @param block 返回值
 @param log 打印头
 */
- (void)requestJsonDataWithUrl:(NSString *)url
                        params:(NSDictionary *)params
                          type:(int)type
                           log:(NSString *)log
                         block:(void (^)(BOOL requestSuccess, id requestData, NSError *requestError))block;

/**
 网络状态监听

 @param view 显示的view
 */
- (void)netStatusWithView:(UIView *)view;

@end
