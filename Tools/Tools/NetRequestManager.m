//
//  NetRequestManager.m
//  Tools
//
//  Created by 朱忠阳 on 2017/5/12.
//  Copyright © 2017年 朱忠阳. All rights reserved.
//

#import "NetRequestManager.h"
#import <Toast/UIView+Toast.h>

@implementation NetRequestManager

+ (id)shareManager {
    static NetRequestManager *share;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        share = [[NetRequestManager alloc] init];
    });
    return share;
}

- (void)requestJsonDataWithUrl:(NSString *)url
                        params:(NSDictionary *)params
                          type:(int)type
                           log:(NSString *)log
                         block:(void (^)(BOOL, id, NSError *))block {
    self.responseSerializer = [AFHTTPResponseSerializer serializer];
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
    [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    self.securityPolicy.allowInvalidCertificates = YES;
    
    switch (type) {
        case Get: {
            [self GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
                if (![log isEqualToString:@""]) {
                    DebugLog(@"%@ == %@", log, dic);
                }
                block(YES, dic, nil);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (![log isEqualToString:@""]) {
                    DebugLog(@"%@ == %@", log, error);
                }
                block(NO, nil, error);
            }];
        }
            break;
        case Post: {
            [self POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
                if (![log isEqualToString:@""]) {
                    DebugLog(@"%@ == %@", log, dic);
                }
                block(YES, dic, nil);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (![log isEqualToString:@""]) {
                    DebugLog(@"%@ == %@", log, error);
                }
                block(NO, nil, error);
            }];
        }
            break;
        default:
            break;
    }
}

- (void)netStatusWithView:(UIView *)view {
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                self.networkStatus = UnKnown;
                [view makeToast:@"未知网络"];
                break;
            case AFNetworkReachabilityStatusNotReachable: {
                self.networkStatus = NotNet;
                [view makeToast:@"未连接网络"];
            }
            case AFNetworkReachabilityStatusReachableViaWiFi: {
                self.networkStatus = WiFi;
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN: {
                self.networkStatus = WWAN;
            }
                break;
            default:
                break;
        }
    }];
    [mgr startMonitoring];
}

@end
