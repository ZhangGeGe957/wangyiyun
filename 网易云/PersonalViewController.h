//
//  PersonalViewController.h
//  网易云
//
//  Created by 张佳乔 on 2021/7/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol keepSwitchDelegate <NSObject>

- (void)recordSwitch:(BOOL)ident;

@end

@interface PersonalViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) UISwitch* mySwitch;
@property (copy, nonatomic) NSArray* cell01;
@property (copy, nonatomic) NSArray* cell02;
@property (copy, nonatomic) NSArray* cell03;
@property (copy, nonatomic) NSArray* cell04;
@property (nonatomic, assign) BOOL mySwitchisOn;
@property (nonatomic, assign) BOOL yesOrNo;
@property (assign, nonatomic) id<keepSwitchDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
