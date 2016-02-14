//
//  MainViewController.m
//  AudiDemo
//
//  Created by sourcecode on 16/1/25.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "MainViewController.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

#import "InspirationViewController.h"
#import "appearanceViewController.h"
#import "SpaceViewController.h"
#import "CapacityViewController.h"
#import "PriceListViewController.h"
#import "SellerMapViewController.h"
#import "AllRoundDisplayViewController.h"

#import "CustomPushAnimation.h"
#import "CustomPopAnimation.h"
#import "AppearancePushAnimation.h"
#import "AppearancePopAnimation.h"
#import "SpacePushAnimation.h"
#import "SpacePopAnimation.h"
#import "CapacityPushAnimation.h"
#import "CapacityPopAnimation.h"
#import "PriceListPushAnimation.h"
#import "PriceListPopAnimation.h"
#import "SellerMapPushAnimation.h"
#import "SellerMapPopAnimation.h"
#import "AllroundDisplayPushAnimation.h"
#import "AllRoundDisPlayPopAnimation.h"

@interface MainViewController ()<UIScrollViewDelegate,UINavigationControllerDelegate>
{
    UITapGestureRecognizer *tap;
    UITapGestureRecognizer *tap2;
    UIImageView *pageView;
    UIView *meun;
    CustomPushAnimation *customPush;
    CustomPopAnimation *customPop;
    AppearancePushAnimation *appearancePush;
    AppearancePopAnimation *appearancePop;
    SpacePushAnimation *spacePush;
    SpacePopAnimation *spacePop;
    CapacityPushAnimation *capacityPush;
    CapacityPopAnimation *capacityPop;
    PriceListPushAnimation *priceListPush;
    PriceListPopAnimation *priceListPop;
    SellerMapPushAnimation *sellMapPush;
    SellerMapPopAnimation *sellMapPop;
    AllroundDisplayPushAnimation *allroundDisplayPush;
    AllRoundDisPlayPopAnimation *allroundDisplayPop;
}

@property (nonatomic ,strong)AVPlayer *player;
@property (nonatomic ,strong)AVPlayerLayer *layer;
@property (nonatomic ,strong)UIScrollView *scrollView;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden = YES;
    
    [self playWelcomeMovie];
    
    self.navigationController.delegate = self;
    
    //init CustomPush
    customPush = [[CustomPushAnimation alloc] init];
    customPop = [[CustomPopAnimation alloc] init];
    appearancePush = [[AppearancePushAnimation alloc] init];
    appearancePop = [[AppearancePopAnimation alloc] init];
    spacePush = [[SpacePushAnimation alloc] init];
    spacePop = [[SpacePopAnimation alloc] init];
    capacityPush = [[CapacityPushAnimation alloc] init];
    capacityPop = [[CapacityPopAnimation alloc] init];
    priceListPush = [[PriceListPushAnimation alloc] init];
    priceListPop = [[PriceListPopAnimation alloc] init];
    sellMapPush = [[SellerMapPushAnimation alloc] init];
    sellMapPop = [[SellerMapPopAnimation alloc] init];
    allroundDisplayPush = [[AllroundDisplayPushAnimation alloc] init];
    allroundDisplayPop = [[AllRoundDisPlayPopAnimation alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>) navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC

{
    //push的时候用我们自己定义的customPush
    if (operation == UINavigationControllerOperationPush) {
        
        if ([toVC isKindOfClass:[InspirationViewController class]]) {
            return customPush;
        }else if ([toVC isKindOfClass:[appearanceViewController class]]){
            return appearancePush;
        }else if ([toVC isKindOfClass:[SpaceViewController class]]){
            return spacePush;
        }else if ([toVC isKindOfClass:[CapacityViewController class]]){
            return capacityPush;
        }else if ([toVC isKindOfClass:[PriceListViewController class]]){
            return priceListPush;
        }else if ([toVC isKindOfClass:[SellerMapViewController class]]){
            return sellMapPush;
        }else if ([toVC isKindOfClass:[AllRoundDisplayViewController class]]){
            return allroundDisplayPush;
        }
        
        
        return nil;
        
        
        
    }
    else if (operation == UINavigationControllerOperationPop) {
        
        if ([fromVC isKindOfClass:[InspirationViewController class]]) {
            return customPop;
        }else if ([fromVC isKindOfClass:[appearanceViewController class]]){
            return appearancePop;
        }else if ([fromVC isKindOfClass:[SpaceViewController class]]){
            return spacePop;
        }else if ([fromVC isKindOfClass:[CapacityViewController class]]){
            return capacityPop;
        }else if ([fromVC isKindOfClass:[PriceListViewController class]]){
            return priceListPop;
        }else if ([fromVC isKindOfClass:[SellerMapViewController class]]){
            return sellMapPop;
        }else if ([fromVC isKindOfClass:[AllRoundDisplayViewController class]]){
            return allroundDisplayPop;
        }
        
        
        return nil;
        
    }
    else{
        return nil;
    }
    
}

#pragma mark - 欢迎视频
- (void)playWelcomeMovie
{
    NSString * resourcePath = [[NSBundle mainBundle] resourcePath];
    NSString * videoPath = [resourcePath stringByAppendingPathComponent:@"Audi_A7_Sportback_Preroll_16sek.mp4"];
    NSURL *videoURL = [[NSURL alloc] initFileURLWithPath:videoPath];
    
    _player = [AVPlayer playerWithURL:videoURL];
    [_player play];
    _layer = [AVPlayerLayer playerLayerWithPlayer:_player];
    _layer.frame = [UIScreen mainScreen].bounds;
    _layer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view.layer addSublayer:_layer];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:)name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScreen:)];
    tap.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tap];
}

- (void)tapScreen:(UITapGestureRecognizer *)tapGesture
{
    NSLog(@"点击事件.");
    [_player pause];
    [_layer removeFromSuperlayer];
    [self.view removeGestureRecognizer:tap];
    [self setupMainScreen];
}

- (void)tap2Screen:(UITapGestureRecognizer *)tapGesture
{
    [self addPageView];
}

- (void)addPageView
{
    [_scrollView removeFromSuperview];
    NSLog(@"addPageView");
    pageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 1024, 768)];
    pageView.userInteractionEnabled = YES;
    pageView.image = [UIImage imageNamed:@"mainView"];
    [self.view addSubview:pageView];

    NSArray *pageArray = [NSArray arrayWithObjects:
                          [UIImage imageNamed:@"s02_02"],
                          [UIImage imageNamed:@"s03_03"],
                          [UIImage imageNamed:@"s04_04"],
                          [UIImage imageNamed:@"s05_05"],
                          [UIImage imageNamed:@"s06_06"],
                          [UIImage imageNamed:@"s05_05"],
                          [UIImage imageNamed:@"s04_04"],
                          [UIImage imageNamed:@"s03_03"],
                          [UIImage imageNamed:@"s02_02"],
                          [UIImage imageNamed:@"s02_02"],
                          [UIImage imageNamed:@"s02_02"],
                          [UIImage imageNamed:@"s02_02"],
                          nil];
    UIImageView *pageControl = [[UIImageView alloc] initWithFrame:CGRectMake(656, 504, 354, 245)];
    pageControl.animationDuration = 1.5;
    pageControl.animationRepeatCount = 0;
    pageControl.animationImages = pageArray;
    [pageControl startAnimating];
    [pageView addSubview:pageControl];
    
    UIImageView *word1 = [[UIImageView alloc] initWithFrame:CGRectMake(577, 617, 272, 26)];
    word1.image = [UIImage imageNamed:@"welcome-2"];
    [pageView addSubview:word1];
    
    UIImageView *word2 = [[UIImageView alloc] initWithFrame:CGRectMake(550, 580, 296, 18)];
    word2.image = [UIImage imageNamed:@"welcome-1"];
    [pageView addSubview:word2];
    
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeTomenum:)];
    recognizer.numberOfTapsRequired = 1;
    [pageView addGestureRecognizer:recognizer];
    
    UISwipeGestureRecognizer *swipes = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(changeTomenum:)];
    swipes.direction = UISwipeGestureRecognizerDirectionRight | UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionUp | UISwipeGestureRecognizerDirectionDown;
    [pageView addGestureRecognizer:swipes];

}

-(void)changeTomenum:(UISwipeGestureRecognizer *)recognizer
{
    [self setupMeun];

    
    [UIView beginAnimations:@"animationID" context:nil];
    [UIView setAnimationDuration:0.7f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
    [pageView removeFromSuperview];
    [self.view addSubview:meun];
    [UIView commitAnimations];
}

- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer
{
    [UIView beginAnimations:@"animationID" context:nil];
    [UIView setAnimationDuration:0.7f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
    [meun removeFromSuperview];
    [self.view addSubview:pageView];
    [UIView commitAnimations];
}

-(void)playbackFinished:(NSNotification *)notification{
    NSLog(@"视频播放完成.");
    [_layer removeFromSuperlayer];
    [self.view removeGestureRecognizer:tap];
    [self setupMainScreen];
}

- (void)setupMeun
{
    meun = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    meun.backgroundColor = [UIColor whiteColor];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    [swipe setDirection:(UISwipeGestureRecognizerDirectionDown)];
    [meun addGestureRecognizer:swipe];
    
    UIImageView *headview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 65)];
    headview.image = [UIImage imageNamed:@"top_logo"];
    [meun addSubview:headview];
    
    UIImageView *stapel = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1100, 750)];
    stapel.image = [UIImage imageNamed:@"stapel_gerade"];
    [meun addSubview:stapel];
    
    UIImageView *index1 = [[UIImageView alloc] initWithFrame:CGRectMake(120, 200, 273, 27)];
    index1.image = [UIImage imageNamed:@"index-1"];
    [meun addSubview:index1];
    
    UIButton *index2 = [[UIButton alloc] initWithFrame:CGRectMake(120, 200+50, 51, 18)];
    [index2 setImage:[UIImage imageNamed:@"index-2"] forState:UIControlStateNormal];
    [meun addSubview:index2];
    
     UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(120, 200+50+18+5, 250, 20)];
    [btn2 setTitle:@"向纯粹自由的绝对灵感致敬。" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [btn2 setTitleEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
    [btn2 addTarget:self action:@selector(moveToInspirationView) forControlEvents:UIControlEventTouchUpInside];
    [meun addSubview:btn2];
    
    UIButton *index3 = [[UIButton alloc] initWithFrame:CGRectMake(120, 200+50+68, 51, 18)];
    [index3 setImage:[UIImage imageNamed:@"index-3"] forState:UIControlStateNormal];
    [meun addSubview:index3];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(120, 200+50+68+18+5, 250, 20)];
    [btn3 setTitle:@"动感而优雅的新型外观。" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [btn3 setTitleEdgeInsets:UIEdgeInsetsMake(0, -27, 0, 27)];
    [btn3 addTarget:self action:@selector(moveToAppearanceView) forControlEvents:UIControlEventTouchUpInside];
    [meun addSubview:btn3];
    
    
    UIButton *index4 = [[UIButton alloc] initWithFrame:CGRectMake(120, 200+50+68+68, 51, 18)];
    [index4 setImage:[UIImage imageNamed:@"index-4"] forState:UIControlStateNormal];
    [meun addSubview:index4];
    
    UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(120, 200+50+68+68+18+5, 200, 20)];
    [btn4 setTitle:@"激情与功能融为一体。" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [btn4 setTitleEdgeInsets:UIEdgeInsetsMake(0, -11, 0, 11)];
//    btn4.backgroundColor = [UIColor redColor];
    [btn4 addTarget:self action:@selector(moveToSpaceView) forControlEvents:UIControlEventTouchUpInside];
    [meun addSubview:btn4];
    
    UIButton *index5 = [[UIButton alloc] initWithFrame:CGRectMake(120, 200+50+68+68+68, 51, 18)];
    [index5 setImage:[UIImage imageNamed:@"index-5"] forState:UIControlStateNormal];
    [meun addSubview:index5];
    
    UIButton *btn5 = [[UIButton alloc] initWithFrame:CGRectMake(120, 200+50+68+68+68+18+5, 250, 20)];
    [btn5 setTitle:@"创新技术造就行进的魅力。" forState:UIControlStateNormal];
    [btn5 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn5 setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [btn5 setTitleEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 20)];
    //    btn2.backgroundColor = [UIColor redColor];
    [btn5 addTarget:self action:@selector(moveToCapacityView) forControlEvents:UIControlEventTouchUpInside];
    [meun addSubview:btn5];
    
    UIButton *index6 = [[UIButton alloc] initWithFrame:CGRectMake(120, 200+50+68+68+68+68, 116, 18)];
    [index6 setImage:[UIImage imageNamed:@"index-6"] forState:UIControlStateNormal];
    [meun addSubview:index6];
    
    UIButton *btn6 = [[UIButton alloc] initWithFrame:CGRectMake(120, 200+50+68+68+68+68+18+5, 300, 20)];
    [btn6 setTitle:@"创新不止一面，惊喜扑面而来。" forState:UIControlStateNormal];
    [btn6 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn6 setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [btn6 setTitleEdgeInsets:UIEdgeInsetsMake(0, -25, 0, 25)];
//    btn6.backgroundColor = [UIColor redColor];
    [btn6 addTarget:self action:@selector(moveToAllRoundView) forControlEvents:UIControlEventTouchUpInside];
    [meun addSubview:btn6];
    
    UIImageView *movie = [[UIImageView alloc] initWithFrame:CGRectMake(550, 100, 367, 207)];
    movie.image = [UIImage imageNamed:@"111"];
    movie.userInteractionEnabled = YES;
    movie.transform = CGAffineTransformMakeRotation(M_PI/80);
    [meun addSubview:movie];
    
    UIButton *play = [[UIButton alloc] initWithFrame:CGRectMake(148.5, 76.5, 70, 54)];
    [play setImage:[UIImage imageNamed:@"video_play_icon"] forState:UIControlStateNormal];
    [movie addSubview:play];
    
    UIButton *email = [[UIButton alloc] initWithFrame:CGRectMake(840, 570, 45, 44)];
    [email setImage:[UIImage imageNamed:@"mail"] forState:UIControlStateNormal];
    [email setImage:[UIImage imageNamed:@"mail_active"] forState:UIControlStateHighlighted];
    [meun addSubview:email];
    
//    UILabel *tip = [UILabel new];
//    tip.frame = CGRectMake(670, 670, 0, 0);
//    tip.text = @"软件内容仅供参考，最终以车辆实际情况为准";
//    tip.textColor = [UIColor grayColor];
//    tip.font = [UIFont systemFontOfSize:13];
//    [tip sizeToFit];
//    [meun addSubview:tip];
    
    UIImageView *tips = [[UIImageView alloc] initWithFrame:CGRectMake(650, 680, 282, 17)];
    tips.image = [UIImage imageNamed:@"index-claim"];
    [meun addSubview:tips];
    
    UIButton *dealerBtn = [[UIButton alloc] initWithFrame:CGRectMake(120, 615, 80, 15)];
    [dealerBtn setTitle:@"经销商查询 " forState:UIControlStateNormal];
    [dealerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [dealerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
//    dealerBtn.backgroundColor = [UIColor redColor];
    dealerBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [dealerBtn addTarget:self action:@selector(moveToSellerMapView) forControlEvents:UIControlEventTouchUpInside];
    [meun addSubview:dealerBtn];
    
    UIButton *priceBtn = [[UIButton alloc] initWithFrame:CGRectMake(210, 615, 120, 15)];
    [priceBtn setTitle:@"价格与性能装备表" forState:UIControlStateNormal];
    [priceBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [priceBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
//    priceBtn.backgroundColor = [UIColor redColor];
    priceBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [priceBtn addTarget:self action:@selector(moveToPriceListView) forControlEvents:UIControlEventTouchUpInside];
    [meun addSubview:priceBtn];
    
}

- (void)setupMainScreen
{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:_scrollView];
    _scrollView.scrollEnabled = NO;
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake( 1024*3, 768*4);
    _scrollView.backgroundColor = [UIColor whiteColor];
    
    tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap2Screen:)];
    tap2.numberOfTapsRequired = 1;
  
    [_scrollView addGestureRecognizer:tap2];

    UIImageView *welcomeView1 = [[UIImageView alloc] initWithFrame:CGRectMake(1024+82.5, 70.5, 859, 627)];
    welcomeView1.image = [UIImage imageNamed:@"00_intro_01"];
    [_scrollView addSubview:welcomeView1];
    
    UIImageView *welcomeView2 = [[UIImageView alloc] initWithFrame:CGRectMake(1024*2+112.5,768+156, 779, 456)];
    welcomeView2.image = [UIImage imageNamed:@"00_intro_02"];
    [_scrollView addSubview:welcomeView2];
    
    UIImageView *welcomeView3 = [[UIImageView alloc] initWithFrame:CGRectMake(1024*2+173, 768*2+190.5, 678, 387)];
    welcomeView3.image = [UIImage imageNamed:@"00_intro_03"];
    [_scrollView addSubview:welcomeView3];
    
    UIImageView *welcomeView4 = [[UIImageView alloc] initWithFrame:CGRectMake(1024+21,768*3+11, 982, 746)];
    welcomeView4.image = [UIImage imageNamed:@"00_intro_04"];
    [_scrollView addSubview:welcomeView4];

    UIImageView *welcomeView5 = [[UIImageView alloc] initWithFrame:CGRectMake(0,768*2, 1024, 768)];
    welcomeView5.image = [UIImage imageNamed:@"00_intro_05"];
    [_scrollView addSubview:welcomeView5];
    
    [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
         [_scrollView setContentOffset:CGPointMake(1024, 0)];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
         [_scrollView setContentOffset:CGPointMake(1024*2, 768)];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
              [_scrollView setContentOffset:CGPointMake(1024*2, 768*2)];
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
              [_scrollView setContentOffset:CGPointMake(1024, 768*3)];
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
                      [_scrollView setContentOffset:CGPointMake(0, 768*2)];
                    } completion:^(BOOL finished) {
                        if (finished) {
                               [self addPageView];
                        }
                    }];
                }];
            }];
        }];
    }];
   
}

#pragma mark - btnMethod
- (void)moveToInspirationView
{
    InspirationViewController *inVc = [[InspirationViewController alloc] init];
    [self.navigationController pushViewController:inVc animated:YES];
}

- (void)moveToAppearanceView
{
    appearanceViewController *inVc = [[appearanceViewController alloc] init];
    [self.navigationController pushViewController:inVc animated:YES];
}

- (void)moveToSpaceView
{
    SpaceViewController *spVc = [[SpaceViewController alloc] init];
    [self.navigationController pushViewController:spVc animated:YES];
}

- (void)moveToCapacityView
{
    CapacityViewController *capVc = [[CapacityViewController alloc] init];
    [self.navigationController pushViewController:capVc animated:YES];
}

- (void)moveToPriceListView
{
    PriceListViewController *priLisvc = [[PriceListViewController alloc] init];
    [self.navigationController pushViewController:priLisvc animated:YES];
}

- (void)moveToSellerMapView
{
    SellerMapViewController *sellerMapVc = [[SellerMapViewController alloc] init];
    [self.navigationController pushViewController:sellerMapVc animated:YES];
}

- (void)moveToAllRoundView
{
    AllRoundDisplayViewController *allRoundVc = [[AllRoundDisplayViewController alloc] init];
    [self.navigationController pushViewController:allRoundVc animated:YES];
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
