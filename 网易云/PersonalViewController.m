//
//  PersonalViewController.m
//  网易云
//
//  Created by 张佳乔 on 2021/7/19.
//

#import "PersonalViewController.h"
#import "MiniTableViewCell.h"
#import "FindViewController.h"

@interface PersonalViewController ()

@end

@implementation PersonalViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _mySwitch = [[UISwitch alloc] init];
    _mySwitch.on = NO;
    
    _cell01 = [[NSArray alloc] initWithObjects:@"消息中心", @"云贝中心", @"创作者中心", nil];
    _cell02 = [[NSArray alloc] initWithObjects:@"演出", @"商城", @"口袋彩铃", @"游戏专区", nil];
    _cell03 = [[NSArray alloc] initWithObjects:@"设置", @"夜间模式", @"定时关闭", @"个性装扮", @"边听边存", @"在线听歌免流量", @"添加Siri捷径", @"音乐黑名单", @"青少年模式", @"音乐闹钟", nil];
    _cell04 = [[NSArray alloc] initWithObjects:@"我的客服", @"我的订单", @"分享网易云音乐", @"关于", nil];
    
    UIImage* image = [UIImage imageNamed:@"white.jpeg"];
    UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width * 0.8, 100);
    [self.view addSubview:imageView];
    
    //创建一个扫码按钮
    UIButton* saoma = [UIButton buttonWithType:UIButtonTypeCustom];
    saoma.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.8 - 50, 51.5, 32, 32);
    [saoma setImage:[UIImage imageNamed:@"saoma.png"] forState:UIControlStateNormal];
    [self.view addSubview:saoma];
    
    //创建头像
    UIButton* touxiang = [UIButton buttonWithType:UIButtonTypeCustom];
    touxiang.frame = CGRectMake(16.5, 58, 32, 32);
    [touxiang setImage:[UIImage imageNamed:@"minitouxiang.jpeg"] forState:UIControlStateNormal];
    touxiang.layer.cornerRadius = 15;
    touxiang.clipsToBounds = YES;
    [self.view addSubview:touxiang];
    
    //创建名字
    UILabel* name = [[UILabel alloc] init];
    name.text = @"BaoZaoboy >";
    name.frame = CGRectMake(50, 58, 200, 32);
    [self.view addSubview:name];
    
    
    //创建一个新的newview加到该主view上
    UIView* newView = [[UIView alloc] init];
    newView.backgroundColor = [UIColor whiteColor];
    newView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width * 0.8, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:newView];
    
    //创建一个按钮，点击返回，加在这个主view上
    UIButton* white = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    white.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.8, 0, [UIScreen mainScreen].bounds.size.width * 0.2, [UIScreen mainScreen].bounds.size.height);
    [white addTarget:self action:@selector(pressWhite) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:white];
    
    //创建数据视图
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width * 0.8, [UIScreen mainScreen].bounds.size.height - 70) style:UITableViewStyleGrouped];
    
    //去掉间隔线
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //自动调整子视图大小
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [newView addSubview:_tableView];
    _tableView.backgroundColor = [UIColor clearColor];
    
    [_tableView registerClass:[MiniTableViewCell class] forCellReuseIdentifier:@"cell"];
    [_tableView registerClass:[MiniTableViewCell class] forCellReuseIdentifier:@"switch"];
    [_tableView registerClass:[MiniTableViewCell class] forCellReuseIdentifier:@"tuichu"];
}

//创建单元格对象
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ((indexPath.section != 2 || indexPath.row != 1) && indexPath.section != 4) {
        MiniTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.label.text = nil;
        cell.label.textColor = [UIColor blackColor];
        if (indexPath.section == 0) {
                NSString* strName = [[NSString alloc] initWithFormat:@"%ld-%ld.png", indexPath.section + 1, indexPath.row + 1];
                    cell.aImageView.image = [UIImage imageNamed:strName];
                    cell.label.text = _cell01[indexPath.row];
            } else if (indexPath.section == 1) {
                NSString* strName = [[NSString alloc] initWithFormat:@"%ld-%ld.png", indexPath.section + 1, indexPath.row + 1];
                    cell.aImageView.image = [UIImage imageNamed:strName];
                    cell.label.text = _cell02[indexPath.row];
            } else if (indexPath.section == 2) {
                NSString* strName = [[NSString alloc] initWithFormat:@"%ld-%ld.png", indexPath.section + 1, indexPath.row + 1];
                    cell.aImageView.image = [UIImage imageNamed:strName];
                    cell.label.text = _cell03[indexPath.row];
            } else {
                NSString* strName = [[NSString alloc] initWithFormat:@"%ld-%ld.png", indexPath.section + 1, indexPath.row + 1];
                    cell.aImageView.image = [UIImage imageNamed:strName];
                    cell.label.text = _cell04[indexPath.row];
            }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    } else if (indexPath.section == 2 && indexPath.row == 1) {
        
        MiniTableViewCell *switchCell = [_tableView dequeueReusableCellWithIdentifier:@"switch" forIndexPath:indexPath];
        switchCell.label.text = @"夜间模式";
        switchCell.aImageView.image = [UIImage imageNamed:@"3-2.png"];
        [_mySwitch setOn:(_mySwitchisOn || _yesOrNo)];
        [_mySwitch addTarget:self action:@selector(onSwitch:) forControlEvents:UIControlEventValueChanged];
        switchCell.accessoryView = _mySwitch;
        return switchCell;
            
    } else {
        
        MiniTableViewCell *tuiChuCell = [_tableView dequeueReusableCellWithIdentifier:@"tuichu" forIndexPath:indexPath];
        tuiChuCell.label.text = @"退出登陆";
        return tuiChuCell;
        
    }
}

//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    } else if (section == 1) {
        return 4;
    } else if (section == 2) {
        return 10;
    } else if (section == 3) {
        return 4;
    } else {
        return 1;
    }
}

//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

//设置头标题
- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return @"音乐服务";
    } else if (section == 2) {
        return @"其他";
    } else {
        return nil;
    }
}

//获取头部高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}
 

//获取尾部高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}


- (void) pressWhite {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) onSwitch:(UISwitch*)mySwitch {
    _yesOrNo = _mySwitch.isOn;
    BOOL judge = _mySwitch.isOn;
    [_delegate recordSwitch:judge];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
