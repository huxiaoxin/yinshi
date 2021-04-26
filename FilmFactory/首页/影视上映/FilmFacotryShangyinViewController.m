//
//  FilmFacotryShangyinViewController.m
//  FilmFactory
//
//  Created by codehzx on 2021/4/26.
//

#import "FilmFacotryShangyinViewController.h"
#import "FilmFacotryShangyinTableViewCell.h"
#import "FilmFacotryShangyingDetailViewController.h"
@interface FilmFacotryShangyinViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * FilmFacotryTableView;
@property(nonatomic,strong) NSMutableArray * FilmFacotryDataArr;
@end

@implementation FilmFacotryShangyinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.FilmIndex == 0) {
        self.gk_navTitle = @"橙子好片";
    }else if (self.FilmIndex == 1){
        self.gk_navTitle = @"悬疑恐怖";
    }else if (self.FilmIndex == 2){
        self.gk_navTitle = @"即将上映";
    }
    [self.view addSubview:self.FilmFacotryTableView];
    // Do any additional setup after loading the view.
}

- (UITableView *)FilmFacotryTableView{
    if (!_FilmFacotryTableView) {
        _FilmFacotryTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-GK_SAFEAREA_BTM) style:UITableViewStylePlain];
        _FilmFacotryTableView.delegate = self;
        _FilmFacotryTableView.dataSource = self;
        _FilmFacotryTableView.showsVerticalScrollIndicator = NO;
        _FilmFacotryTableView.showsHorizontalScrollIndicator = NO;
        _FilmFacotryTableView.separatorStyle =UITableViewCellSelectionStyleNone;
        _FilmFacotryTableView.backgroundColor = [UIColor clearColor];
        _FilmFacotryTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(FilmFacotryHeaderClicks)];
        [_FilmFacotryTableView.mj_header beginRefreshing];
    }
    return _FilmFacotryTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * FilmFacotryIdentifer = @"FilmFacotryShangyinTableViewCell";
    FilmFacotryShangyinTableViewCell * FilmmFacoreyCell =[tableView dequeueReusableCellWithIdentifier:FilmFacotryIdentifer];
    if (FilmmFacoreyCell == nil ) {
        FilmmFacoreyCell = [[FilmFacotryShangyinTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FilmFacotryIdentifer];
    }
    return FilmmFacoreyCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(110);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FilmFacotryShangyingDetailViewController * FilmShanyinVc = [[FilmFacotryShangyingDetailViewController alloc]init];
    FilmShanyinVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:FilmShanyinVc animated:YES];
}
-(void)FilmFacotryHeaderClicks{
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf.FilmFacotryTableView.mj_header endRefreshing];
    });
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
