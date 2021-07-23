//
//  RollTableViewCell.m
//  网易云
//
//  Created by 张佳乔 on 2021/7/22.
//

#import "RollTableViewCell.h"

@implementation RollTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"roll"]) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.tag = 111;
        _scrollView.scrollEnabled = YES;
        _scrollView.pagingEnabled = YES;
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.bounces = YES;
        _scrollView.showsHorizontalScrollIndicator = YES;
        [self.contentView addSubview:_scrollView];
        _scrollView.delegate = self;
        
        _timerView = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(autoScroll:) userInfo:@"帅哥哥" repeats:YES];
        _scrollView.backgroundColor = [UIColor whiteColor];
        
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.numberOfPages = 4;
        _pageControl.currentPage = 0;
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.pageIndicatorTintColor = [UIColor grayColor];
        [self.contentView addSubview:_pageControl];
        NSString* imageName = [NSString stringWithFormat:@"6-4.jpeg"];
        UIImage* image = [UIImage imageNamed:imageName];
        UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150);
        [imageView.layer setMasksToBounds:YES];
        [imageView.layer setCornerRadius:15];
        [_scrollView addSubview:imageView];
        for (int i = 1; i < 5; i++) {
            NSString* imageName = [NSString stringWithFormat:@"6-%d.jpeg", i];
            UIImage* image = [UIImage imageNamed:imageName];
            UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
            imageView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * i, 0, [UIScreen mainScreen].bounds.size.width, 150);
            [imageView.layer setMasksToBounds:YES];
            [imageView.layer setCornerRadius:15];
            [_scrollView addSubview:imageView];
        }
        imageName = [NSString stringWithFormat:@"6-1.jpeg"];
        image = [UIImage imageNamed:imageName];
        imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 5, 0, [UIScreen mainScreen].bounds.size.width, 150);
        [imageView.layer setMasksToBounds:YES];
        [imageView.layer setCornerRadius:15];
        [_scrollView addSubview:imageView];
    }
    return self;
}

- (void)layoutSubviews {
    _scrollView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150);
    _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 6, 150);
    _pageControl.frame = CGRectMake(60, 100, 300, 50);
    [_pageControl addTarget:self action:@selector(pressPage) forControlEvents:UIControlEventValueChanged];

    [_scrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width, 0) animated:NO];
}

- (void)autoScroll:(NSTimer*)timer {
    if (_scrollView.contentOffset.x > [UIScreen mainScreen].bounds.size.width * 3) {
        [_scrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width, 0) animated:YES];
    } else {
        [_scrollView setContentOffset:CGPointMake(_scrollView.contentOffset.x + [UIScreen mainScreen].bounds.size.width, 0) animated:YES];
    }

    
}


//用户手动拖动scrollView时，暂停计时器
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if (scrollView.tag == 111) {
        [_timerView invalidate];
        _timerView = nil;
    }
}


//当scrollView停止拖动之后调用，调用此方法
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    if (scrollView.tag == 111) {
        _timerView = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(autoScroll:) userInfo:@"帅哥哥" repeats:YES];
    }

}

//拖拽的时候就调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (_scrollView.contentOffset.x > [UIScreen mainScreen].bounds.size.width * 5) {
        [_scrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width, 0) animated:NO];
    } else if (_scrollView.contentOffset.x < [UIScreen mainScreen].bounds.size.width) {
        [_scrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width * 5, 0) animated:NO];
    }
    
    _pageControl.currentPage = (_scrollView.contentOffset.x) / ([UIScreen mainScreen].bounds.size.width) - 1;
}

- (void)pressPage {
    if (_pageControl.currentPage == 0) {
        [_scrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width, 0) animated:NO];
    } else if (_pageControl.currentPage == 1) {
        [_scrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width * 2, 0) animated:NO];
    } else if (_pageControl.currentPage == 2) {
        [_scrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width * 3, 0) animated:NO];
    } else if (_pageControl.currentPage == 3) {
        [_scrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width * 4, 0) animated:NO];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
