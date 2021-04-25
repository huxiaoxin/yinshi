//
//  FilmFactoryZoneDetailViewController.m
//  FilmFactory
//
//  Created by codehzx on 2021/4/25.
//

#import "FilmFactoryZoneDetailViewController.h"
#import "FilmFacorryZoneDetailheader.h"
#import "LMJHorizontalScrollText.h"
#import "FilmFarZoneDetiaCell.h"
#import "FilmZoneJbaoController.h"
#import <LYEmptyView-umbrella.h>
@interface FilmFactoryZoneDetailViewController ()<UITableViewDataSource,UITableViewDelegate,FilmFarZoneDetiaCellDelegate,FilmFacorryZoneDetailheaderDelegate>
@property(nonatomic,strong) UITableView  * FilmFactroyTableView;
@property(nonatomic,strong) FilmFacorryZoneDetailheader * FilmDetailHeader;
@property(nonatomic,strong) NSMutableArray * FilmDataArr;
@end

@implementation FilmFactoryZoneDetailViewController

- (NSMutableArray *)FilmDataArr{
    if (!_FilmDataArr) {
        _FilmDataArr = [NSMutableArray array];
    }
    return _FilmDataArr;
}
-(FilmFacorryZoneDetailheader *)FilmDetailHeader{
    if (!_FilmDetailHeader) {
        _FilmDetailHeader = [[FilmFacorryZoneDetailheader alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, K(20)) ConfigZoneModel:self.filmModel];
        _FilmDetailHeader.delegate = self;
    }
    return _FilmDetailHeader;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIView * navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, NaviH)];
    self.gk_navTitleView = navView;
    LMJHorizontalScrollText * ScrollText = [[LMJHorizontalScrollText alloc]initWithFrame:CGRectMake(K(0), K(0), CGRectGetWidth(navView.frame), K(40))];
    ScrollText.textColor = [UIColor blackColor];
    ScrollText.text = self.filmModel.title;
    ScrollText.textFont =KSysFont(18);
    ScrollText.speed              = 0.03;
    ScrollText.moveDirection      = LMJTextScrollMoveLeft;
    ScrollText.moveMode           = LMJTextScrollContinuous;
    ScrollText.textColor = LGDLightBLackColor;
   [navView addSubview:ScrollText];
    [ScrollText move];
    [self.view addSubview:self.FilmFactroyTableView];
    self.FilmDetailHeader.kheight = self.FilmDetailHeader.FilmViewHeight;
    _FilmFactroyTableView.tableHeaderView = self.FilmDetailHeader;
    // Do any additional setup after loading the view.

    UIButton * FilmAddComentBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_Height-K(50), SCREEN_Width, K(50))];
    [FilmAddComentBtn setBackgroundColor:LGDMianColor];
    [FilmAddComentBtn setTitle:@"发布评论" forState:UIControlStateNormal];
    FilmAddComentBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [FilmAddComentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    FilmAddComentBtn.titleLabel.font = [UIFont systemFontOfSize:K(14)];
    [FilmAddComentBtn addTarget:self action:@selector(FilmAddComentBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:FilmAddComentBtn];
}

- (UITableView *)FilmFactroyTableView{
    if (!_FilmFactroyTableView) {
        _FilmFactroyTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-K(60)) style:UITableViewStylePlain];
        _FilmFactroyTableView.delegate = self;
        _FilmFactroyTableView.dataSource = self;
        _FilmFactroyTableView.separatorStyle =  UITableViewCellSelectionStyleNone;
        _FilmFactroyTableView.backgroundColor = [UIColor whiteColor];
        _FilmFactroyTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(ShuyunDetailheaderClicks)];
        [_FilmFactroyTableView.mj_header beginRefreshing];
    }
    return _FilmFactroyTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.FilmDataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *  FilmzoneIdnetiders = @"FilmFarZoneDetiaCell";
    FilmFarZoneDetiaCell   * FilmzoneCell  =[tableView dequeueReusableCellWithIdentifier:FilmzoneIdnetiders];
    if (FilmzoneCell == nil) {
        FilmzoneCell = [[FilmFarZoneDetiaCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FilmzoneIdnetiders];
    }
    FilmzoneCell.tag = indexPath.row;
    FilmzoneCell.delegate = self;
    FilmzoneCell.comentModel = self.FilmDataArr[indexPath.row];
    return FilmzoneCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    FilmFactoryComentModel  * comentMdoe = self.FilmDataArr[indexPath.row];
    return comentMdoe.CellHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return K(40);
}
#pragma mark--ShuyunshequDetailTableViewCellDelegate
-(void)FilmFarZoneDetiaCellDetailTableViewCellWithIndex:(NSInteger)Cellindex FilmFarZoneDetiaCellbtnTag:(NSInteger)btnIndex{
    FilmFactoryComentModel * comentModel = self.FilmDataArr[Cellindex];
    if (btnIndex == 1) {
        FilmZoneJbaoController * jubaoVc = [[FilmZoneJbaoController alloc]init];
        [self.navigationController pushViewController:jubaoVc animated:YES];
    }else{
       

        UIAlertController * FilmzonalterVc = [UIAlertController alertControllerWithTitle:@"温馨提示" message:[NSString stringWithFormat:@"您确定要屏蔽(%@)该用户吗？",comentModel.name] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * sureActoin = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self ShuyunComentWituser:comentModel];
        }];
        
        UIAlertAction * thinkingActoin = [UIAlertAction actionWithTitle:@"再想想" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [FilmzonalterVc addAction:sureActoin];
        [FilmzonalterVc addAction:thinkingActoin];
        [self presentViewController:FilmzonalterVc animated:YES completion:nil];

    }
}
-(void)ShuyunComentWituser:(FilmFactoryComentModel *)comentModel{
    [WHC_ModelSqlite delete:[FilmFactoryComentModel class] where:[NSString stringWithFormat:@"ZoneID = '%ld' and ComentID = '%ld'",comentModel.ZoneID,comentModel.ComentID]];
    [LCProgressHUD showLoading:@""];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LCProgressHUD showSuccess:@"屏蔽成功"];
        [self.FilmFactroyTableView.mj_header beginRefreshing];
    });

}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * SectionView = [UIView new];
    SectionView.backgroundColor = [UIColor whiteColor];
    SectionView.backgroundColor = [UIColor whiteColor];
    UILabel * shuyunseciotnlb = [[UILabel alloc]initWithFrame:CGRectMake(K(20), K(10), K(200), K(20))];
    shuyunseciotnlb.font = KBlFont(14);
    shuyunseciotnlb.text = @"全部评论";
    [SectionView addSubview:shuyunseciotnlb];
    return SectionView;
}
-(void)ShuyunDetailheaderClicks{
    MJWeakSelf;
    NSArray * dataArr = [WHC_ModelSqlite query:[FilmFactoryComentModel class] where:[NSString stringWithFormat:@"ZoneID = '%ld'",self.filmModel.ZoneDetrailID]];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (weakSelf.FilmDataArr.count > 0) {
            [weakSelf.FilmDataArr removeAllObjects];
        }
        weakSelf.FilmDataArr = [dataArr mutableCopy];
        if (weakSelf.FilmDataArr.count == 0) {
            [LCProgressHUD showInfoMsg:@"暂无数据"];
            LYEmptyView * emtyView = [LYEmptyView emptyViewWithImage:nil titleStr:@"暂无数据" detailStr:nil];
            emtyView.contentViewOffset = K(100  );
            weakSelf.FilmFactroyTableView.ly_emptyView = emtyView;
        }
        [weakSelf.FilmFactroyTableView reloadData];
        [weakSelf.FilmFactroyTableView.mj_header endRefreshing];
    });
}
#pragma mark--FilmFacorryZoneDetailheaderDelegate
-(void)FilmFacorryZoneDetailheaderWithBtnIndex:(NSInteger)btnIndex{
    if (btnIndex == 0) {
      //拉黑
        UIAlertController * FilmzonalterVc = [UIAlertController alertControllerWithTitle:@"温馨提示" message:[NSString stringWithFormat:@"您确定要屏蔽(%@)该用户吗？",self.filmModel.name] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * sureActoin = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self FilmChangeConfiguserModel:self.filmModel];
        }];
        
        UIAlertAction * thinkingActoin = [UIAlertAction actionWithTitle:@"再想想" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [FilmzonalterVc addAction:sureActoin];
        [FilmzonalterVc addAction:thinkingActoin];
        [self presentViewController:FilmzonalterVc animated:YES completion:nil];
    }else{
        FilmZoneJbaoController * jubaoVc = [[FilmZoneJbaoController alloc]init];
        [self.navigationController pushViewController:jubaoVc animated:YES];
    }
}
-(void)FilmChangeConfiguserModel:(FilmFactoryZoneModel *)zoneModel{
    
    [LCProgressHUD showLoading:@""];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LCProgressHUD  showSuccess:@"屏蔽成功"];
        [WHC_ModelSqlite delete:[FilmFactoryZoneModel class] where:[NSString stringWithFormat:@"ZoneDetrailID ='%ld'",self.filmModel.ZoneDetrailID]];
        [self.navigationController popViewControllerAnimated:YES];
    });
}
-(void)FilmAddComentBtnClick{
    
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
