//
//  FindViewController.m
//  网易云
//
//  Created by 张佳乔 on 2021/7/19.
//

#import "FindViewController.h"
#import "PersonalViewController.h"
#import "RollTableViewCell.h"
#import "ChoiceTableViewCell.h"
#import "RecommendTableViewCell.h"
#import "SelectedTableViewCell.h"
#import "ClassicTableViewCell.h"
#import "MiniTableViewCell.h"

@interface FindViewController () <keepSwitchDelegate>

@end


@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 80) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    //虚假的导航栏
    _falseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)];
    [self.view addSubview:_falseView];
    _falseView.backgroundColor = [UIColor whiteColor];
    
    //添加搜索框
    UISearchBar* customSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(82.5, 40, 250, 50)];
    customSearchBar.placeholder = @"大家都在听 帅气的柱哥哥";
    customSearchBar.delegate = self;
    customSearchBar.showsCancelButton = NO;
    customSearchBar.searchBarStyle = UISearchBarStyleMinimal;
    [_falseView addSubview:customSearchBar];
    
    //添加左按钮
    UIButton* leftButton =[UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"caidan.png"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(pressMenu) forControlEvents:UIControlEventTouchUpInside];
    leftButton.frame = CGRectMake(27.5, 57.5, 25, 25);
    [_falseView addSubview:leftButton];
    
    //添加右按钮
    UIButton* rightButton =[UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"maikefeng.png"] forState:UIControlStateNormal];
    rightButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 52.5, 57.5, 25, 25);
    [_falseView addSubview:rightButton];

    [_tableView registerClass:[RollTableViewCell class] forCellReuseIdentifier:@"roll"];
    [_tableView registerClass:[ChoiceTableViewCell class] forCellReuseIdentifier:@"choice"];
    [_tableView registerClass:[RecommendTableViewCell class] forCellReuseIdentifier:@"recommend"];
    [_tableView registerClass:[SelectedTableViewCell class] forCellReuseIdentifier:@"selected"];
    [_tableView registerClass:[ClassicTableViewCell class] forCellReuseIdentifier:@"classic"];
    [_tableView registerClass:[MiniTableViewCell class] forCellReuseIdentifier:@"yinyue"];
    [_tableView registerClass:[MiniTableViewCell class] forCellReuseIdentifier:@"hear"];
    [_tableView registerClass:[MiniTableViewCell class] forCellReuseIdentifier:@"song"];
}

//坐标移动时就调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    CGFloat top = 200;
    CGFloat buttom = -44;
    CGFloat now = scrollView.contentOffset.y;
    CGFloat alpha = (now - buttom) / (top - buttom);
    _falseView.alpha = 1 - alpha;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0 && indexPath.row == 2) {

        MiniTableViewCell *songCell = [_tableView dequeueReusableCellWithIdentifier:@"song" forIndexPath:indexPath];
        songCell.aImageView.image = [UIImage imageNamed:@"gedan.png"];
        songCell.label.text = @"推荐歌单";
        return songCell;
        
    } else if (indexPath.section == 1 && indexPath.row == 0) {

        MiniTableViewCell* hearCell = [_tableView dequeueReusableCellWithIdentifier:@"hear" forIndexPath:indexPath];
        hearCell.aImageView.image = [UIImage imageNamed:@"bigshuaxin.png"];
        hearCell.label.text = @"听过爱过的华语经典";
        return hearCell;

    } else if (indexPath.section == 2 && indexPath.row == 0) {

        MiniTableViewCell* musicCell = [_tableView dequeueReusableCellWithIdentifier:@"yinyue" forIndexPath:indexPath];
        musicCell.aImageView.image = [UIImage imageNamed:@"yinyue.png"];
        musicCell.label.text = @"精选音乐视频";
        return musicCell;
        
    } else if (indexPath.section == 0 && indexPath.row == 0) {
        
        RollTableViewCell* rollCell = [_tableView dequeueReusableCellWithIdentifier:@"roll" forIndexPath:indexPath];
        return rollCell;
        
    } else if (indexPath.section == 0 && indexPath.row == 1) {
        
        ChoiceTableViewCell* choiceCell = [_tableView dequeueReusableCellWithIdentifier:@"choice" forIndexPath:indexPath];
        return choiceCell;
        
    } else if (indexPath.section == 0 && indexPath.row == 3) {

        RecommendTableViewCell *recommendCell = [_tableView dequeueReusableCellWithIdentifier:@"recommend" forIndexPath:indexPath];
        return recommendCell;
        
    } else if (indexPath.section == 2 && indexPath.row == 1) {
        
        SelectedTableViewCell* selectedCell = [_tableView dequeueReusableCellWithIdentifier:@"selected" forIndexPath:indexPath];
        return selectedCell;
        
    } else {

        ClassicTableViewCell* classicCell = [_tableView dequeueReusableCellWithIdentifier:@"classic" forIndexPath:indexPath];
        return classicCell;
    }
    
}

//组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

//行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 4;
    } else {
        return 2;
    }
}

//高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 150;
    } else if (indexPath.section == 0 && indexPath.row == 1) {
        return 100;
    } else if (indexPath.section == 0 && indexPath.row == 2) {
        return 50;
    } else if (indexPath.section == 0 && indexPath.row == 3) {
        return 150;
    } else if (indexPath.section == 1 && indexPath.row == 0) {
        return 50;
    } else if (indexPath.section == 1 && indexPath.row == 1) {
        return 210;
    } else if (indexPath.section == 2 && indexPath.row == 0) {
        return 50;
    } else {
        return 150;
    }
}

//组间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 55;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}

//脚视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 20;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = [UIColor clearColor];
    return footerView;
}

- (void)pressMenu {
    PersonalViewController* menu = [[PersonalViewController alloc] init];
    menu.modalPresentationStyle = UIModalPresentationCustom;
    
    menu.delegate = self;
    menu.mySwitchisOn = _identification;
    [self presentViewController:menu animated:YES completion:nil];
}

- (void)recordSwitch:(BOOL)ident {
    _identification = ident;
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
