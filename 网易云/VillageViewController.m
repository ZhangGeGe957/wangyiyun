//
//  VillageViewController.m
//  网易云
//
//  Created by 张佳乔 on 2021/7/19.
//

#import "VillageViewController.h"
#import "PersonalViewController.h"

@interface VillageViewController ()<keepSwitchDelegate>

@end

@implementation VillageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"tianjia.png"] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = rightButton;
    rightButton.tintColor = [UIColor blackColor];
    
    UIBarButtonItem* leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"caidan.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressMenu)];
    self.navigationItem.leftBarButtonItem = leftButton;
    leftButton.tintColor = [UIColor blackColor];
    
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
