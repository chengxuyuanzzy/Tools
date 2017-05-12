//
//  UtilsMacro.h
//  Tools
//
//  Created by 朱忠阳 on 2017/5/12.
//  Copyright © 2017年 朱忠阳. All rights reserved.
//

#ifndef UtilsMacro_h
#define UtilsMacro_h

/** 对AFNetworking封装单例 **/
#define kNetRequestManager [NetRequestManager shareManager]
/** UIAlertView **/
#define AlertView(msg) [[[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show]

#define AlertController(mesage,...) {UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:mesage preferredStyle:UIAlertControllerStyleAlert];\
UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {\
}];\
[alertController addAction:otherAction];\
[self presentViewController:alertController animated:YES completion:nil];}

#endif /* UtilsMacro_h */
