//
//  MyTableViewCell.m
//  网易云
//
//  Created by 张佳乔 on 2021/7/20.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"shuaigege"]) {
        _label = [[UILabel alloc] init];
        [self.contentView addSubview:_label];
        _label.text = @"BaoZaoBoy";
        //加粗
        [_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
        
        _imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_imageButton setImage:[UIImage imageNamed:@"touxiang.jpeg"] forState:UIControlStateNormal];
        //设置圆角
        [_imageButton.layer setMasksToBounds:YES];
        [_imageButton.layer setCornerRadius:5.0];
        [self.contentView addSubview:_imageButton];
    } else {
        _label = [[UILabel alloc] init];
        [self.contentView addSubview:_label];
        _label.text = @"BaoZaoBoy";
        [_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:24]];
        
        _imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_imageButton setImage:[UIImage imageNamed:@"touxiang.jpeg"] forState:UIControlStateNormal];
        [_imageButton.layer setMasksToBounds:YES];
        [_imageButton.layer setCornerRadius:5.0];
        [self.contentView addSubview:_imageButton];
    }

    return self;
}

- (void)layoutSubviews {
    _label.frame = CGRectMake(100, 25, 300, 50);
    _imageButton.frame = CGRectMake(10, 10, 80, 80);
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
