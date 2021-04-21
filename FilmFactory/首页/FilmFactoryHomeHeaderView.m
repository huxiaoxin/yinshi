//
//  FilmFactoryHomeHeaderView.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/21.
//

#import "FilmFactoryHomeHeaderView.h"
#import <KJBannerView.h>
#import "FilmFactoryMovieView.h"
#import "FilmFactoryHomeBtn.h"
#import <SDCycleScrollView.h>
@interface FilmFactoryHomeHeaderView ()<KJBannerViewDataSource,KJBannerViewDelegate>
@property(nonatomic,strong) KJBannerView   * Filmbanar;
@property(nonatomic,strong) NSMutableArray * banarModelArr;
@property(nonatomic,strong) FilmFactoryMovieView         * movieView;
@property(nonatomic,strong) SDCycleScrollView * SDCView;
@end
@implementation FilmFactoryHomeHeaderView
- (NSMutableArray *)banarModelArr{
    if (!_banarModelArr) {
        _banarModelArr = [NSMutableArray array];
    }
    return _banarModelArr;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.Filmbanar];
        [_Filmbanar kj_reloadBannerViewDatas];
        [self addSubview:self.movieView];
        
        UIView * btnView = [[UIView alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(_movieView.frame)+K(15), SCREEN_Width-K(30), K(60+20))];
        btnView.layer.cornerRadius = 5;
        btnView.backgroundColor =[UIColor whiteColor];
        [self addSubview:btnView];
        [btnView viewShadowPathWithColor:LGDLightGaryColor shadowOpacity:0.8 shadowRadius:5 shadowPathType:LeShadowPathAround shadowPathWidth:5];
        
        NSArray  * btnArr = @[@"橙子好片",@"恐怖悬疑",@"即将上映",@"影视资讯"];
        for (int index = 0; index < btnArr.count; index ++) {
            FilmFactoryHomeBtn * homeBtn = [[FilmFactoryHomeBtn alloc]initWithFrame:CGRectMake(CGRectGetWidth(btnView.frame)/btnArr.count*index, K(10), CGRectGetWidth(btnView.frame)/btnArr.count, K(60))];
            homeBtn.FilmTopImgView.image = [UIImage imageNamed:btnArr[index]];
            homeBtn.FilmBtomlb.text = btnArr[index];
            homeBtn.tag = index;
            [btnView addSubview:homeBtn];
        }
        
        UIImageView * FirstThubImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(btnView.frame)+K(10), SCREEN_Width-K(30), K(80))];
        FirstThubImgView.image = [UIImage imageNamed:@"line_img3"];
        [self addSubview:FirstThubImgView];
        
        int width = SCREEN_Width-K(30);
        SDCycleScrollView * SDCView = [[SDCycleScrollView alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(btnView.frame)+K(10), width, K(80))];
        SDCView.showPageControl = NO;
        [self addSubview:SDCView];
        SDCView.imageURLStringsGroup = @[@"https://107cine.cdn.cinehello.com/shequn/sigma/line_img3.png",@"https://107cine.cdn.cinehello.com/shequn/sigma/line_img2.png",@"https://107cine.cdn.cinehello.com/shequn/sigma/line_img1.png"];
        
        
        
        UILabel * FilmFactoTitle = [[UILabel alloc]initWithFrame:CGRectMake(K(20), CGRectGetMaxY(SDCView.frame)+K(15), K(250), K(20))];
        FilmFactoTitle.textColor = [UIColor blackColor];
//        FilmFactoTitle.font = [UIFont boldSystemFontOfSize:20];
       
        [self addSubview:FilmFactoTitle];
        
//
        
        NSTextAttachment * attchment = [[NSTextAttachment alloc]init];
        attchment.image = [UIImage imageNamed:@"meishi_chengzi"];
        attchment.bounds  = CGRectMake(0, -5, K(25), K(25));
        
        NSAttributedString * attbute =[NSAttributedString attributedStringWithAttachment:attchment];
        NSMutableAttributedString * mutablAtt = [[NSMutableAttributedString alloc]initWithString:@"橙子推荐"];
        [mutablAtt addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:18] range:NSMakeRange(0, 4)];
        [mutablAtt addAttribute:NSForegroundColorAttributeName value:LGDBLackColor range:NSMakeRange(0, 1)];
        [mutablAtt addAttribute:NSForegroundColorAttributeName value:LGDMianColor range:NSMakeRange(1, 1)];
        [mutablAtt addAttribute:NSForegroundColorAttributeName value:LGDBLackColor range:NSMakeRange(2, 1)];
        [mutablAtt addAttribute:NSForegroundColorAttributeName value:LGDMianColor range:NSMakeRange(3, 1)];
        [mutablAtt insertAttributedString:attbute atIndex:0];
        FilmFactoTitle .attributedText = mutablAtt;
        
        
        UILabel * Filfactomorelb = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_Width-K(115), CGRectGetMaxY(SDCView.frame)+K(15), K(100), K(20))];
        Filfactomorelb.userInteractionEnabled = YES;
        Filfactomorelb.textAlignment = NSTextAlignmentRight;
        Filfactomorelb.font = [UIFont systemFontOfSize:13];
        Filfactomorelb.textColor = LGDMianColor;
        [self addSubview:Filfactomorelb];
        
        UITapGestureRecognizer * moreTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(moreInfoTapClicks)];
        
        
        [Filfactomorelb addGestureRecognizer:moreTap];
        
        NSTextAttachment * lastMent = [[NSTextAttachment alloc]init];
        lastMent.image = [UIImage imageNamed:@"gengduo"];
        lastMent.bounds  = CGRectMake(0, -2, K(12), K(12));
        NSAttributedString * lastattbute =[NSAttributedString attributedStringWithAttachment:lastMent];
        NSMutableAttributedString * lastemutablAtt = [[NSMutableAttributedString alloc]initWithString:@"查看更多"];
        [lastemutablAtt addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(0, 4)];
        [lastemutablAtt addAttribute:NSForegroundColorAttributeName value:LGDMianColor range:NSMakeRange(0, 4)];

        [lastemutablAtt insertAttributedString:lastattbute atIndex:4];
        Filfactomorelb .attributedText = lastemutablAtt;
        
        
        
    }
    return self;
}
-(void)moreInfoTapClicks{
    [self.delegate FilmFactoryHomeHeaderViewMToMoreVc];
}
-(UIView *)movieView{
    if (!_movieView) {
        _movieView = [[FilmFactoryMovieView alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(_Filmbanar.frame)+K(10), SCREEN_Width-K(30), K(80))];
        _movieView.backgroundColor = LGDLightGaryColor;
        _movieView.layer.cornerRadius = K(5);
        _movieView.layer.masksToBounds = YES;
    }
    return _movieView;
}
- (KJBannerView *)Filmbanar{
    if (!_Filmbanar) {
        _Filmbanar = [[KJBannerView alloc]initWithFrame:CGRectMake(0, K(15), SCREEN_Width, K(150))];
        _Filmbanar.delegate = self;
        _Filmbanar.dataSource = self;
        _Filmbanar.autoTime = 2;
        _Filmbanar.isZoom = YES;
        _Filmbanar.itemSpace = -K(5);
        _Filmbanar.itemWidth = K(280);
    }
    return _Filmbanar;
}
- (NSArray *)kj_setDatasBannerView:(KJBannerView *)banner{
    return @[@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2F01.minipic.eastday.com%2F20171211%2F20171211185710_66c75b95e5421bbc73d255836976d21d_5.jpeg&refer=http%3A%2F%2F01.minipic.eastday.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1621562150&t=4295d134064e3ebd11f6a82c581b6d44",@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2254925766,233962270&fm=224&gp=0.jpg"];
}
- (void)kj_BannerView:(KJBannerView *)banner SelectIndex:(NSInteger)index{
}
@end
