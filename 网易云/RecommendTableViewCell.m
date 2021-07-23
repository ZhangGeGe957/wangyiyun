//
//  RecommendTableViewCell.m
//  网易云
//
//  Created by 张佳乔 on 2021/7/22.
//

#import "RecommendTableViewCell.h"

@implementation RecommendTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"recommend"]) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.scrollEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = FALSE;
        _scrollView.showsHorizontalScrollIndicator = FALSE;
        _scrollView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_scrollView];
        _scrollView.backgroundColor = [UIColor whiteColor];
        NSArray* buttonName = [[NSArray alloc] initWithObjects:@"错把时间当良药 谁料只愈皮外伤", @"「纯音」高考&中考｜减压小仓库", @"【练球必备】节奏感爆棚", @"最喜欢小旭子", @"夏日甜甜的爱情正向你奔来", nil];
        for (int i = 0; i < 5; i++) {
            NSString* buttonImage = [[NSString alloc] initWithFormat:@"11-%d.jpeg", i + 1 ];
            UIButton* imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
            imageButton.frame = CGRectMake(10 + 125 * i, 0, 100, 100);
            [imageButton setImage:[UIImage imageNamed:buttonImage] forState:UIControlStateNormal];
            
            [imageButton.layer setMasksToBounds:YES];
            [imageButton.layer setCornerRadius:15];
            
            [_scrollView addSubview:imageButton];
            
            UILabel* name = [[UILabel alloc] init];
            name.text = buttonName[i];
            name.frame = CGRectMake(10 + 125 * i, 100, 100, 50);
            name.numberOfLines = 2;
            name.font = [UIFont systemFontOfSize:13];
            [_scrollView addSubview:name];
        }
    }
    return self;
}

- (void)layoutSubviews {
    _scrollView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150);
    _scrollView.contentSize = CGSizeMake(10 + [UIScreen mainScreen].bounds.size.width * 2 - 200, 150);
    
   
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
