//
//  ClassicTableViewCell.m
//  网易云
//
//  Created by 张佳乔 on 2021/7/22.
//

#import "ClassicTableViewCell.h"

@implementation ClassicTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"classic"]) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.scrollEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = FALSE;
        _scrollView.showsHorizontalScrollIndicator = FALSE;
        _scrollView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_scrollView];
        
        NSArray* nameArray = [[NSArray alloc] initWithObjects:@"想你这件事", @"高雅先生", @"我要找到你", @"15楼窗外", @"花，太阳，彩虹，你", @"化身孤岛的鲸", nil];
        int m = 0;
        for (int i = 0; i < 2; i++) {
            for (int j = 0; j < 3; j++) {
                NSString* imageName = [[NSString alloc] initWithFormat:@"%d-%d.png", i + 9, j + 1];
                UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
                [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
                button.frame = CGRectMake(10 + 420 * i, 70 * j, 400, 60);
                [button setTitle:nameArray[m] forState:UIControlStateNormal];
                [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                
                //改变文字和图像的位置关系 UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right);
                [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 160)];
                [button setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 340)];
                
                //按钮设置为圆角
                [button.layer setMasksToBounds:YES];
                [button.layer setCornerRadius:5.0];
                //设置边框颜色
                button.layer.borderWidth = 0.5;
                CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
                CGColorRef color = CGColorCreate(colorSpace, (CGFloat[]){0.1,0,0,0.3});
                [button.layer setBorderColor:color];
                [_scrollView addSubview:button];
                
                UIButton* mini = [UIButton buttonWithType:UIButtonTypeCustom];
                [mini setImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
                mini.frame = CGRectMake(340, 5, 50, 50);
                [button addSubview:mini];
                m++;
            }
        }
    }
    return self;
}

- (void)layoutSubviews {
    _scrollView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 210);
    _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 2 + 30, 210);
    
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
