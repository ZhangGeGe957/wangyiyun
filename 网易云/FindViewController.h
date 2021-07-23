//
//  FindViewController.h
//  网易云
//
//  Created by 张佳乔 on 2021/7/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FindViewController : UIViewController <UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource> 
//定时器
@property (retain, nonatomic) NSTimer* timerView;

@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) UIView* falseView;
@property (assign, nonatomic) BOOL identification;

- (void)recordSwitch:(BOOL)ident;

@end

NS_ASSUME_NONNULL_END
