//
//  appearanceViewController.m
//  AudiDemo
//
//  Created by sourcecode on 16/1/28.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "appearanceViewController.h"

#import "moveImageView.h"

@interface appearanceViewController ()
<
UIScrollViewDelegate,
moveImageViewDelegate
>

@property (nonatomic ,strong) UIScrollView *scrollView;
@property (nonatomic ,strong) UIView *view4;

@property (nonatomic ,strong) moveImageView *moveImage1;
@property (nonatomic ,strong) moveImageView *moveImage2;
@property (nonatomic ,strong) moveImageView *moveImage3;
@property (nonatomic ,strong) moveImageView *moveImage4;
@property (nonatomic ,strong) moveImageView *moveImage5;
@property (nonatomic ,strong) moveImageView *moveImage6;
@property (nonatomic ,strong) moveImageView *moveImage7;
@property (nonatomic, assign) NSInteger tmpPage;

@end

@implementation appearanceViewController

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
    self.scrollView.contentSize = CGSizeMake(1024*5, 0);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    
    UIPageControl *pageConteol = [[UIPageControl alloc] initWithFrame:CGRectMake(512-25, self.view.frame.size.height - 30, 50, 20)];
    //    pageConteol.backgroundColor = [UIColor redColor];
    pageConteol.numberOfPages = 5;
    pageConteol.tag = 208;
    pageConteol.pageIndicatorTintColor = [UIColor grayColor];
    pageConteol.currentPageIndicatorTintColor = [UIColor blackColor];
    [self.view addSubview:pageConteol];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(512-25-50, self.view.frame.size.height - 27, 0, 0)];
    title.text = @"外形";
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
    //    view1.backgroundColor = [UIColor greenColor];
    [self.scrollView addSubview:view1];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(1024, 0, 1024, 768)];
    //    view2.backgroundColor = [UIColor blueColor];
    [self.scrollView addSubview:view2];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(1024*2, 0, 1024, 768)];
    //    view3.backgroundColor = [UIColor purpleColor];
    [self.scrollView addSubview:view3];
    
    self.view4 = [[UIView alloc] initWithFrame:CGRectMake(1024*3, 0, 1024, 768)];
    //    view3.backgroundColor = [UIColor purpleColor];
    
    [self.scrollView addSubview:self.view4];
    
    UIView *view5 = [[UIView alloc] initWithFrame:CGRectMake(1024*4, 0, 1024, 768)];
    //    view3.backgroundColor = [UIColor purpleColor];
    [self.scrollView addSubview:view5];
    
    
    UIImageView *seite1 = [[UIImageView alloc] initWithFrame:CGRectMake(-50, -150, 1280, 920)];
    seite1.image = [UIImage imageNamed:@"02_seite_01"];
    [view1 addSubview:seite1];
    
    UIImageView *word1 = [[UIImageView alloc] initWithFrame:CGRectMake(150, 420, 343, 100)];
    word1.image = [UIImage imageNamed:@"2-1-1"];
    [view1 addSubview:word1];
    
    UIImageView *word2 = [[UIImageView alloc] initWithFrame:CGRectMake(490, 500, 374, 43)];
    word2.image = [UIImage imageNamed:@"2-1-2"];
    [view1 addSubview:word2];
    
    UIImageView *word3 = [[UIImageView alloc] initWithFrame:CGRectMake(490, 550, 462,91)];
    word3.image = [UIImage imageNamed:@"2-1-3"];
    [view1 addSubview:word3];
    
    UIImageView *seite2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, 1000, 675)];
    seite2.image = [UIImage imageNamed:@"02_seite_02"];
    [view2 addSubview:seite2];

    UIImageView *word4 = [[UIImageView alloc] initWithFrame:CGRectMake(680, 350, 250, 65)];
    word4.image = [UIImage imageNamed:@"2-2-2"];
    [view2 addSubview:word4];

    UIImageView *word5 = [[UIImageView alloc] initWithFrame:CGRectMake(680, 450, 254, 118)];
    word5.image = [UIImage imageNamed:@"2-2-1"];
    [view2 addSubview:word5];
    
    UIImageView *seite3 = [[UIImageView alloc] initWithFrame:CGRectMake(-410, -350, 1540, 1100)];
    seite3.image = [UIImage imageNamed:@"02_seite_03"];
    [view3 addSubview:seite3];

    UIImageView *word6 = [[UIImageView alloc] initWithFrame:CGRectMake(40, 100, 304, 91)];
    word6.image = [UIImage imageNamed:@"2-3-1"];
    [view3 addSubview:word6];
    
    UIImageView *word7 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 200, 356, 122)];
    word7.image = [UIImage imageNamed:@"2-3-2"];
    [view3 addSubview:word7];
    
    UIImageView *seite4 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 160, 1000,558)];
    seite4.image = [UIImage imageNamed:@"02_seite_04"];
    seite4.userInteractionEnabled = YES;
    [self.view4 addSubview:seite4];
    
    UIButton *reset = [[UIButton alloc] initWithFrame:CGRectMake(200, 715, 26, 20)];
    [reset setImage:[UIImage imageNamed:@"icon_reset"] forState:UIControlStateNormal];
    [reset setImage:[UIImage imageNamed:@"icon_reset_aktiv"] forState:UIControlStateSelected];
    [self.view4 addSubview:reset];
    
    UIButton *photos = [[UIButton alloc] initWithFrame:CGRectMake(300, 715, 26, 20)];
    [photos setImage:[UIImage imageNamed:@"icon_photos_zuruek"] forState:UIControlStateNormal];
    [photos setImage:[UIImage imageNamed:@"icon_photos_zuruek_activ"] forState:UIControlStateSelected];
    [self.view4 addSubview:photos];
    

    
    UIImageView *seite5 = [[UIImageView alloc] initWithFrame:CGRectMake(-10, -50, 1066, 752)];
    seite5.image = [UIImage imageNamed:@"02_seite_05"];
    [view5 addSubview:seite5];

    UIImageView *movie = [[UIImageView alloc] initWithFrame:CGRectMake(35, 90, 680, 382)];
    movie.image = [UIImage imageNamed:@"schauraumfilm_poster"];
    movie.userInteractionEnabled = YES;
    movie.transform = CGAffineTransformMakeRotation(-M_PI/37);
    [view5 addSubview:movie];
    
    UIButton *playMovie = [[UIButton alloc] initWithFrame:CGRectMake(272, 138.5, 136, 105)];
    [playMovie setImage:[UIImage imageNamed:@"play_icon_neu"] forState:UIControlStateNormal];
    [movie addSubview:playMovie];
    
    UIImageView *word8 = [[UIImageView alloc] initWithFrame:CGRectMake(250, 540, 154, 45)];
    word8.image = [UIImage imageNamed:@"2-5-1"];
    [view5 addSubview:word8];
    
    UIImageView *word9 = [[UIImageView alloc] initWithFrame:CGRectMake(260, 570, 185, 48)];
    word9.image = [UIImage imageNamed:@"2-5-2"];
    [view5 addSubview:word9];
    
    self.moveImage1 = [[moveImageView alloc] initWithFrame:CGRectMake(50, 50,487, 314)];
    self.moveImage1.image = [UIImage imageNamed:@"03_fotos_02"];
    self.moveImage1.userInteractionEnabled = YES;
    self.moveImage1.delegate = self;
    [self.view4 addSubview:self.moveImage1];
    
    self.moveImage2 = [[moveImageView alloc] initWithFrame:CGRectMake(50, 50,487, 314)];
    self.moveImage2.image = [UIImage imageNamed:@"03_fotos_05"];
    self.moveImage2.userInteractionEnabled = YES;
    self.moveImage2.delegate = self;
    [self.view4 addSubview:self.moveImage2];
    
    self.moveImage3 = [[moveImageView alloc] initWithFrame:CGRectMake(50, 50,487, 314)];
    self.moveImage3.image = [UIImage imageNamed:@"03_fotos_06"];
    self.moveImage3.userInteractionEnabled = YES;
    self.moveImage3.delegate = self;
    [self.view4 addSubview:self.moveImage3];
    
    self.moveImage4 = [[moveImageView alloc] initWithFrame:CGRectMake(50, 50,487, 314)];
    self.moveImage4.image = [UIImage imageNamed:@"03_fotos_07"];
    self.moveImage4.userInteractionEnabled = YES;
    self.moveImage4.delegate = self;
    [self.view4 addSubview:self.moveImage4];
    
    self.moveImage5 = [[moveImageView alloc] initWithFrame:CGRectMake(50, 50,487, 314)];
    self.moveImage5.image = [UIImage imageNamed:@"03_fotos_08"];
    self.moveImage5.userInteractionEnabled = YES;
    self.moveImage5.delegate = self;
    [self.view4 addSubview:self.moveImage5];
    
    self.moveImage6 = [[moveImageView alloc] initWithFrame:CGRectMake(50, 50,487, 314)];
    self.moveImage6.image = [UIImage imageNamed:@"03_fotos_09"];
    self.moveImage6.userInteractionEnabled = YES;
    self.moveImage6.delegate = self;
    [self.view4 addSubview:self.moveImage6];
    
    self.moveImage7 = [[moveImageView alloc] initWithFrame:CGRectMake(50, 50,487, 314)];
    self.moveImage7.image = [UIImage imageNamed:@"03_fotos_10"];
    self.moveImage7.delegate = self;
    self.moveImage7.userInteractionEnabled = YES;
    [self.view4 addSubview:self.moveImage7];
}

- (void)animalViewTouchesBegan:(UIImageView *)sender
{
    self.scrollView.scrollEnabled = NO;
    [self.view4  bringSubviewToFront:sender];
}



- (void)animalViewTouchesEnded:(UIImageView *)sender
{
    self.scrollView.scrollEnabled = YES;
}

- (void)backToMeun
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    // 记录scrollView 的当前位置，因为已经设置了分页效果，所以：位置/屏幕大小 = 第几页
    int current = scrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width;
    //根据scrollView 的位置对page 的当前页赋值
    UIPageControl *page = (UIPageControl *)[self.view viewWithTag:208];
    page.currentPage = current;
    
    if ((page.currentPage == 3 && self.tmpPage == 2) || (page.currentPage == 3 && self.tmpPage == 4))
    {
        NSLog(@"3");
    }
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    int current = scrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width;
    self.tmpPage = current;
    NSLog(@"current%d",current);
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
