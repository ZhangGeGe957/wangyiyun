//
//  SelectedTableViewCell.m
//  网易云
//
//  Created by 张佳乔 on 2021/7/22.
//

#import "SelectedTableViewCell.h"

@implementation SelectedTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"selected"]) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.scrollEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = FALSE;
        _scrollView.showsHorizontalScrollIndicator = FALSE;
        _scrollView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_scrollView];
        _scrollView.backgroundColor = [UIColor whiteColor];
        NSArray* nameArray = [[NSArray alloc] initWithObjects:@"玉置浩二《梦的声音》现场版", @"1M舞室《Unstoppable》", @"索隆这声，我们是海贼好帅气！", @"五月天《诺亚方舟》如果你只能打", @"陈粒《走马》完美现场版", @"愿得到你，去保护你所珍视的人", @"用惨叫鸡演奏米津玄师《Lemon》", nil];
        for (int i = 0; i < 7; i++) {
            NSString* imageName = [[NSString alloc] initWithFormat:@"8-%d.jpeg", i + 1];
            UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(10 + 100 * i, 0, 80, 100);
            [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
            [button.layer setMasksToBounds:YES];
            [button.layer setCornerRadius:10];
            [_scrollView addSubview:button];
            
            UILabel* nameLabel = [[UILabel alloc] init];
            nameLabel.text = nameArray[i];
            nameLabel.frame = CGRectMake(10 + 100 * i, 100, 100, 50);
            nameLabel.numberOfLines = 2;
            nameLabel.font = [UIFont systemFontOfSize:13];
            [_scrollView addSubview:nameLabel];
        }
    }
    return self;
}

- (void)layoutSubviews {
    _scrollView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150);
    _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 2 - 120, 150);
    
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
