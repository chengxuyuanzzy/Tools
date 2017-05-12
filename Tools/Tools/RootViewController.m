//
//  RootViewController.m
//  Tools
//
//  Created by 朱忠阳 on 2017/5/12.
//  Copyright © 2017年 朱忠阳. All rights reserved.
//

#import "RootViewController.h"
#import "NetRequestManager.h"
#import "UIView+Frame.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    AlertView(@"你确定吗？");
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = kUIColorFromRGB(0xff2f2f);
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(Level*20);
        make.top.equalTo(self.view).offset(kStatusBarHeight+kNavigationHeight+Verticl*40);
        make.width.equalTo(Level*100);
        make.height.equalTo(Verticl*30);
    }];
    
    button.x = Level*100;
    
    
    if (iPhone6P) {
        DebugLog(@"当前屏幕宽度 %f", WIDTH);
        DebugLog(@"当前屏幕高度 %f", HEIGHT);
        DebugLog(@"换算比例（相对6）width %f, height %f", Level, Verticl);
        DebugLog(@"当前版本 %f", kFSystemVersion);
        DebugLog(@"当前语言 %@", kLanguage);
        DebugLog(@"UUID %@", UUID);
        DebugLog(@"一天总共 %f秒", Seconds(1));
    }
    // Do any additional setup after loading the view.
}


- (void)buttonClick {
    NSDictionary *dic = @{};
    [kNetRequestManager requestJsonDataWithUrl:@"" params:dic type:1 log:@"baidu" block:^(BOOL requestSuccess, id requestData, NSError *requestError) {
        AlertController(@"自己找网址去！");
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
