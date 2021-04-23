//
//  FilmFactoryHomeViewController.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/20.
//

#import "FilmFactoryHomeViewController.h"
#import "FilmFacroyHomeTableViewCell.h"
#import "FilmFactoryHomeHeaderView.h"
#import "FilmFactorHomeMoreViewController.h"
#import "FilmFacroryHomeDetailViewController.h"
@interface FilmFactoryHomeViewController ()<UITableViewDelegate,UITableViewDataSource,FilmFactoryHomeHeaderViewDelegate>
@property(nonatomic,strong) UITableView * FilmFactoryTableView;
@property(nonatomic,strong) FilmFactoryHomeHeaderView * FilmHeader;
@property(nonatomic,strong) NSMutableArray * FilmFactoryDataArr;
@end

@implementation FilmFactoryHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle =  @"橙子影视工厂";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.FilmFactoryTableView];
    _FilmFactoryTableView.tableHeaderView =  self.FilmHeader;
    // Do any additional setup after loading the view.
}
- (FilmFactoryHomeHeaderView *)FilmHeader{
    if (!_FilmHeader) {
        _FilmHeader = [[FilmFactoryHomeHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, K(480))];
        _FilmHeader.delegate = self;
    }
    return _FilmHeader;
}
- (UITableView *)FilmFactoryTableView{
    if (!_FilmFactoryTableView) {
        _FilmFactoryTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-kTabBarHeight) style:UITableViewStylePlain];
        _FilmFactoryTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _FilmFactoryTableView.delegate = self;
        _FilmFactoryTableView.dataSource =  self;
        _FilmFactoryTableView.showsVerticalScrollIndicator = NO;
        _FilmFactoryTableView.showsHorizontalScrollIndicator = NO;
        _FilmFactoryTableView.backgroundColor = [UIColor clearColor];
        _FilmFactoryTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(FilmFactoryHeaderClicks)];
        [_FilmFactoryTableView.mj_header beginRefreshing];
    }
    return _FilmFactoryTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * FilmFacoryIdentifer = @"FilmFacroyHomeTableViewCell";
    FilmFacroyHomeTableViewCell * FilmFacoryCell = [tableView dequeueReusableCellWithIdentifier:FilmFacoryIdentifer];
    if (FilmFacoryCell == nil) {
        FilmFacoryCell = [[FilmFacroyHomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FilmFacoryIdentifer];
    }
    return FilmFacoryCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(120);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [[GKNavigationBarConfigure sharedInstance] updateConfigure:^(GKNavigationBarConfigure *configure) {
        configure.backStyle = GKNavigationBarBackStyleWhite;
        
    }];
    FilmFacroryHomeDetailViewController * FilmDetailVc = [[FilmFacroryHomeDetailViewController alloc]init];
    FilmDetailVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:FilmDetailVc animated:YES];
}
#pragma mark--FilmFactoryHomeHeaderViewDelegate
-(void)FilmFactoryHomeHeaderViewMToMoreVc{
    FilmFactorHomeMoreViewController  * filmmoreVc = [[FilmFactorHomeMoreViewController alloc]init];
    filmmoreVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:filmmoreVc animated:YES];
}
-(void)FilmFactoryHeaderClicks{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_FilmFactoryTableView.mj_header endRefreshing];
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
