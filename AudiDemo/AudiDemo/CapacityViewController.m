//
//  CapacityViewController.m
//  AudiDemo
//
//  Created by sourcecode on 16/1/29.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "CapacityViewController.h"
#import "TouchImageView.h"
#import "MMSpinImageView.h"

@interface CapacityViewController ()
<
UIScrollViewDelegate,
ImageViewDelegate
>
@property (nonatomic ,strong) UIScrollView *scrollView;
@property (nonatomic ,strong) TouchImageView *carView;
@property (nonatomic, strong) NSMutableArray *carimagesOpen;
@property (nonatomic, strong) NSMutableArray *carimagesClose;
@property (nonatomic, assign) NSInteger tmpPage;
@property (nonatomic, strong) MMSpinImageView *dipanView;
@property (nonatomic, strong) NSMutableArray *dipanImageNameArray;
@property (nonatomic, strong) UIImageView *bihuView;

@end

@implementation CapacityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *headview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 65)];
    headview.image = [UIImage imageNamed:@"top_logo"];
    [self.view addSubview:headview];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [self.view insertSubview:self.scrollView belowSubview:headview];
    //    self.scrollView.backgroundColor = [UIColor redColor];
    self.scrollView.contentSize = CGSizeMake(1024*4, 0);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    
    UIPageControl *pageConteol = [[UIPageControl alloc] initWithFrame:CGRectMake(512-25, self.view.frame.size.height - 30, 50, 20)];
    //    pageConteol.backgroundColor = [UIColor redColor];
    pageConteol.numberOfPages = 4;
    pageConteol.tag = 210;
    pageConteol.pageIndicatorTintColor = [UIColor grayColor];
    pageConteol.currentPageIndicatorTintColor = [UIColor blackColor];
    [self.view addSubview:pageConteol];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(512-25-50, self.view.frame.size.height - 27, 0, 0)];
    title.text = @"性能";
    title.textColor = [UIColor grayColor];
    title.font = [UIFont systemFontOfSize:13];
    [title sizeToFit];
    [self.view addSubview:title];
    
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
    
    
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
//        view1.backgroundColor = [UIColor greenColor];
    [self.scrollView addSubview:view1];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(1024, 0, 1024, 768)];
//        view2.backgroundColor = [UIColor blueColor];
    [self.scrollView insertSubview:view2 belowSubview:view1];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(1024*2, 0, 1024, 768)];
//        view3.backgroundColor = [UIColor purpleColor];
    [self.scrollView insertSubview:view3 aboveSubview:view2];
    
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(1024*3, 0, 1024, 768)];
//        view3.backgroundColor = [UIColor purpleColor];
    [self.scrollView insertSubview:view4 aboveSubview:view3];
    
    UIImageView *seite1 = [[UIImageView alloc] initWithFrame:CGRectMake(-150, -100, 1100, 820)];
    seite1.image = [UIImage imageNamed:@"05_seite_01"];
    [view1 addSubview:seite1];
    
    UIImageView *engine = [[UIImageView alloc] initWithFrame:CGRectMake(390, 200, 577, 495)];
    engine.image = [UIImage imageNamed:@"4-1-engine"];
    [seite1 addSubview:engine];
    
    UIImageView *word1 = [[UIImageView alloc] initWithFrame:CGRectMake(90, 300, 210, 116)];
    word1.image = [UIImage imageNamed:@"4-1-1"];
    [view1 addSubview:word1];
    

// 底盘动画
    self.dipanImageNameArray = [NSMutableArray new];
    self.dipanView = [[MMSpinImageView alloc] initWithFrame:CGRectMake(-100, 110, 1172, 814)];
    self.dipanView.canAround = NO;
    [view2 addSubview:self.dipanView];
    for (int i = 14; i > 0; i--)
    {
        NSString *tmpNum = i <= 9?[NSString stringWithFormat:@"0%d",i]:[NSString stringWithFormat:@"%d",i];
        NSString *imageNameStr = [NSString stringWithFormat:@"blatt_%@.jpg",tmpNum];
        UIImage *imageName = [UIImage imageNamed:imageNameStr];
        [self.dipanImageNameArray addObject:imageName];
    }
    self.dipanView.imagesArray = self.dipanImageNameArray;
    self.dipanView.currentIndex = self.dipanImageNameArray.count-1;
    
    UIImageView *text = [[UIImageView alloc] initWithFrame:CGRectMake(-100, -50, 708, 489)];
    text.image = [UIImage imageNamed:@"text_blatt"];
    [view2 addSubview:text];
    
    UIImageView *word2 = [[UIImageView alloc] initWithFrame:CGRectMake(150, 180, 480, 204)];
    word2.image = [UIImage imageNamed:@"4-2-2"];
    [text addSubview:word2];
    
// 壁虎动画
    NSMutableArray *arrayImg=[NSMutableArray array];
    
    for(int i=8;i<76;i++){
        
        NSString *imgName=[NSString stringWithFormat:@"101105a_TopShotComb.%04d",i];
        
        NSString *imgpath=[[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:imgName];
        // 与下面这句效果相同
        // NSString *imgpath=[[NSBundle mainBundle] pathForResource:imgName ofType:nil];
        
        UIImage *image=[UIImage imageWithContentsOfFile:imgpath];
        [arrayImg addObject:image];
    }
    
    
    self.bihuView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 300, 180,450)];
    self.bihuView.userInteractionEnabled = YES;
//    self.bihuView.backgroundColor = [UIColor redColor];
    self.bihuView.image = [UIImage imageNamed:@"101105a_TopShotComb.0075"];
    self.bihuView.contentMode = UIViewContentModeBottom;
    self.bihuView.clipsToBounds = YES;
    [view2 addSubview:self.bihuView];
    self.bihuView.animationImages = arrayImg;
    self.bihuView.animationRepeatCount = 1;
    self.bihuView.animationDuration = 5;

  
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapbihuView)];
    tap.numberOfTapsRequired = 1;
    [self.bihuView addGestureRecognizer:tap];
    
    UIImageView *dipanRoll = [[UIImageView alloc] initWithFrame:CGRectMake(870, 700, 112, 15)];
    dipanRoll.image = [UIImage imageNamed:@"dipanRoll"];
    [view2 addSubview:dipanRoll];


    
    
    UIImageView *seite3 = [[UIImageView alloc] initWithFrame:CGRectMake(50, 30, 1040, 720)];
    seite3.image = [UIImage imageNamed:@"05_seite_02"];
    [view3 addSubview:seite3];
    
    UIImageView *wordbg = [[UIImageView alloc] initWithFrame:CGRectMake(-50, 70, 442, 378)];
    wordbg.image = [UIImage imageNamed:@"05_Zettel_seite_02"];
    [seite3 addSubview:wordbg];
    
    UIImageView *word3 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 30, 402, 268)];
    word3.image = [UIImage imageNamed:@"4-3-words"];
    [wordbg addSubview:word3];
    
    UIImageView *word4 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 550, 373, 60)];
    word4.image = [UIImage imageNamed:@"4-3-5"];
    [seite3 addSubview:word4];
    
    UIImageView *seite4 = [[UIImageView alloc] initWithFrame:CGRectMake(100, -30, 1070, 770)];
    seite4.image = [UIImage imageNamed:@"05_seite_03"];
    seite4.userInteractionEnabled = YES;
    [view4 addSubview:seite4];
    
    UIImageView *wordbg2 = [[UIImageView alloc] initWithFrame:CGRectMake(-80, 80, 440, 329)];
    wordbg2.image = [UIImage imageNamed:@"05_Zettel_seite_03"];
    [seite4 addSubview:wordbg2];
    
    UIImageView *word5 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 397, 275)];
    word5.image = [UIImage imageNamed:@"4-4-words"];
    [wordbg2 addSubview:word5];
    
    UIImageView *word6 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 550, 364, 66)];
    word6.image = [UIImage imageNamed:@"4-4-4"];
    [seite4 addSubview:word6];
    
    UIImageView *word7 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 600, 757, 97)];
    word7.image = [UIImage imageNamed:@"4-4-5"];
    [seite4 addSubview:word7];
    
    self.carView = [[TouchImageView alloc] initWithFrame:CGRectMake(230, 30, 800, 600)];
    self.carView.delegate = self;
    self.carView.userInteractionEnabled = YES;
    [seite4 addSubview:self.carView];

    for (int i = 1; i <17; i++) {
        
        NSString *tmpNum = i <= 9?[NSString stringWithFormat:@"0%d",i]:[NSString stringWithFormat:@"%d",i];
        NSString *imageName = [NSString stringWithFormat:@"animation_karosse00%@",tmpNum];
        UIImage *carImage = [UIImage imageNamed:imageName];
        [self.carimagesOpen addObject:carImage];
    }
    
    for (int i = 16; i >0; i--) {
        
        NSString *tmpNum = i <= 9?[NSString stringWithFormat:@"0%d",i]:[NSString stringWithFormat:@"%d",i];
        NSString *imageName = [NSString stringWithFormat:@"animation_karosse00%@",tmpNum];
        UIImage *carImage = [UIImage imageNamed:imageName];
        [self.carimagesClose addObject:carImage];
    }
    self.carView.image = [UIImage imageNamed:@"animation_karosse0001"];
    self.carView.animationImages = self.carimagesClose;
    self.carView.animationRepeatCount = 1;
    [self.carView startAnimating];
}

- (void)tapbihuView
{
     [self.bihuView startAnimating];
    
    [UIView animateWithDuration:3 delay:2.8 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        // 1. 用一个临时变量保存返回值。
        
        CGRect temp = self.bihuView.frame;
        
        // 2. 给这个变量赋值。因为变量都是L-Value，可以被赋值
        
        temp.origin.x = 40;
        temp.origin.y = 270;
        
        // 3. 修改frame的值
        
        self.bihuView.frame = temp;
    } completion:^(BOOL finished) {
        
    }];
    
    
    
   
}

-(void)TouchesBegin:(NSInteger)imageTag
{
    self.tmpPage = 3;
    
    if ([self.carView.animationImages isEqualToArray:self.carimagesClose])
    {
        self.carView.animationImages = self.carimagesOpen;
        self.carView.image = [UIImage imageNamed:@"animation_karosse0016"];
    }
    else
    {
        self.carView.animationImages = self.carimagesClose;
        self.carView.image = [UIImage imageNamed:@"animation_karosse0001"];
    }
    
    [self.carView startAnimating];
    
}

- (void)backToMeun
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 记录scrollView 的当前位置，因为已经设置了分页效果，所以：位置/屏幕大小 = 第几页
    int current = scrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width;

    //根据scrollView 的位置对page 的当前页赋值
    UIPageControl *page = (UIPageControl *)[self.view viewWithTag:210];
    page.currentPage = current;
    
    NSLog(@"currentPage%d tmpPage%d",page.currentPage,self.tmpPage);
    
    if (page.currentPage == 3 && self.tmpPage == 2)
    {
        if ([self.carView.animationImages isEqualToArray:self.carimagesClose])
        {
            self.carView.animationImages = self.carimagesOpen;
            self.carView.image = [UIImage imageNamed:@"animation_karosse0016"];
        }
        else
        {
            self.carView.animationImages = self.carimagesClose;
            self.carView.image = [UIImage imageNamed:@"animation_karosse0001"];
        }
        
        [self.carView startAnimating];
    }
    
   
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    int current = scrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width;
    self.tmpPage = current;
}

#pragma mark - GetMethod
- (NSMutableArray *)carimagesOpen
{
    if (!_carimagesOpen) {
        _carimagesOpen = [NSMutableArray new];
    }
    return _carimagesOpen;
}

- (NSMutableArray *)carimagesClose
{
    if (!_carimagesClose) {
        _carimagesClose = [NSMutableArray new];
    }
    return _carimagesClose;
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
