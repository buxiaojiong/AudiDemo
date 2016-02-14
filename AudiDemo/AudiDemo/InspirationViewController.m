//
//  InspirationViewController.m
//  AudiDemo
//
//  Created by sourcecode on 16/1/27.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "InspirationViewController.h"
#import "DrawButton.h"
#import "drawImageView.h"
#import "LineButton.h"
#import "PaintView.h"
#import "moveImageView.h"

@interface InspirationViewController ()
<
UIScrollViewDelegate
>

@property (nonatomic ,strong)UIScrollView *scrollView;
@property (nonatomic ,strong)drawImageView *drawLineView;
@property (nonatomic ,strong)UIImageView *word6;
@property (nonatomic ,strong)UIImageView *drawWord;
@property (nonatomic ,strong)UIImageView *word7;
@property (nonatomic ,strong)UIView *view4;
@property (nonatomic ,strong)UIImageView *hilf;
@property (nonatomic ,strong)LineButton *dachlinie;
@property (nonatomic ,strong)LineButton *dynamiklinie;
@property (nonatomic ,strong)LineButton *bruestungslinie;
@property (nonatomic ,strong)LineButton *hueftschwung;
@property (nonatomic ,strong)LineButton *tornadolinie;
@property (nonatomic ,strong)PaintView *paintView;
@property (nonatomic ,strong)LineButton *pen;
@property (nonatomic ,strong)LineButton *radierer;
@end

@implementation InspirationViewController


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
    pageConteol.tag = 201;
    pageConteol.pageIndicatorTintColor = [UIColor grayColor];
    pageConteol.currentPageIndicatorTintColor = [UIColor blackColor];
    [self.view addSubview:pageConteol];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(512-25-50, self.view.frame.size.height - 27, 0, 0)];
    title.text = @"灵感";
    title.textColor = [UIColor grayColor];
    title.font = [UIFont systemFontOfSize:13];
    [title sizeToFit];
    [self.view addSubview:title];
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, self.view.frame.size.height - 40, 100, 30)];
//    backBtn.backgroundColor = [UIColor redColor];
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
//    view4.backgroundColor = [UIColor orangeColor];
    [self.scrollView insertSubview:self.view4 belowSubview:view3];
    
    
    UIImageView *seite1 = [[UIImageView alloc] initWithFrame:CGRectMake(-230, -110, 1165, 768)];
    seite1.image = [UIImage imageNamed:@"01_seite_01"];
    [view1 addSubview:seite1];
    
    UIImageView *word1 = [[UIImageView alloc] initWithFrame:CGRectMake(450, 430, 339, 111)];
    word1.image = [UIImage imageNamed:@"1-1-1"];
    [seite1 addSubview:word1];
    
    UIImageView *spitzer = [[UIImageView alloc] initWithFrame:CGRectMake(500, 630, 174, 133)];
    spitzer.image = [UIImage imageNamed:@"spitzer"];
    [seite1 addSubview:spitzer];

    UIImageView *seite2 = [[UIImageView alloc] initWithFrame:CGRectMake(-110, -90, 1300, 820)];
    seite2.image = [UIImage imageNamed:@"01_seite_02"];
    [view2 addSubview:seite2];
    
    UIImageView *spaehne = [[UIImageView alloc] initWithFrame:CGRectMake(740, 500, 147, 184)];
    spaehne.image = [UIImage imageNamed:@"spaehne"];
    [view2 addSubview:spaehne];
    
    UIImageView *word2 = [[UIImageView alloc] initWithFrame:CGRectMake(80, 500, 347, 61)];
    word2.image = [UIImage imageNamed:@"1-2-1"];
    [view2 addSubview:word2];
    
    UIImageView *word3 = [[UIImageView alloc] initWithFrame:CGRectMake(70, 560, 601, 87)];
    word3.image = [UIImage imageNamed:@"1-2-2"];
    [view2 addSubview:word3];
    
    UIImageView *seite3 = [[UIImageView alloc] initWithFrame:CGRectMake(110, 0, 980, 700)];
    seite3.image = [UIImage imageNamed:@"01_seite_03"];
    [view3 addSubview:seite3];
    
    UIImageView *word4 = [[UIImageView alloc] initWithFrame:CGRectMake(200, 500, 383, 43)];
    word4.image = [UIImage imageNamed:@"1-3-2"];
    [view3 addSubview:word4];
    
    UIImageView *word5 = [[UIImageView alloc] initWithFrame:CGRectMake(200, 560, 664, 92)];
    word5.image = [UIImage imageNamed:@"1-3-1"];
    [view3 addSubview:word5];
    
    UIImageView *seite4 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, 980, 700)];
    seite4.image = [UIImage imageNamed:@"01_seite_04"];
    [self.view4 addSubview:seite4];
    

    [self.view4 addSubview:self.word6];
    [self.view4 addSubview:self.word7];
    [self.view4 addSubview:self.drawWord];
    [self.view4 addSubview:self.dachlinie];
    [self.view4 addSubview:self.dynamiklinie];
    [self.view4 addSubview:self.bruestungslinie];
    [self.view4 addSubview:self.hueftschwung];
    [self.view4 addSubview:self.tornadolinie];
    
    
    DrawButton *drawLineBtn = [[DrawButton alloc] initWithFrame:CGRectMake(830, 590, 100, 90)];
//    drawLineBtn.backgroundColor = [UIColor blueColor];
    [drawLineBtn setImage:[UIImage imageNamed:@"icon_zeichnen_back"] forState:UIControlStateSelected];
    [drawLineBtn setTitle:@"返回" forState:UIControlStateSelected];
    [drawLineBtn setImage:[UIImage imageNamed:@"icon_zeichnen"] forState:UIControlStateNormal];
    [drawLineBtn setTitle:@"描绘线条" forState:UIControlStateNormal];
    [drawLineBtn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    drawLineBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [drawLineBtn addTarget:self action:@selector(drawTheLine:) forControlEvents:UIControlEventTouchUpInside];
    [self.view4 addSubview:drawLineBtn];
    
}

- (void)LineBtnPressed:(LineButton *)sender
{
    [self.drawWord removeFromSuperview];
    if (sender.selected == NO)
    {
        sender.selected = YES;
        switch (sender.tag) {
            case 400:
                self.dynamiklinie.selected = NO;
                self.bruestungslinie.selected = NO;
                self.hueftschwung.selected = NO;
                self.tornadolinie.selected = NO;
                
                self.word7.image = [UIImage imageNamed:@"dachlineText"];
              
                
                break;
            case 401:
                self.dachlinie.selected = NO;
                self.bruestungslinie.selected = NO;
                self.hueftschwung.selected = NO;
                self.tornadolinie.selected = NO;
                
                self.word7.image = [UIImage imageNamed:@"dynamiclineText"];
                break;
            case 402:
                self.dachlinie.selected = NO;
                self.dynamiklinie.selected = NO;
                self.hueftschwung.selected = NO;
                self.tornadolinie.selected = NO;
                
                self.word7.image = [UIImage imageNamed:@"brulineText"];
                break;
            case 403:
                self.dachlinie.selected = NO;
                self.bruestungslinie.selected = NO;
                self.dynamiklinie.selected = NO;
                self.tornadolinie.selected = NO;
                
                self.word7.image = [UIImage imageNamed:@"huelineText"];
                break;
            case 404:
                self.dachlinie.selected = NO;
                self.bruestungslinie.selected = NO;
                self.hueftschwung.selected = NO;
                self.dynamiklinie.selected = NO;
                
                self.word7.image = [UIImage imageNamed:@"tornadolineText"];
                break;
                
            default:
                break;
        }
    }
    else
    {
        
    }

    
}

- (void)drawTheLine:(UIButton *)sender
{
    sender.selected = !sender.selected;
    self.dachlinie.selected = NO;
    self.dynamiklinie.selected = NO;
    self.bruestungslinie.selected = NO;
    self.hueftschwung.selected = NO;
    self.tornadolinie.selected = NO;
    if (sender.selected == YES)
    {
        [UIView beginAnimations:@"animationID" context:nil];
        [UIView setAnimationDuration:0.7f];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationRepeatAutoreverses:NO];
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
        [UIView commitAnimations];
        [self.view4 addSubview:self.drawLineView];
        [self.word6 removeFromSuperview];
        [self.word7 removeFromSuperview];
        [self.drawWord removeFromSuperview];

 
    }
    else
    {
        [UIView beginAnimations:@"animationID" context:nil];
        [UIView setAnimationDuration:0.7f];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationRepeatAutoreverses:NO];
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
        [self.drawLineView removeFromSuperview];
        [self.view4 addSubview:self.word6];
        [self.view4 addSubview:self.word7];
        [self.view4 addSubview:self.drawWord];
        
        
        [UIView commitAnimations];
    }
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
    UIPageControl *page = (UIPageControl *)[self.view viewWithTag:201];
    page.currentPage = current;

}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - getmethod
- (UIView *)drawLineView
{
    if (!_drawLineView) {
        _drawLineView = [[drawImageView alloc] initWithFrame:CGRectMake(-50, -30, 1024, 768)];
        _drawLineView.image = [UIImage imageNamed:@"transparentpapier"];
        _drawLineView.userInteractionEnabled = YES;
        UIImageView *gword = [[UIImageView alloc] initWithFrame:CGRectMake(200, 200, 109 ,33)];
        gword.image = [UIImage imageNamed:@"1-4.2-1"];
        [_drawLineView addSubview:gword];
        
        [_drawLineView addSubview:self.hilf];
        
        
        
        UIView *btnsView = [[UIView alloc] initWithFrame:CGRectMake(155, 560, 310, 50)];
        btnsView.transform = CGAffineTransformMakeRotation(M_PI/30);
        //        btnsView.backgroundColor = [UIColor greenColor];
        [_drawLineView addSubview:btnsView];
        
        UILabel *tips = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 0, 0)];
        tips.text = @"试着描绘奥迪A7的设计线条";
        tips.textColor = [UIColor darkGrayColor];
        [tips sizeToFit];
        tips.font = [UIFont systemFontOfSize:13];
        [btnsView addSubview:tips];
        
        UIButton *delDrawLineBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 70, 30)];
        [delDrawLineBtn setTitle:@"删除画面 >|" forState:UIControlStateNormal];
        [delDrawLineBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        delDrawLineBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [btnsView addSubview:delDrawLineBtn];
        [delDrawLineBtn addTarget:self action:@selector(delDrawLine:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *addDelhilLineBtn = [[UIButton alloc] initWithFrame:CGRectMake(70, 0, 120, 30)];
        [addDelhilLineBtn setTitle:@"加入/删除基准线 >|" forState:UIControlStateNormal];
        [addDelhilLineBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        addDelhilLineBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        //        addDelhilLineBtn.backgroundColor = [UIColor blackColor];
        [btnsView addSubview:addDelhilLineBtn];
        [addDelhilLineBtn addTarget:self action:@selector(adddelhilLinePressed:) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIButton *appearhideBtn = [[UIButton alloc] initWithFrame:CGRectMake(180, 0, 130, 30)];
        [appearhideBtn setTitle:@"显示/影藏原始线条 >" forState:UIControlStateNormal];
        [appearhideBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        appearhideBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        //        appearhideBtn.backgroundColor = [UIColor yellowColor];
        [btnsView addSubview:appearhideBtn];
        [appearhideBtn addTarget:self action:@selector(appearhidePressed:) forControlEvents:UIControlEventTouchUpInside];
        
        [_drawLineView addSubview:self.pen];
        [_drawLineView addSubview:self.radierer];
        
        self.paintView = [[PaintView alloc]initWithFrame:CGRectMake(0, 240, 1100, 300)];
        self.paintView.backgroundColor = [UIColor clearColor];
        [_drawLineView addSubview:self.paintView];
        self.paintView.hidden = YES;
        
        }
    return _drawLineView;
}

- (UIImageView *)hilf
{
    if (!_hilf) {
        _hilf = [[UIImageView alloc] initWithFrame:CGRectMake(155, 315, 761, 212)];
        _hilf.image = [UIImage imageNamed:@"hilfslinien"];
    }
    return _hilf;
}

- (UIImageView *)word6
{
    if (!_word6) {
        _word6 = [[UIImageView alloc] initWithFrame:CGRectMake(230, 150, 456, 36)];
        _word6.image = [UIImage imageNamed:@"1-4.1-2"];
    }
    return _word6;
}

- (UIImageView *)word7
{
    if (!_word7) {
        _word7 = [[UIImageView alloc] initWithFrame:CGRectMake(150, 540, 704, 45)];
        _word7.image = [UIImage imageNamed:@"1-4.1-1"];
    }
    return _word7;
}

- (UIImageView *)drawWord
{
    if (!_drawWord) {
        _drawWord = [[UIImageView alloc] initWithFrame:CGRectMake(150, 590, 704, 32)];
        _drawWord.image = [UIImage imageNamed:@"1-4-howtodraw"];
    }
    return _drawWord;
}

-(LineButton *)dachlinie
{
    if (!_dachlinie) {
        _dachlinie = [[LineButton alloc] initWithFrame:CGRectMake(100, 280, 758, 169)];
        [_dachlinie setImage:[UIImage imageNamed:@"dachlinie"] forState:UIControlStateNormal];
        [_dachlinie setImage:[UIImage imageNamed:@"dachlinie_select"] forState:UIControlStateSelected];
        _dachlinie.tag = 400;
        [_dachlinie addTarget:self action:@selector(LineBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _dachlinie;
}

-(LineButton *)dynamiklinie
{
    if (!_dynamiklinie) {
        _dynamiklinie = [[LineButton alloc] initWithFrame:CGRectMake(150, 320, 681,123)];
        [_dynamiklinie setImage:[UIImage imageNamed:@"dynamiklinie"] forState:UIControlStateNormal];
        [_dynamiklinie setImage:[UIImage imageNamed:@"dynamiklinie_select"] forState:UIControlStateSelected];
        _dynamiklinie.tag = 401;
        [_dynamiklinie addTarget:self action:@selector(LineBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _dynamiklinie;
}

-(LineButton *)bruestungslinie
{
    if (!_bruestungslinie) {
        _bruestungslinie = [[LineButton alloc] initWithFrame:CGRectMake(320, 335, 408, 15)];
        [_bruestungslinie setImage:[UIImage imageNamed:@"bruestungslinie"] forState:UIControlStateNormal];
        [_bruestungslinie setImage:[UIImage imageNamed:@"bruestungslinie_select"] forState:UIControlStateSelected];
        _bruestungslinie.tag = 402;
        [_bruestungslinie addTarget:self action:@selector(LineBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bruestungslinie;
}

- (LineButton *)hueftschwung
{
    if (!_hueftschwung) {
        _hueftschwung = [[LineButton alloc] initWithFrame:CGRectMake(625, 314, 89, 42)];
        [_hueftschwung setImage:[UIImage imageNamed:@"hueftschwung"] forState:UIControlStateNormal];
        [_hueftschwung setImage:[UIImage imageNamed:@"hueftschwung_select"] forState:UIControlStateSelected];
        _hueftschwung.tag = 403;
        [_hueftschwung addTarget:self action:@selector(LineBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _hueftschwung;
}

- (LineButton *)tornadolinie
{
    if (!_tornadolinie) {
        _tornadolinie = [[LineButton alloc] initWithFrame:CGRectMake(140, 345,734,91)];
        [_tornadolinie setImage:[UIImage imageNamed:@"tornadolinie"] forState:UIControlStateNormal];
        [_tornadolinie setImage:[UIImage imageNamed:@"tornadolinie_select"] forState:UIControlStateSelected];
        _tornadolinie.tag = 404;
        [_tornadolinie addTarget:self action:@selector(LineBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tornadolinie;
}

-(LineButton *)pen
{
    if (!_pen) {
        _pen = [[LineButton alloc] initWithFrame:CGRectMake(550, -150, 284, 418)];
        [_pen setImage:[UIImage imageNamed:@"stift_liegt"] forState:UIControlStateNormal];
        [_pen addTarget:self action:@selector(drawLinePen:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pen;
}

-(LineButton *)radierer
{
    if (!_radierer) {
        _radierer = [[LineButton alloc] initWithFrame:CGRectMake(650, -50, 284, 418)];
        [_radierer setImage:[UIImage imageNamed:@"radierer_liegt"] forState:UIControlStateNormal];
        [_radierer addTarget:self action:@selector(radiererLineradierer:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _radierer;
}



#pragma mark - btnMethod
- (void)adddelhilLinePressed:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.selected == YES)
    {
        [self.hilf removeFromSuperview];
    }
    else
    {
        [self.drawLineView addSubview:self.hilf];
    }
}

- (void)appearhidePressed:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.selected == YES)
    {
         self.drawLineView.image = [UIImage imageNamed:@"drawpaper"];
    }
    else
    {
        self.drawLineView.image = [UIImage imageNamed:@"transparentpapier"];
    }
}

- (void)drawLinePen:(LineButton *)sender
{
    self.paintView.hidden = NO;
    self.paintView.erase = NO;
    self.pen.hidden = YES;
    self.radierer.hidden = NO;
    self.paintView.penView.hidden = NO;
    self.paintView.radiererView.hidden = YES;
}

- (void)radiererLineradierer:(LineButton *)sender
{
    self.paintView.erase = YES;
    self.pen.hidden = NO;
    self.radierer.hidden = YES;
    self.paintView.penView.hidden = YES;
    self.paintView.radiererView.hidden = NO;
}

- (void)delDrawLine:(UIButton *)sender
{
    [self.paintView.linesArray removeAllObjects];
    [self.paintView setNeedsDisplay];
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
