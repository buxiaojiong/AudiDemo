//
//  AllRoundDisplayViewController.m
//  AudiDemo
//
//  Created by sourcecode on 16/1/29.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "AllRoundDisplayViewController.h"
#import "MMSpinImageView.h"

@interface AllRoundDisplayViewController ()


@property (nonatomic, strong) UIButton *lungu18;
@property (nonatomic, strong) UIButton *lungu19;
@property (nonatomic, strong) UIButton *outsideBtn;
@property (nonatomic, strong) UIButton *insideBtn;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong)NSArray *titleArray;
@property (nonatomic, strong)NSArray *colorArray;
@property (nonatomic, strong)NSMutableArray *colorBtnArray;
@property (nonatomic, strong) MMSpinImageView *imageView;
@property (nonatomic, strong)NSMutableArray *imageNameArray;
@property (nonatomic, copy)NSString *carLunguStr;
@property (nonatomic, copy)NSString *carColorStr;
@property (nonatomic, assign) NSInteger imagecurrentIndex;

@end

@implementation AllRoundDisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *headview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 65)];
    headview.image = [UIImage imageNamed:@"top_logo"];
    [self.view addSubview:headview];
    
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
    
    self.lungu18 = [[UIButton alloc] initWithFrame:CGRectMake(30, 560, 50, 50)];
    [self.lungu18 setImage:[UIImage imageNamed:@"colorButtonlungu18"] forState:UIControlStateNormal];
    [self.lungu18 addTarget:self action:@selector(lungu18Pressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.lungu18];
    
    self.lungu19 = [[UIButton alloc] initWithFrame:CGRectMake(30, 620, 50, 50)];
    [self.lungu19 setImage:[UIImage imageNamed:@"colorButtonlungu19"] forState:UIControlStateNormal];
    [self.lungu19 addTarget:self action:@selector(lungu19Pressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.lungu19];
    
    UILabel *name18 = [[UILabel alloc] initWithFrame:CGRectMake(80, 578, 0, 0)];
    name18.text = @"7辐18寸铸铝车轮";
    name18.font = [UIFont systemFontOfSize:13];
    [name18 sizeToFit];
    [self.view addSubview:name18];
    
    UILabel *name19 = [[UILabel alloc] initWithFrame:CGRectMake(80, 638, 0, 0)];
    name19.text = @"10辐19寸铸铝车轮";
    name19.font = [UIFont systemFontOfSize:13];
    [name19 sizeToFit];
    [self.view addSubview:name19];
    
    UIImageView *gb = [[UIImageView alloc] initWithFrame:CGRectMake(151.5, 670, 721, 74)];
    gb.image = [UIImage imageNamed:@"colorButtonBG"];
    gb.userInteractionEnabled = YES;
    [self.view addSubview:gb];
    
    self.colorBtnArray = [NSMutableArray new];
    
    for (int i = 0; i < 11; i++) {
        UILabel *colorName = [[UILabel alloc] initWithFrame:CGRectMake(67+i*52, 45, 55, 25)];
        colorName.text = self.titleArray[i];
//        colorName.backgroundColor = [UIColor redColor];
        colorName.textAlignment = NSTextAlignmentCenter;
        colorName.font = [UIFont systemFontOfSize:13];
        [gb addSubview:colorName];
        
        UIButton *colorBtn = [[UIButton alloc] initWithFrame:CGRectMake(70+i*52, 10, 51, 35)];
        NSString *imageNomal = [NSString stringWithFormat:@"colorButton%@",self.colorArray[i]];
        NSString *imageSeled = [NSString stringWithFormat:@"OutButtonSelect%@",self.colorArray[i]];
        [colorBtn setImage:[UIImage imageNamed:imageNomal] forState:UIControlStateNormal];
        [colorBtn setImage:[UIImage imageNamed:imageSeled] forState:UIControlStateSelected];
        colorBtn.tag = 1000+i;
        [colorBtn addTarget:self action:@selector(colorBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [gb addSubview:colorBtn];
        
        [self.colorBtnArray addObject:colorBtn];
    }
    
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(482, 580, 60, 30)];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:15];
//    titleLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.titleLabel];
    
    self.outsideBtn = [[UIButton alloc] initWithFrame:CGRectMake(875, 580, 129, 65)];
    [self.outsideBtn setBackgroundImage:[UIImage imageNamed:@"Three60Button"] forState:UIControlStateNormal];
    [self.outsideBtn setBackgroundImage:[UIImage imageNamed:@"Three60Button"] forState:UIControlStateSelected];
    [self.outsideBtn setTitle:@"外观" forState:UIControlStateNormal];
    [self.outsideBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.outsideBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    self.outsideBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.outsideBtn addTarget:self action:@selector(outsideBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.outsideBtn];
    
    self.insideBtn = [[UIButton alloc] initWithFrame:CGRectMake(875, 655, 129, 65)];
    [self.insideBtn setBackgroundImage:[UIImage imageNamed:@"Three60Button"] forState:UIControlStateNormal];
    [self.insideBtn setBackgroundImage:[UIImage imageNamed:@"Three60Button"] forState:UIControlStateSelected];
    [self.insideBtn setTitle:@"内饰" forState:UIControlStateNormal];
    [self.insideBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.insideBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    self.insideBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.insideBtn addTarget:self action:@selector(insideBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.insideBtn];
    
    self.imageView = [[MMSpinImageView alloc] initWithFrame:CGRectMake(35, 250, 954, 309)];
    self.imageView.canAround = YES;
    [self.view addSubview:self.imageView];

    self.imageNameArray = [NSMutableArray new];
    
    self.carColorStr = @"33";
    [self outsideBtnPressed:self.outsideBtn];
    [self lungu18Pressed:self.lungu18];
    [self colorBtnPressed:self.colorBtnArray[5]];

}

- (void)lungu18Pressed:(UIButton *)sender
{
    sender.selected = YES;
    self.lungu19.selected = NO;
    NSLog(@"currentIndex%ld",(long)self.imageView.currentIndex);
    
    self.imagecurrentIndex = self.imageView.currentIndex;
    self.carLunguStr = @"18";
    [self setUpThreeDImages];
}

- (void)lungu19Pressed:(UIButton *)sender
{
    sender.selected = YES;
    self.lungu18.selected = NO;
    
    self.imagecurrentIndex = self.imageView.currentIndex;
    self.carLunguStr = @"19";
    [self setUpThreeDImages];
}

- (void)colorBtnPressed:(UIButton *)sender
{
    sender.selected = YES;
    for (UIButton *btn in self.colorBtnArray)
    {
        if (btn != sender)
        {
            btn.selected = NO;
        }
    }
    int i = sender.tag - 1000;
    self.titleLabel.text = self.titleArray[i];
    self.imagecurrentIndex = self.imageView.currentIndex;
    self.carColorStr = self.colorArray[i];
    [self setUpThreeDImages];
}

- (void)setUpThreeDImages
{
    NSLog(@"carLunguStr%@ carColorStr%@",self.carLunguStr,self.carColorStr);
   
    [self.imageNameArray removeAllObjects];
    for (int i = 36; i >= 0; i--)
    {
        int a = i*2;
        NSString *tmpNum;
        if (a <= 9)
        {
            tmpNum = [NSString stringWithFormat:@"0%d",a];
        }
        else
        {
            tmpNum = [NSString stringWithFormat:@"%d",a];
        }
        
        NSString *imageNameStr = [NSString stringWithFormat:@"100%@色%@－1024_000%@",self.carColorStr,self.carLunguStr,tmpNum];
        UIImage *imageName = [UIImage imageNamed:imageNameStr];
        [self.imageNameArray addObject:imageName];
    }
    
    self.imageView.imagesArray = self.imageNameArray;
    self.imageView.currentIndex = self.imagecurrentIndex;
}

- (void)outsideBtnPressed:(UIButton *)sender
{
    sender.selected = YES;
    self.insideBtn.selected = NO;


}

- (void)insideBtnPressed:(UIButton *)sender
{
    sender.selected = YES;
    self.outsideBtn.selected = NO;
    
    
}



- (void)backToMeun
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = [NSArray arrayWithObjects:@"石榴红",@"乌龙灰",@"达科塔灰",@"斑羚米",@"朱鹭白",@"水晶银",@"石英灰",@"月光蓝",@"天云灰",@"旋风黑",@"哈瓦那黑", nil];
    }
    return _titleArray;
}

- (NSArray *)colorArray
{
    if (!_colorArray) {
        _colorArray = [NSArray arrayWithObjects:@"39",@"41",@"40",@"35",@"32",@"33",@"37",@"38",@"34",@"42",@"36", nil];
    }
    return _colorArray;
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
