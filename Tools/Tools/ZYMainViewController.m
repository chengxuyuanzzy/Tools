//
//  ZYMainViewController.m
//  WeChat
//
//  Created by 朱忠阳 on 2017/5/22.
//  Copyright © 2017年 朱忠阳. All rights reserved.
//

#import "ZYMainViewController.h"
#import "RootViewController.h"
#import "ZYSecondViewController.h"
#import "ZYThreeViewController.h"
#import "ZYNavigationController.h"

@interface ZYMainViewController ()

@end

@implementation ZYMainViewController

+ (void)initialize {
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12.f];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    //防止所有UI元素都往上飘移44pt
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self setupChildVC];
    // Do any additional setup after loading the view.
}

- (void)setupChildVC {
    RootViewController *firstVC = [[RootViewController alloc] init];
    [self addChildViewController:firstVC title:@"第一页" imageName:@""];
    
    ZYSecondViewController *secondVC = [[ZYSecondViewController alloc] init];
    [self addChildViewController:secondVC title:@"第二页" imageName:@""];
    
    ZYThreeViewController *threeVC = [[ZYThreeViewController alloc] init];
    [self addChildViewController:threeVC title:@"第三页" imageName:@""];
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)imageName {
    
    childController.title = title;
    childController.tabBarItem.title = title;
    childController.tabBarItem.image = [UIImage imageNamed:imageName];
    
    NSString *selectedImageName = [NSString stringWithFormat:@"%@XX", imageName];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = selectedImage;
    
    ZYNavigationController *nav = [[ZYNavigationController alloc] initWithRootViewController:childController];
    [self addChildViewController:nav];
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
