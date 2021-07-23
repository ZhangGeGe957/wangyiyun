//
//  RollTableViewCell.h
//  网易云
//
//  Created by 张佳乔 on 2021/7/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RollTableViewCell : UITableViewCell<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView* scrollView;
@property (strong, nonatomic) NSTimer* timerView;
@property (strong, nonatomic) UIPageControl *pageControl;

@end

NS_ASSUME_NONNULL_END
