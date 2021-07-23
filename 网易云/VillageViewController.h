//
//  VillageViewController.h
//  网易云
//
//  Created by 张佳乔 on 2021/7/19.
//

#import <UIKit/UIKit.h>
#import "FindViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface VillageViewController : UIViewController 

@property (assign, nonatomic) BOOL identification;

- (void)recordSwitch:(BOOL)ident;

@end

NS_ASSUME_NONNULL_END
