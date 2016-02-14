//
//  SpaceViewController.m
//  AudiDemo
//
//  Created by sourcecode on 16/1/29.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "SpaceViewController.h"

@interface SpaceViewController ()
<
UIScrollViewDelegate
>
@property (nonatomic ,strong)UIScrollView *scrollView;
@end

@implementation SpaceViewController

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
    self.scrollView.contentSize = CGSizeMake(1024*6, 0);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    
    UIPageControl *pageConteol = [[UIPageControl alloc] initWithFrame:CGRectMake(512-25, self.view.frame.size.height - 30, 50, 20)];
    //    pageConteol.backgroundColor = [UIColor redColor];
    pageConteol.numberOfPages = 6;
    pageConteol.tag = 209;
    pageConteol.pageIndicatorTintColor = [UIColor grayColor];
    pageConteol.currentPageIndicatorTintColor = [UIColor blackColor];
    [self.view addSubview:pageConteol];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(512-25-50, self.view.frame.size.height - 27, 0, 0)];
    title.text = @"空间";
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
    [self.scrollView insertSubview:view2 belowSubview:view1];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(1024*2, 0, 1024, 768)];
    //    view3.backgroundColor = [UIColor purpleColor];
    [self.scrollView insertSubview:view3 belowSubview:view2];
    
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(1024*3, 0, 1024, 768)];
    //    view3.backgroundColor = [UIColor purpleColor];
    [self.scrollView insertSubview:view4 belowSubview:view3];
    
    UIView *view5 = [[UIView alloc] initWithFrame:CGRectMake(1024*4, 0, 1024, 768)];
    //    view3.backgroundColor = [UIColor purpleColor];
    [self.scrollView addSubview:view5];
    
    UIView *view6 = [[UIView alloc] initWithFrame:CGRectMake(1024*5, 0, 1024, 768)];
    //    view3.backgroundColor = [UIColor purpleColor];
    [self.scrollView addSubview:view6];
    
    UIImageView *seite1 = [[UIImageView alloc] initWithFrame:CGRectMake(-50, -10, 1073, 738)];
    seite1.image = [UIImage imageNamed:@"03_seite_01"];
    [view1 addSubview:seite1];
    
    UIImageView *word1 = [[UIImageView alloc] initWithFrame:CGRectMake(350, 550, 400, 76)];
    word1.image = [UIImage imageNamed:@"3-1-1"];
    [seite1 addSubview:word1];
    
    UIImageView *seite2 = [[UIImageView alloc] initWithFrame:CGRectMake(-150, -60, 1203, 757)];
    seite2.image = [UIImage imageNamed:@"03_seite_02"];
    [view2 addSubview:seite2];
    
    UIImageView *word2 = [[UIImageView alloc] initWithFrame:CGRectMake(50, 310, 293, 325)];
    word2.image = [UIImage imageNamed:@"3-2-1"];
    [view2 addSubview:word2];
    
    UIImageView *seite3 = [[UIImageView alloc] initWithFrame:CGRectMake(-50, -10, 1164, 742)];
    seite3.image = [UIImage imageNamed:@"03_seite_03"];
    [view3 addSubview:seite3];
    
    UIImageView *word3 = [[UIImageView alloc] initWithFrame:CGRectMake(330, 560, 660, 123)];
    word3.image = [UIImage imageNamed:@"3-3-2"];
    [view3 addSubview:word3];
    
    UIImageView *movie1 = [[UIImageView alloc] initWithFrame:CGRectMake(-10, 40, 820, 461)];
    movie1.image = [UIImage imageNamed:@"MMI_poster_820x461"];
    movie1.userInteractionEnabled = YES;
    movie1.transform = CGAffineTransformMakeRotation(M_PI/42);
    [view3 addSubview:movie1];
    
    UIButton *playMovie1 = [[UIButton alloc] initWithFrame:CGRectMake(342, 178, 136, 105)];
    [playMovie1 setImage:[UIImage imageNamed:@"play_icon_neu"] forState:UIControlStateNormal];
    [movie1 addSubview:playMovie1];
    
    UIImageView *seite4 = [[UIImageView alloc] initWithFrame:CGRectMake(5, -100, 1127, 810)];
    seite4.image = [UIImage imageNamed:@"03_seite_04"];
    [view4 addSubview:seite4];
    
    UIImageView *word4 = [[UIImageView alloc] initWithFrame:CGRectMake(130, 470, 460, 82)];
    word4.image = [UIImage imageNamed:@"3-4-2"];
    [view4 addSubview:word4];
    
    UIImageView *word5 = [[UIImageView alloc] initWithFrame:CGRectMake(145, 500, 798, 153)];
    word5.image = [UIImage imageNamed:@"3-4-1"];
    [view4 addSubview:word5];
    
    UIImageView *movie2 = [[UIImageView alloc] initWithFrame:CGRectMake(262, -6, 795, 448)];
    movie2.image = [UIImage imageNamed:@"Interior_poster_795x448"];
    movie2.userInteractionEnabled = YES;
    movie2.transform = CGAffineTransformMakeRotation(M_PI/82);
    [view4 addSubview:movie2];
    
    UIButton *playMovie2 = [[UIButton alloc] initWithFrame:CGRectMake(329.5, 171.5, 136, 105)];
    [playMovie2 setImage:[UIImage imageNamed:@"play_icon_neu"] forState:UIControlStateNormal];
    [movie2 addSubview:playMovie2];
    
    UIImageView *seite5 = [[UIImageView alloc] initWithFrame:CGRectMake(50, -40, 1098, 802)];
    seite5.image = [UIImage imageNamed:@"03_seite_05"];
    [view5 addSubview:seite5];
    
    UIImageView *word6 = [[UIImageView alloc] initWithFrame:CGRectMake(240, 540, 750, 142)];
    word6.image = [UIImage imageNamed:@"3-5-2"];
    [view5 addSubview:word6];
    
    UIImageView *seite6 = [[UIImageView alloc] initWithFrame:CGRectMake(160, -90, 986, 826)];
    seite6.image = [UIImage imageNamed:@"03_seite_06"];
    [view6 addSubview:seite6];
    
    UIImageView *word7 = [[UIImageView alloc] initWithFrame:CGRectMake(340, 540, 250, 25)];
    word7.image = [UIImage imageNamed:@"3-6-1"];
    [view6 addSubview:word7];
    
    UIImageView *word8 = [[UIImageView alloc] initWithFrame:CGRectMake(340, 590, 646, 78)];
    word8.image = [UIImage imageNamed:@"3-6-2"];
    [view6 addSubview:word8];
    
    UIImageView *movie3 = [[UIImageView alloc] initWithFrame:CGRectMake(205, -15, 850, 479)];
    movie3.image = [UIImage imageNamed:@"Soundsystem_poster_850x479"];
    movie3.userInteractionEnabled = YES;
    movie3.transform = CGAffineTransformMakeRotation(-M_PI/29);
    [view6 addSubview:movie3];
    
    UIButton *playMovie3 = [[UIButton alloc] initWithFrame:CGRectMake(357, 187, 136, 105)];
    [playMovie3 setImage:[UIImage imageNamed:@"play_icon_neu"] forState:UIControlStateNormal];
    [movie3 addSubview:playMovie3];
    
    
    
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
    UIPageControl *page = (UIPageControl *)[self.view viewWithTag:209];
    page.currentPage = current;
    
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
