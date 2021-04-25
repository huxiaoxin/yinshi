//
//  FilmFactoryZoneViewController.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/20.
//

#import "FilmFactoryZoneViewController.h"
#import "FilmFactoryZoneTableViewCell.h"
#import "FilmFactorySectionHeader.h"
#import "FilmFactoryZoneModel.h"
#import "FilmFactoryZoneDetailViewController.h"
#import "FilmZoneJbaoController.h"
@interface FilmFactoryZoneViewController ()<UITableViewDelegate,UITableViewDataSource,FilmFactoryZoneTableViewCellDelegate>
@property(nonatomic,strong) UITableView  * FilmFactoryTableView;
@property(nonatomic,strong) NSMutableArray * FilmFactorydataArr;
@property(nonatomic,assign)NSMutableArray  * FilmSectionArr;
@end

@implementation FilmFactoryZoneViewController

-(NSMutableArray *)FilmFactorydataArr{
    if (!_FilmFactorydataArr) {
        _FilmFactorydataArr = [NSMutableArray array];
    }
    return _FilmFactorydataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"动态";
    [self.view addSubview:self.FilmFactoryTableView];
    UIView * lkHeader = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, 10)];
    lkHeader.backgroundColor = [UIColor clearColor];
    _FilmFactoryTableView.tableHeaderView =  lkHeader;
    // Do any additional setup after loading the view
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.FilmFactorydataArr[section] count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return K(20);
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.FilmFactorydataArr.count;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    FilmFactorySectionHeader * sectionHeader = [FilmFactorySectionHeader new];
    return sectionHeader;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *  FilmFactoryIdentifer = @"FilmFactoryZoneTableViewCell";
    FilmFactoryZoneTableViewCell * FilmFactoryCell = [tableView dequeueReusableCellWithIdentifier:FilmFactoryIdentifer];
    if (FilmFactoryCell == nil) {
        FilmFactoryCell = [[FilmFactoryZoneTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FilmFactoryIdentifer];
    }
    FilmFactoryCell.myIndexpath = indexPath;
    FilmFactoryCell.tag = indexPath.row;
    FilmFactoryCell.delegate  =self;
    FilmFactoryCell.filmModel = self.FilmFactorydataArr[indexPath.section][indexPath.row];
    return FilmFactoryCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(180);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FilmFactoryZoneDetailViewController * FilmDetailVc = [[FilmFactoryZoneDetailViewController alloc]init];
    FilmDetailVc.filmModel = self.FilmFactorydataArr[indexPath.section][indexPath.row];
    FilmDetailVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:FilmDetailVc animated:YES];
}
- (UITableView *)FilmFactoryTableView{
    if (!_FilmFactoryTableView) {
        _FilmFactoryTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-kTabBarHeight) style:UITableViewStyleGrouped];
        _FilmFactoryTableView.delegate = self;
        _FilmFactoryTableView.dataSource = self;
        _FilmFactoryTableView.showsVerticalScrollIndicator = NO;
        _FilmFactoryTableView.showsHorizontalScrollIndicator = NO;
        _FilmFactoryTableView.backgroundColor =  [UIColor clearColor];
        _FilmFactoryTableView.separatorStyle =  UITableViewCellSelectionStyleNone;
        _FilmFactoryTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(FilmFactoryTableViewheaderClick)];
        [_FilmFactoryTableView.mj_header beginRefreshing];
    }
    return _FilmFactoryTableView;
}
-(void)FilmFactoryTableViewheaderClick{
    
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSArray * dataArr = [WHC_ModelSqlite query:[FilmFactoryZoneModel class]];
        if (weakSelf.FilmFactorydataArr.count > 0) {
            [weakSelf.FilmFactorydataArr removeAllObjects];
        }
        for (NSInteger index = 0; index < 3; index++) {
            NSMutableArray * tempArr = [NSMutableArray array];
            for (FilmFactoryZoneModel * mdoel in dataArr) {
                if (mdoel.SectionID == index) {
                    [tempArr addObject:mdoel];
                }
            }
            [weakSelf.FilmFactorydataArr addObject:tempArr.copy];
        }
        [weakSelf.FilmFactoryTableView reloadData];
        [weakSelf.FilmFactoryTableView.mj_header endRefreshing];
    });
}
#pragma mark--FilmFactoryZoneTableViewCellDelegate
-(void)FilmFactoryZoneTableViewCellWithBtnClickIndex:(NSInteger)btnIndex CellConfigIndex:( NSIndexPath *)cellIndex{
    FilmFactoryZoneModel * filmModel = self.FilmFactorydataArr[cellIndex.section][cellIndex.row];
    if (btnIndex == 0) {
        
    }else if (btnIndex == 1){
        
        FilmZoneJbaoController * FilmWseVc = [[FilmZoneJbaoController alloc]init];
        FilmWseVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:FilmWseVc animated:YES];
        
    }else if (btnIndex == 2){
        UIAlertController * shuyunAlterVc = [UIAlertController alertControllerWithTitle:@"温馨提示" message:[NSString stringWithFormat:@"您确定要屏蔽(%@)该用户吗？",filmModel.name] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * sureActoin = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self FilmChangeConfiguserModel:filmModel];
        }];
        
        UIAlertAction * thinkingActoin = [UIAlertAction actionWithTitle:@"再想想" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [shuyunAlterVc addAction:sureActoin];
        [shuyunAlterVc addAction:thinkingActoin];
        [self presentViewController:shuyunAlterVc animated:YES completion:nil];
        
        
    }
}
-(void)FilmChangeConfiguserModel:(FilmFactoryZoneModel *)zoneModel{
    
    [LCProgressHUD showLoading:@""];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LCProgressHUD  showSuccess:@"屏蔽成功"];
        [WHC_ModelSqlite delete:[FilmFactoryZoneModel class] where:[NSString stringWithFormat:@"ZoneDetrailID ='%ld'",zoneModel.ZoneDetrailID]];
        [self.FilmFactoryTableView.mj_header beginRefreshing];
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
