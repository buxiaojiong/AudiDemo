//
//  PriceListViewController.m
//  AudiDemo
//
//  Created by sourcecode on 16/1/29.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "PriceListViewController.h"

@interface PriceListViewController ()
<
UIScrollViewDelegate
>
@property (nonatomic ,strong)UIScrollView *scrollView;

@end

@implementation PriceListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *headview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 65)];
    headview.image = [UIImage imageNamed:@"top_logo"];
    [self.view addSubview:headview];
    
    UIImageView *titleText = [[UIImageView alloc] initWithFrame:CGRectMake(25, 65, 278, 26)];
    titleText.image = [UIImage imageNamed:@"equipment-titletext"];
    [self.view addSubview:titleText];
    
    UIImageView *header = [[UIImageView alloc] initWithFrame:CGRectMake(25, 65+26, 967, 46)];
    header.image = [UIImage imageNamed:@"equipment-header"];
    [self.view addSubview:header];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(25, 65+26+46, 967, 525)];
    [self.view addSubview:self.scrollView];
//    self.scrollView.backgroundColor = [UIColor redColor];
    self.scrollView.contentSize = CGSizeMake(0, 3038);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    
    UIImageView *equipment1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 967, 550)];
    equipment1.image = [UIImage imageNamed:@"equipment-1"];
    [self.scrollView addSubview:equipment1];
    
    UIImageView *equipment2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 550, 967, 550)];
    equipment2.image = [UIImage imageNamed:@"equipment-2"];
    [self.scrollView addSubview:equipment2];
    
    UIImageView *equipment3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 550*2, 967, 550)];
    equipment3.image = [UIImage imageNamed:@"equipment-3"];
    [self.scrollView addSubview:equipment3];
    
    UIImageView *equipment4 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 550*3, 967, 550)];
    equipment4.image = [UIImage imageNamed:@"equipment-4"];
    [self.scrollView addSubview:equipment4];
    
    UIImageView *equipment5 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 550*4, 967, 550)];
    equipment5.image = [UIImage imageNamed:@"equipment-5"];
    [self.scrollView addSubview:equipment5];
    
    UIImageView *equipment6 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 550*5, 967, 288)];
    equipment6.image = [UIImage imageNamed:@"equipment-6"];
    [self.scrollView addSubview:equipment6];
    
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, self.view.frame.size.height - 40, 100, 30)];
    [backBtn setTitle:@"返回首页" forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"icon_uebersicht"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"icon_uebersicht_aktiv"] forState:UIControlStateHighlighted];
    [backBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    backBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [backBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
    [self.view addSubview:backBtn];
    [backBtn addTarget:self action:@selector(backToMeun) forControlEvents:UIControlEventTouchUpInside];
}

- (void)backToMeun
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
