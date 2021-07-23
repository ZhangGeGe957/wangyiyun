//
//  MyViewController.h
//  网易云
//
//  Created by 张佳乔 on 2021/7/19.
//

#import <UIKit/UIKit.h>
#import "MyTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> 

@property (nonatomic,strong) UITableView* tableView;
@property (nonatomic,strong) MyTableViewCell* cell;
@property (nonatomic, strong) UILabel* quantity;

@property (assign, nonatomic) BOOL identification;

- (void)recordSwitch:(BOOL)ident;

//实现代理协议中的方法
- (void)changePhoto:(NSMutableArray *)imageArray;

@end

NS_ASSUME_NONNULL_END
