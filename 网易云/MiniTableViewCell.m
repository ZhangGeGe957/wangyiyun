//
//  MiniTableViewCell.m
//  网易云
//
//  Created by 张佳乔 on 2021/7/21.
//

#import "MiniTableViewCell.h"

@implementation MiniTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"cell"]) {
        _label = [[UILabel alloc] init];
        [self.contentView addSubview:_label];
        
        _aImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_aImageView];
    } else if ([self.reuseIdentifier isEqualToString:@"yinyue"] || [self.reuseIdentifier isEqualToString:@"hear"] || [self.reuseIdentifier isEqualToString:@"song"]) {
        _label = [[UILabel alloc] init];
        [self.contentView addSubview:_label];
        
        _aImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_aImageView];
        
        _everyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_everyButton];
        self.backgroundColor = [UIColor whiteColor];
    } else if ([self.reuseIdentifier isEqualToString:@"switch"]) {
        _label = [[UILabel alloc] init];
        [self.contentView addSubview:_label];
        
        _aImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_aImageView];
        
    } else if ([self.reuseIdentifier isEqualToString:@"tuichu"]) {
        _label = [[UILabel alloc] init];
        [self.contentView addSubview:_label];
        _label.textColor = [UIColor redColor];
    }
    return self;
}

- (void)layoutSubviews {
    if ([self.reuseIdentifier isEqualToString:@"cell"]) {
        _label.frame = CGRectMake(44, 3.5, 250, 32);
        _aImageView.frame = CGRectMake(8, 8.5, 25, 25);
    } else if ([self.reuseIdentifier isEqualToString:@"yinyue"]) {
        _label.frame = CGRectMake(44, 3.5, 250, 32);
        _aImageView.frame = CGRectMake(8, 8.5, 25, 25);
        _everyButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 120, 10, 100, 32);
        //加按钮文字
        [_everyButton setTitle:@"换一批" forState:UIControlStateNormal];
        //设置按钮文字的属性
        [_everyButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        //设置按钮图片
        [_everyButton setImage:[UIImage imageNamed:@"shuaxin.png"] forState:UIControlStateNormal];

        //按钮设置为圆角
        [_everyButton.layer setMasksToBounds:YES];
        [_everyButton.layer setCornerRadius:15.0];
        //设置边框颜色
        _everyButton.layer.borderWidth = 0.5;
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGColorRef color = CGColorCreate(colorSpace, (CGFloat[]){0.1,0,0,0.3});
        [_everyButton.layer setBorderColor:color];
        
        //不可选cell
        self.userInteractionEnabled = NO;
        
    } else if ([self.reuseIdentifier isEqualToString:@"hear"]) {
        _label.frame = CGRectMake(44, 7, 250, 32);
        _aImageView.frame = CGRectMake(8, 12, 25, 25);
        _everyButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 100, 10, 80, 32);
        [_everyButton setTitle:@"播放" forState:UIControlStateNormal];
        [_everyButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_everyButton setImage:[UIImage imageNamed:@"bofang.png"] forState:UIControlStateNormal];
        //按钮设置为圆角
        [_everyButton.layer setMasksToBounds:YES];
        [_everyButton.layer setCornerRadius:15.0];
        //设置边框颜色
        _everyButton.layer.borderWidth = 0.5;
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGColorRef color = CGColorCreate(colorSpace, (CGFloat[]){0.1,0,0,0.3});
        [_everyButton.layer setBorderColor:color];
        
        //不可选cell
        self.userInteractionEnabled = NO;
        
    } else if ([self.reuseIdentifier isEqualToString:@"song"]) {
        _label.frame = CGRectMake(44, 5, 250, 32);
        _aImageView.frame = CGRectMake(8, 10, 25, 25);
        _everyButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 120, 10, 110, 32);
        [_everyButton setTitle:@"更多" forState:UIControlStateNormal];
        [_everyButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_everyButton setImage:[UIImage imageNamed:@"left.png"] forState:UIControlStateNormal];
        
        //改变文字和图像的位置关系 UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right);
        [_everyButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 40)];
        [_everyButton setImageEdgeInsets:UIEdgeInsetsMake(0, 70, 0, 0)];
        
        //按钮设置为圆角
        [_everyButton.layer setMasksToBounds:YES];
        [_everyButton.layer setCornerRadius:15.0];
        //设置边框颜色
        _everyButton.layer.borderWidth = 0.5;
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGColorRef color = CGColorCreate(colorSpace, (CGFloat[]){0.1,0,0,0.3});
        [_everyButton.layer setBorderColor:color];
        
        //不可选cell
        self.userInteractionEnabled = NO;
        
    } else if ([self.reuseIdentifier isEqualToString:@"switch"]) {
        _label.frame = CGRectMake(44, 3.5, 250, 32);
        _aImageView.frame = CGRectMake(8, 8.5, 25, 25);
    } else if ([self.reuseIdentifier isEqualToString:@"tuichu"]) {
        _label.frame = CGRectMake(125, 0, 250, 32);
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
