//
//  ChoiceTableViewCell.m
//  网易云
//
//  Created by 张佳乔 on 2021/7/22.
//

#import "ChoiceTableViewCell.h"

@implementation ChoiceTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"choice"]) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.scrollEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = FALSE;
        _scrollView.showsHorizontalScrollIndicator = FALSE;
        _scrollView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_scrollView];
        _scrollView.backgroundColor = [UIColor whiteColor];
        NSArray* nameArray = [[NSArray alloc] initWithObjects:@"每日推荐", @"私人FM", @"歌单", @"排行榜", @"直播", @"游戏", @"数字专辑", nil];
        for (int i = 0; i < 7; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(86 * i, 0, 80, 80);
            NSString* imageName = [[NSString alloc] initWithFormat:@"7-%d", i + 1];
            [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
            [button.layer setMasksToBounds:YES];
            [button.layer setCornerRadius:15];
            [_scrollView addSubview:button];
            
            UILabel* name = [[UILabel alloc] init];
            name.text = nameArray[i];
            name.frame = CGRectMake(86 * i, 70, 86, 20);
            name.textAlignment = NSTextAlignmentCenter;
            [_scrollView addSubview:name];
        }
    }
    return self;
}

- (void)layoutSubviews {

    _scrollView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100);
    _scrollView.contentSize = CGSizeMake(6 + [UIScreen mainScreen].bounds.size.width * 2 - 225, 100);
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
