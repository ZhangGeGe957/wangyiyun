//
//  MyViewController.m
//  网易云
//
//  Created by 张佳乔 on 2021/7/19.
//

#import "MyViewController.h"
#import "PersonalViewController.h"
#import "MyTableViewCell.h"
#import "PhotoWallViewController.h"

@interface MyViewController ()
//遵守代理协议
<PhotoWallDelegate, keepSwitchDelegate>

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem* leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"caidan.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressMenu)];
    self.navigationItem.leftBarButtonItem = leftButton;
    leftButton.tintColor = [UIColor blackColor];
    
    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"sousuo.png"] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = rightButton;
    rightButton.tintColor = [UIColor blackColor];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"shuaigege"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 100;
    } else {
        return 50;
    }
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        _cell = [_tableView dequeueReusableCellWithIdentifier:@"shuaigege" forIndexPath:indexPath];
        _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [_cell.imageButton addTarget:self action:@selector(playWall:) forControlEvents:UIControlEventTouchUpInside];
        return _cell;
    } else {
        MyTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"shuaigege" forIndexPath:indexPath];
        return cell;
    }
}

- (void)pressMenu {
    PersonalViewController* menu = [[PersonalViewController alloc] init];

    menu.modalPresentationStyle = UIModalPresentationCustom;
    menu.delegate = self;
    menu.mySwitchisOn = _identification;
    [self presentViewController:menu animated:YES completion:nil];
}

- (void)playWall:(UIButton*)imageButton {
    PhotoWallViewController* photoWall = [[PhotoWallViewController alloc] init];
     
    //创建代理，执行换头像的方法，即有代理协议的类的代理为现在的视图，就能获取到传过来的值
    photoWall.delegate = self;
    
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:photoWall];
    
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)changePhoto:(NSMutableArray *)imageArray {
    //全局的UILabel，进来就判断其tag值，为1就清除
    if (_quantity.tag == 1) {
        [_quantity removeFromSuperview];
    }
    
    //改头像
    UIButton* button = imageArray[0];
    NSInteger sum = imageArray.count;
    [_cell.imageButton setImage:button.imageView.image forState:UIControlStateNormal];
    
    //加个数
    NSString* number = [[NSString alloc] initWithFormat:@"%ld", sum];
    _quantity = [[UILabel alloc] init];
    _quantity.text = number;
    _quantity.textColor = [UIColor redColor];
    _quantity.tag = 1;
    _quantity.frame = CGRectMake(65, 3, 18, 18);
    [_cell.imageButton addSubview:_quantity];
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
