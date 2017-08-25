//
//  ViewController.m
//  TeamBitionGuidePageDemo
//
//  Created by sephilex on 2017/4/26.
//  Copyright © 2017年 sephilex. All rights reserved.
//

// Masonry的宏
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

// 屏幕宽高
#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Screen_Height   [UIScreen mainScreen].bounds.size.height

#define RATIO   ((Screen_Width) / 375.f)

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIView *headImageView;
@property (nonatomic, strong) UIImageView *imageView1;
@property (nonatomic, strong) UIImageView *imageView2;
@property (nonatomic, strong) UIImageView *imageView3;
@property (nonatomic, strong) UIImageView *imageView4;
@property (nonatomic, strong) UIImageView *imageView5;
@property (nonatomic, strong) UIImageView *imageView6;
@property (nonatomic, strong) UIImageView *logoView;

@end

@implementation ViewController {
    // 主视图
    UIScrollView *_scrollView;
    // 主要子视图
    UIView *_contentView;
    // 背景视图
    UIImageView *_backImageView1;
    UIImageView *_backImageView2;
    UIImageView *_backImageView3;
    // 第一页的职位视图
    UIImageView *_jobImageView1;
    UIImageView *_jobImageView2;
    UIImageView *_jobImageView3;
    
    // 第一页ailogo 设计文字图片
    UIImageView *_aiImageViewSmall;
    UIImageView *_aiImageViewBig;
    UIImageView *_designLabelImageView;
    
    
    // 第二页职工视图
    UIImageView *_staffImageView1;
    UIImageView *_staffImageView2;
    UIImageView *_staffImageView3;
    
    // 第一第二页的引导文字视图
    UIImageView *_introduceImageView1;
    UIImageView *_introduceImageView2;
    // 分页指示器视图
    UIImageView *_indicatorImageView1;
    UIImageView *_indicatorImageView2;
    UIImageView *_indicatorImageView3;
    // 跳过按钮
    UIButton *_skipBtn;
    
    
    // 人像
    UIImageView *_personView;
    
    UIImageView *_checkView1;
    UIImageView *_checkView2;
    UIImageView *_checkView3;
    
    //开始按钮
    UIButton *_beginButton;
    

    NSInteger _positionSkipBtnX;
    NSInteger _positionY;
    
    //
    CGFloat marginX1;
    CGFloat marginX2;
    
    // 上一次偏移量x
    CGFloat offsetX;
    CGFloat offsetY;
    
    // staffImage原始位置
    CGFloat primeX1;
    CGFloat primeX2;
    CGFloat primeX3;
    
    // staffImage的xy
    
    CGFloat staffX;
    CGFloat staffY1;
    CGFloat staffY2;
    CGFloat staffY3;
    
    // 三个难搞的xy
    CGFloat aiSmallX;
    CGFloat aiSmallY;
    CGFloat aiBigX;
    CGFloat aiBigY;
    CGFloat designX;
    CGFloat designY;
    
    CGFloat aiSmallX2;
    CGFloat aiSmallY2;
    CGFloat aiBigX2;
    CGFloat aiBigY2;
    CGFloat designX2;
    CGFloat designY2;
    
    CGFloat staffOffsetX;
    
    CGFloat bv3OffsetY;

    
    // 需要保持x坐标的视图数组
    NSMutableArray *_hoverViewArray;
    
    // 第一页 三个需要改变y值的视图数组
    NSArray<UIImageView *> *_moveYViewArray;
    
    UIView *_initPageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    marginX1 = (Screen_Width - 306*RATIO)/2;
    marginX2 = (Screen_Width - 260*RATIO)/2;
    offsetX = 0;
    offsetY = 0;
    staffOffsetX = 0;
    
    aiSmallX = 127.5*RATIO;
    aiSmallY = 232*RATIO;
    aiBigX   = 132.5*RATIO;
    aiBigY   = 214*RATIO;
    designX  = 222.5*RATIO;
    designY  = 232*RATIO;
    
    aiSmallX2 = 444.5*RATIO;
    aiSmallY2 = 72*RATIO;
    aiBigX2   = 449.5*RATIO;
    aiBigY2   = 55*RATIO;
    designX2  = 499*RATIO;
    designY2  = 61*RATIO;
    
    staffX = 432.5*RATIO;
    staffY1 = 135*RATIO;
    staffY2 = 233*RATIO;
    staffY3 = 331*RATIO;
    
    primeX1 = 320*RATIO;
    primeX2 = 395*RATIO;
    primeX3 = 470*RATIO;
    
    bv3OffsetY = 200*RATIO;
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
//    [_scrollView setBackgroundColor:[UIColor redColor]];
    // 设置 scrollview 的内容宽度
    _scrollView.contentSize = CGSizeMake(Screen_Width*3, 0);
    // 设置分页
    _scrollView.pagingEnabled = YES;
    // 设置delegate
    _scrollView.delegate = self;
    // 设置滚动条隐藏
    _scrollView.showsHorizontalScrollIndicator = NO;
    // 设置 scrollView 的视图与内容宽度一致
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width*3, Screen_Height)];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //设置
//    CGFloat marginX = (Screen_Width - 306*RATIO)/2;
    
    // 初始化第一页三个职位
    _jobImageView1       = [[UIImageView alloc] initWithFrame:CGRectMake(marginX1, 27*RATIO, 306*RATIO, 131*RATIO)];
    _jobImageView2       = [[UIImageView alloc] initWithFrame:CGRectMake(marginX1, 177*RATIO, 306*RATIO, 131*RATIO)];
    _jobImageView3       = [[UIImageView alloc] initWithFrame:CGRectMake(marginX1, 327*RATIO, 306*RATIO, 131*RATIO)];
    //初始化三个员工视图
    _staffImageView1     = [[UIImageView alloc] initWithFrame:CGRectMake(320*RATIO, 135*RATIO, 260*RATIO, 81*RATIO)];
    _staffImageView2     = [[UIImageView alloc] initWithFrame:CGRectMake(395*RATIO, 233*RATIO, 260*RATIO, 81*RATIO)];
    _staffImageView3     = [[UIImageView alloc] initWithFrame:CGRectMake(470*RATIO, 331*RATIO, 260*RATIO, 81*RATIO)];
    // 初始化引导文字视图
    _introduceImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(32*RATIO, 473*RATIO, 310*RATIO, 100*RATIO)];
    _introduceImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(407*RATIO, 473*RATIO, 310*RATIO, 100*RATIO)];
    // 初始化分页指示器
    _indicatorImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(144*RATIO, 625*RATIO, 86*RATIO, 12*RATIO)];
    _indicatorImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(144*RATIO, 625*RATIO, 86*RATIO, 12*RATIO)];
    _indicatorImageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(144*RATIO, 625*RATIO, 86*RATIO, 12*RATIO)];
    
    // 初始化ai logo，设计文字视图
    _aiImageViewSmall     = [[UIImageView alloc] initWithFrame:CGRectMake(127*RATIO, 231*RATIO, 19*RATIO, 19*RATIO)];
    _aiImageViewBig       = [[UIImageView alloc] initWithFrame:CGRectMake(132*RATIO, 214*RATIO, 31*RATIO, 53*RATIO)];
    _designLabelImageView = [[UIImageView alloc] initWithFrame:CGRectMake(222*RATIO, 232*RATIO, 52*RATIO, 17*RATIO)];
    
    // 初始化背景视图
    _backImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(34*RATIO, 41*RATIO, 306*RATIO, 395*RATIO)];
    _backImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(34*RATIO, 31*RATIO, 306*RATIO, 423*RATIO)];
    _backImageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(64.5*RATIO, 200*RATIO, 246*RATIO, 345*RATIO)];
    
    // 初始化跳过按钮
    _skipBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // 初始化人像视图
    _personView = [[UIImageView alloc] initWithFrame:CGRectMake(285*RATIO, 66*RATIO, 30*RATIO, 30*RATIO)];
    [_personView setTransform:CGAffineTransformMakeScale(0.0001, 0.0001)];
    
    // 初始化checkview
    _checkView1 = [[UIImageView alloc] initWithFrame:CGRectMake(253.5*RATIO, 170*RATIO, 18*RATIO, 11*RATIO)];
    _checkView2 = [[UIImageView alloc] initWithFrame:CGRectMake(253.5*RATIO, 268*RATIO, 18*RATIO, 11*RATIO)];
    _checkView3 = [[UIImageView alloc] initWithFrame:CGRectMake(253.5*RATIO, 366*RATIO, 18*RATIO, 11*RATIO)];
    
    // 初始化启动按钮
    _beginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_jobImageView1 setImage:[UIImage imageNamed:@"OperationPartCN"]];
    [_jobImageView2 setImage:[UIImage imageNamed:@"DesignPart"]];
    [_jobImageView3 setImage:[UIImage imageNamed:@"DevelopmentPartCN"]];
    
    [_staffImageView1 setImage:[UIImage imageNamed:@"MemberACN"]];
    [_staffImageView2 setImage:[UIImage imageNamed:@"MemberBCN"]];
    [_staffImageView3 setImage:[UIImage imageNamed:@"MemberCCN"]];
    [_staffImageView1 setAlpha:0.0f];
    [_staffImageView2 setAlpha:0.0f];
    [_staffImageView3 setAlpha:0.0f];
    
    [_introduceImageView1 setImage:[UIImage imageNamed:@"Page1DescriptionCN"]];
    [_introduceImageView2 setImage:[UIImage imageNamed:@"Page2DescriptionCN"]];
    
    [_indicatorImageView1 setImage:[UIImage imageNamed:@"Indicators1"]];
    [_indicatorImageView2 setImage:[UIImage imageNamed:@"Indicators2"]];
    [_indicatorImageView3 setImage:[UIImage imageNamed:@"Indicators3"]];
    
    [_skipBtn setTitle:@"跳过" forState:UIControlStateNormal];
    [_skipBtn.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [_skipBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_skipBtn setFrame:CGRectMake(59*RATIO, 614*RATIO, 31*RATIO, 30*RATIO)];
    
    [_aiImageViewSmall setImage:[UIImage imageNamed:@"AILogo1"]];
    [_aiImageViewBig setImage:[UIImage imageNamed:@"AILogo2"]];
    [_designLabelImageView setImage:[UIImage imageNamed:@"IMG_0358"]];
    
    [_backImageView1 setImage:[UIImage imageNamed:@"AddMemberCN"]];
    [_backImageView1 setAlpha:0.f];
    [_backImageView2 setImage:[UIImage imageNamed:@"ProjectPage"]];
    [_backImageView2 setAlpha:0.f];
    [_backImageView3 setImage:[UIImage imageNamed:@"ProjectItemsCN"]];
    [_backImageView3 setAlpha:0.f];
    
    [_personView setImage:[UIImage imageNamed:@"InviteButton"]];
    
    [_checkView1 setImage:[UIImage imageNamed:@"IMG_0374"]];
    [_checkView2 setImage:[UIImage imageNamed:@"IMG_0374"]];
    [_checkView3 setImage:[UIImage imageNamed:@"IMG_0374"]];
    
    [_checkView1 setAlpha:0];
    [_checkView2 setAlpha:0];
    [_checkView3 setAlpha:0];
    
    [_beginButton setImage:[UIImage imageNamed:@"EnterButtonCN"] forState:UIControlStateNormal];
    [_beginButton setFrame:CGRectMake(792*RATIO, 512*RATIO, 291*RATIO, 50*RATIO)];
    
    [self.view addSubview:_scrollView];
    [_scrollView addSubview:_contentView];
    
    [_contentView addSubview:_backImageView1];
    [_contentView addSubview:_backImageView2];
    [_contentView addSubview:_backImageView3];
    
    [_contentView addSubview:_jobImageView1];
    [_contentView addSubview:_jobImageView2];
    [_contentView addSubview:_jobImageView3];
    
    [_contentView addSubview:_staffImageView1];
    [_contentView addSubview:_staffImageView2];
    [_contentView addSubview:_staffImageView3];
    
    [_contentView addSubview:_introduceImageView1];
    [_contentView addSubview:_introduceImageView2];
    
    [_contentView addSubview:_indicatorImageView3];
    [_contentView addSubview:_indicatorImageView2];
    [_contentView addSubview:_indicatorImageView1];
    
    [_contentView addSubview:_aiImageViewSmall];
    [_contentView addSubview:_aiImageViewBig];
    [_contentView addSubview:_designLabelImageView];
    
    [_contentView addSubview:_personView];
    [_contentView addSubview:_checkView1];
    [_contentView addSubview:_checkView2];
    [_contentView addSubview:_checkView3];
    [_contentView addSubview:_beginButton];
    
    [_contentView addSubview:_skipBtn];
    
    _hoverViewArray = [[NSMutableArray alloc] initWithArray:@[_skipBtn, _indicatorImageView1, _indicatorImageView2, _indicatorImageView3, _jobImageView1, _jobImageView2, _jobImageView3, _backImageView1, _backImageView2, _backImageView3, _personView, _checkView1, _checkView2, _checkView3]];
    _moveYViewArray = @[_jobImageView1, _jobImageView2, _jobImageView3];
    [self initPage];
    [self animationPage];
}

#pragma mark - 设置起始页
// scrollview边缘左拉释放触发
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;
{
    if (scrollView.contentOffset.x<0) {
        [self initPage];
        [self animationPage];
    }
}
// 初始化起始页
- (void)initPage {
    
    _initPageView = [[UIView alloc] initWithFrame:self.view.bounds];
    [_initPageView setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1.000 alpha:1.000]];
    
    _logoView = [[UIImageView alloc] initWithFrame:CGRectMake(97.5*RATIO, 308*RATIO, 180*RATIO, 31*RATIO)];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(77.5*RATIO, 46*RATIO, 80*RATIO, 90*RATIO)];
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(52.5*RATIO, 205*RATIO, 115*RATIO, 92*RATIO)];
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(72.5*RATIO, 358*RATIO, 90*RATIO, 72*RATIO)];
    [view1 setBackgroundColor:[UIColor whiteColor]];
    [view2 setBackgroundColor:[UIColor whiteColor]];
    [view3 setBackgroundColor:[UIColor whiteColor]];
    
    _imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(Screen_Width/2, Screen_Height/2, 52*RATIO, 72*RATIO)];
    _imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(Screen_Width/2, Screen_Height/2, 43*RATIO, 59*RATIO)];
    _imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(Screen_Width/2, Screen_Height/2, 54*RATIO, 74*RATIO)];
    _imageView4 = [[UIImageView alloc] initWithFrame:CGRectMake(Screen_Width/2, Screen_Height/2, 36*RATIO, 53*RATIO)];
    _imageView5 = [[UIImageView alloc] initWithFrame:CGRectMake(Screen_Width/2, Screen_Height/2, 76*RATIO, 63*RATIO)];
    _imageView6 = [[UIImageView alloc] initWithFrame:CGRectMake(Screen_Width/2, Screen_Height/2, 40*RATIO, 47*RATIO)];
    
    [_logoView setImage:[UIImage imageNamed:@"logo"]];
    [_imageView1 setImage:[UIImage imageNamed:@"moledkine"]];
    [_imageView2 setImage:[UIImage imageNamed:@"note"]];
    [_imageView3 setImage:[UIImage imageNamed:@"pantone"]];
    [_imageView4 setImage:[UIImage imageNamed:@"illustrator"]];
    [_imageView5 setImage:[UIImage imageNamed:@"terminal"]];
    [_imageView6 setImage:[UIImage imageNamed:@"coffee"]];
    
    [_initPageView addSubview:view1];
    [_initPageView addSubview:view2];
    [_initPageView addSubview:view3];
    [_initPageView addSubview:_logoView];
    [_initPageView addSubview:_imageView1];
    [_initPageView addSubview:_imageView2];
    [_initPageView addSubview:_imageView3];
    [_initPageView addSubview:_imageView4];
    [_initPageView addSubview:_imageView5];
    [_initPageView addSubview:_imageView6];
    
    [self.view addSubview:_initPageView];
}
// 动画 散开，再转到第一页对应的位置
- (void)animationPage {
    [UIView animateWithDuration:1 animations:^{
        [_imageView1 setFrame:CGRectMake(76*RATIO, 146*RATIO, 52*RATIO, 72*RATIO)];
        [_imageView2 setFrame:CGRectMake(237*RATIO, 86*RATIO, 43*RATIO, 59*RATIO)];
        [_imageView3 setFrame:CGRectMake(256*RATIO, 218*RATIO, 54*RATIO, 74*RATIO)];
        [_imageView4 setFrame:CGRectMake(66*RATIO, 400*RATIO, 36*RATIO, 53*RATIO)];
        [_imageView5 setFrame:CGRectMake(114*RATIO, 525*RATIO, 76*RATIO, 63*RATIO)];
        [_imageView6 setFrame:CGRectMake(284*RATIO, 430*RATIO, 40*RATIO, 47*RATIO)];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            [_imageView1 setFrame:CGRectMake(79*RATIO, 54*RATIO, 52*RATIO, 72*RATIO)];
            [_imageView2 setFrame:CGRectMake(111*RATIO, 75*RATIO, 43*RATIO, 59*RATIO)];
            [_imageView3 setFrame:CGRectMake(60*RATIO, 205*RATIO, 54*RATIO, 74*RATIO)];
            [_imageView4 setFrame:CGRectMake(128*RATIO, 215*RATIO, 36*RATIO, 53*RATIO)];
            [_imageView5 setFrame:CGRectMake(74.5*RATIO, 358*RATIO, 76*RATIO, 63*RATIO)];
            [_imageView6 setFrame:CGRectMake(141.5*RATIO, 395*RATIO, 22*RATIO, 26*RATIO)];
            [_initPageView setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1.000 alpha:0]];
            [_logoView setAlpha:0];
        } completion:^(BOOL finished) {
            [_initPageView removeFromSuperview];
        }];
    }];
}
// 滑动过程中
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGPoint point = scrollView.contentOffset;
    if (point.x>=0 && point.x<= 2*Screen_Width) {
        _backImageView1.alpha = point.x/Screen_Width;
        
        [_staffImageView1 setAlpha:point.x/(0.7*Screen_Width)];
        [_staffImageView2 setAlpha:point.x/(0.7*Screen_Width)];
        [_staffImageView3 setAlpha:point.x/(0.7*Screen_Width)];
        
        
        [self hoverView:point];
        [self backViewAnimation:point];
        [self jobTitleAnimation:point];
    }
}

#pragma mark - backview

- (void)backViewAnimation:(CGPoint) point {
    
    CGFloat alpha = point.x/Screen_Width;
    
    _backImageView1.alpha = alpha;
    _backImageView2.alpha = alpha - 1;
    
    CGRect frame = _backImageView3.frame;
    if (point.x >= 637.5*RATIO) {
        CGFloat alpha = (point.x - 637.5*RATIO)/112.5*RATIO;
        frame.origin.y = bv3OffsetY - alpha * 91*RATIO;
        _backImageView3.alpha = alpha;
    } else {
        frame.origin.y = bv3OffsetY - 91*RATIO;
        _backImageView3.alpha = 0;
    }
    _backImageView3.frame = frame;
}
#pragma mark - jobTitle

- (void)jobTitleAnimation:(CGPoint) point {
    
    CGFloat alphaRatio = (Screen_Width*0.7-(point.x)) / (Screen_Width*0.7);
    
    CGFloat y = (1 - alphaRatio) * 50*RATIO - offsetY;
    
    offsetY = offsetY + y;
    for (int i = 0; i<_moveYViewArray.count; i++) {
        CGRect frame = _moveYViewArray[i].frame;
        if (i < _moveYViewArray.count -1) {
            frame.origin.y = frame.origin.y - y;
        }else {
            frame.origin.y = frame.origin.y + y;
        }
        _moveYViewArray[i].frame = frame;
        _moveYViewArray[i].alpha = alphaRatio;
    }
}

// 第一页的三个view

// 主要操作方法

- (void)hoverView:(CGPoint)point {
    // 保持浮动视图，如背景、跨越三个视图的三个控件等
    for (UIView *view in _hoverViewArray) {
        CGRect frame = view.frame;
        frame.origin.x = frame.origin.x + point.x - offsetX;
        view.frame = frame;
    }
    // 第二页头像缩放
    if (point.x>=262.5*RATIO&&point.x<=Screen_Width) {
        CGFloat scale = (point.x - 262.5*RATIO)/112.5*RATIO;
        [_personView setTransform:CGAffineTransformMakeScale(scale+0.0001, scale+0.0001)];
    }
    else if(point.x<262.5*RATIO) {
        [_personView setTransform:CGAffineTransformMakeScale(0.0001, 0.0001)];
    }
    // 两次翻页的具体操作
    if (point.x<=Screen_Width) {
        // 第一页
        CGFloat rate =  point.x/Screen_Width;
        // 获取三个浮动视图的frame
        CGRect aiFrameSmall = _aiImageViewSmall.frame;
        CGRect aiFrameBig = _aiImageViewBig.frame;
        CGRect designLabelFrame = _designLabelImageView.frame;
        // 根据偏移量操作坐标
        aiFrameSmall.origin.x = aiSmallX + 317*rate*RATIO;
        aiFrameSmall.origin.y = aiSmallY - 159*rate*RATIO;

        aiFrameBig.origin.x = aiBigX + 317*rate*RATIO;
        aiFrameBig.origin.y = aiBigY + -159*rate*RATIO;

        designLabelFrame.origin.x = designX + 276.5*rate*RATIO;
        designLabelFrame.origin.y = designY + -171*rate*RATIO;
        // 更新三个浮动视图frame
        _aiImageViewSmall.frame     = aiFrameSmall;
        _aiImageViewBig.frame       = aiFrameBig;
        _designLabelImageView.frame = designLabelFrame;
        // 以下操作第二页三个工作标签
        // 在偏移量到屏幕尺寸的0.7前保持原坐标，到达后，三个标签保持浮动
        CGRect staffframe1 = _staffImageView1.frame;
        CGFloat x1 = primeX1 + ((point.x - 262.5*RATIO)>=0 ? (point.x - 262.5*RATIO) : 0);
        staffframe1.origin.x = x1;
        _staffImageView1.frame = staffframe1;
        // 以下操作，在偏移量到达屏幕一半前保持原坐标，到达一半后，在屏幕尺寸一半到屏幕尺寸的0.7之间要完成：第二个标签往右移动75，第三个往右移动150。
        CGRect staffframe2 = _staffImageView2.frame;
        if (point.x>=(Screen_Width/2) && point.x<=262.5*RATIO) {
            staffframe2.origin.x = primeX2 - (point.x - Screen_Width/2);
            _staffImageView2.frame = staffframe2;
        }else if(point.x>262.5*RATIO){
            CGFloat x = primeX1 + point.x - 262.5*RATIO;
            staffframe2.origin.x = x;
            _staffImageView2.frame = staffframe2;
        }
        NSLog(@"===========%f", _staffImageView3.frame.origin.x);
        CGRect staffframe3 = _staffImageView3.frame;
        if (point.x>=(Screen_Width/2) && point.x<=262.5*RATIO) {

            NSLog(@"%f===========%f", staffframe3.origin.x, primeX3 - 2*(point.x - Screen_Width/2));
            staffframe3.origin.x = primeX3 - 2*(point.x - Screen_Width/2);
            _staffImageView3.frame = staffframe3;
        }else if(point.x>262.5*RATIO){
            CGFloat x = primeX1 + point.x - 262.5*RATIO;
            staffframe3.origin.x = x;
            _staffImageView3.frame = staffframe3;
        }
        // 防止快速滑动偏移不准，当偏移量小于屏幕一半尺寸，第二第三个偏移修正到原始尺寸
        if(point.x<(Screen_Width/2)) {
            CGRect staffframe2 = _staffImageView2.frame;
            CGRect staffframe3 = _staffImageView3.frame;

            staffframe2.origin.x = primeX2;
            staffframe3.origin.x = primeX3;

            _staffImageView2.frame = staffframe2;
            _staffImageView3.frame = staffframe3;
        }
/// fix: 修正透明展示
//        if (point.x>=262.5*RATIO) {
            CGFloat alpha = (point.x-262.5*RATIO)/37.5*RATIO;
            _checkView1.alpha = alpha;
            _checkView2.alpha = alpha - 1;
            _checkView3.alpha = alpha - 2;
//        }
    }else {
        CGFloat alpha = (point.x-Screen_Width)/Screen_Width;
        CGFloat offset = point.x - Screen_Width;
        CGFloat rate = alpha;

        CGRect aiFrameSmall = _aiImageViewSmall.frame;
        CGRect aiFrameBig = _aiImageViewBig.frame;
        CGRect designLabelFrame = _designLabelImageView.frame;

        aiFrameSmall.origin.x = aiSmallX2 + 457.5*rate*RATIO;
        aiFrameSmall.origin.y = aiSmallY2 - 24*rate*RATIO;

        aiFrameBig.origin.x = aiBigX2 + 444*rate*RATIO;
        aiFrameBig.origin.y = aiBigY2 - 25*rate*RATIO;
//        aiFrameBig.origin.x = aiBigX + 424*rate;
//        aiFrameBig.origin.y = aiBigY - 159*rate;

        designLabelFrame.origin.x = designX2 + 424*rate*RATIO;
        designLabelFrame.origin.y = designY2 - 13*rate*RATIO;

        _aiImageViewSmall.frame     = aiFrameSmall;
        _aiImageViewBig.frame       = aiFrameBig;
        _designLabelImageView.frame = designLabelFrame;
        _aiImageViewBig.alpha = 1-alpha;

        CGRect staffFrame1 = _staffImageView1.frame;
        CGRect staffFrame2 = _staffImageView2.frame;
        CGRect staffFrame3 = _staffImageView3.frame;

        if (point.x <562.5*RATIO) {


            staffFrame1.origin.x = staffX + offset + 2*alpha * 26*RATIO;
            staffFrame2.origin.x = staffX + offset + 2*alpha * 26*RATIO;
            staffFrame3.origin.x = staffX + offset + 2*alpha * 26*RATIO;
            staffFrame1.origin.y = staffY1 - 2*alpha * 76.9*RATIO;
            staffFrame2.origin.y = staffY2 - 2*alpha * 174.9*RATIO;
            staffFrame3.origin.y = staffY3 - 2*alpha * 272.9*RATIO;
            staffFrame1.size = CGSizeMake(260*RATIO*(0.8+((1-2*alpha)/5)), 81*RATIO*(0.8+((1-2*alpha)/5)));
            staffFrame2.size = CGSizeMake(260*RATIO*(0.8+((1-2*alpha)/5)), 81*RATIO*(0.8+((1-2*alpha)/5)));
            staffFrame3.size = CGSizeMake(260*RATIO*(0.8+((1-2*alpha)/5)), 81*RATIO*(0.8+((1-2*alpha)/5)));

        }else {
            staffFrame1.origin.x = staffX + offset + 26*RATIO;
            staffFrame2.origin.x = staffX + offset + 26*RATIO;
            staffFrame3.origin.x = staffX + offset + 26*RATIO;
            staffFrame1.origin.y = staffY1 - 76.9*RATIO;
            staffFrame2.origin.y = staffY2 - 174.9*RATIO;
            staffFrame3.origin.y = staffY3 - 272.9*RATIO;
            staffFrame1.size = CGSizeMake(208*RATIO, 64.8*RATIO);
            staffFrame2.size = CGSizeMake(208*RATIO, 64.8*RATIO);
            staffFrame3.size = CGSizeMake(208*RATIO, 64.8*RATIO);
        }

        _staffImageView1.alpha = (1-alpha);
        _staffImageView2.alpha = (1-alpha);
        _staffImageView3.alpha = (1-alpha);
        _staffImageView1.frame = staffFrame1;
        _staffImageView2.frame = staffFrame2;
        _staffImageView3.frame = staffFrame3;

        // checkview
        CGRect frame1 = _checkView1.frame;
        CGRect frame2 = _checkView2.frame;
        CGRect frame3 = _checkView3.frame;

        frame1.origin.y = staffFrame1.origin.y + staffFrame1.size.height/2 - frame1.size.height;
        frame2.origin.y = staffFrame2.origin.y + staffFrame1.size.height/2 - frame2.size.height;
        frame3.origin.y = staffFrame3.origin.y + staffFrame1.size.height/2 - frame3.size.height;

        _checkView1.frame = frame1;
        _checkView2.frame = frame2;
        _checkView3.frame = frame3;

        _checkView1.alpha = (1-alpha);
        _checkView2.alpha = (1-alpha);
        _checkView3.alpha = (1-alpha);
        _personView.alpha = (1-alpha);

    }

    [self setIndicatorAlpha:point];
//    [self setstaff:point];
    offsetX = point.x;

    NSLog(@"%f", point.x);
    
}

- (void)setIndicatorAlpha:(CGPoint) point {
    
    CGFloat alpha = (2*Screen_Width - point.x)/Screen_Width;
    
    if (alpha >= 1 && alpha <=2) {
        _indicatorImageView1.alpha = alpha - 1;
        _indicatorImageView2.alpha = 2 - alpha;
        _indicatorImageView3.alpha = 0;
    } else {
        _indicatorImageView1.alpha = alpha - 1;
        _indicatorImageView2.alpha = alpha;
        _indicatorImageView3.alpha = 1 - alpha;
    }
}

@end
