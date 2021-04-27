//
//  FilmFactoryMsgViewController.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/20.
//

#import "FilmFactoryMsgViewController.h"
#import "FilmFactoryMsgHeaderView.h"
#import "FilmFacotryMsgTableViewCell.h"
#import "FilmFactroysysTemViewController.h"
#import "FilmFactoryZanViewController.h"
#import "FilmFactoryComenmtNotiViewController.h"
#import "FilmChatChatDetailViewController.h"
@interface FilmFactoryMsgViewController ()<UITableViewDelegate,UITableViewDataSource,FilmFactoryMsgHeaderViewDelegate>
@property(nonatomic,strong) UITableView * FilmFacotryMsgTableView;
@property(nonatomic,strong) FilmFactoryMsgHeaderView * msgHeader;
@property(nonatomic,strong) NSMutableArray * FilmMsgDataArr;
@end

@implementation FilmFactoryMsgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"消息";
    [self.view addSubview:self.FilmFacotryMsgTableView];
    _FilmFacotryMsgTableView.tableHeaderView = self.msgHeader;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(FilmFacotryLoginSucced) name:@"FilmFacotryLoginSucced" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(FilmFacotryLoginSucced) name:@"FilmFacotryLoginout" object:nil];
    // Do any additional setup after loading the view.
}
-(void)FilmFacotryLoginSucced{
    [self FilmFacotryMsgTableViewClick];
}
- (NSMutableArray *)FilmMsgDataArr{
    if (!_FilmMsgDataArr) {
        _FilmMsgDataArr = [NSMutableArray array];
    }
    return _FilmMsgDataArr;
}
- (UITableView *)FilmFacotryMsgTableView{
    if (!_FilmFacotryMsgTableView) {
        _FilmFacotryMsgTableView =  [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-kTabBarHeight) style:UITableViewStylePlain];
        _FilmFacotryMsgTableView.delegate = self;
        _FilmFacotryMsgTableView.dataSource = self;
        _FilmFacotryMsgTableView.showsVerticalScrollIndicator = NO;
        _FilmFacotryMsgTableView.showsHorizontalScrollIndicator = NO;
        _FilmFacotryMsgTableView.backgroundColor = [UIColor clearColor];
        _FilmFacotryMsgTableView.separatorStyle =  UITableViewCellSelectionStyleNone;
        _FilmFacotryMsgTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(FilmFacotryMsgTableViewClick)];
        [_FilmFacotryMsgTableView.mj_header beginRefreshing];
    }
    return _FilmFacotryMsgTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.FilmMsgDataArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * FilmFacorryIdentiefer =  @"FilmFacotryMsgTableViewCell";
    FilmFacotryMsgTableViewCell * FilmCell = [tableView dequeueReusableCellWithIdentifier:FilmFacorryIdentiefer];
    if (FilmCell == nil) {
        FilmCell = [[FilmFacotryMsgTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FilmFacorryIdentiefer];
    }
    FilmCell.FilmModel =  self.FilmMsgDataArr[indexPath.row];
    return FilmCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(80);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FilmChatChatDetailViewController * FilmDetailVc = [[FilmChatChatDetailViewController alloc]init];
    FilmDetailVc.hidesBottomBarWhenPushed = YES;
    FilmDetailVc.listModel = self.FilmMsgDataArr[indexPath.row];
    [self.navigationController pushViewController:FilmDetailVc animated:YES];
}
-(FilmFactoryMsgHeaderView *)msgHeader{
    if (!_msgHeader) {
        _msgHeader = [[FilmFactoryMsgHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width,K(120))];
        _msgHeader.delegate = self;
    }
    return _msgHeader;
}
#pragma mark--FilmFactoryMsgHeaderViewDelegate
-(void)FilmFactoryMsgHeaderViewBtnClickWithbtnIndex:(NSInteger)btnIndex{
    if (![FilmFactoryToolModel FilmFactoryisLogin]) {
        [self FilmFactoryBaseShowLoginVc];
        return;
    }

    if (btnIndex == 0) {
        FilmFactroysysTemViewController * filmsysVc = [[FilmFactroysysTemViewController alloc]init];
        filmsysVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:filmsysVc animated:YES];
        
    }else if (btnIndex == 1){
        FilmFactoryZanViewController * filmZanVc = [[FilmFactoryZanViewController alloc]init];
        filmZanVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:filmZanVc animated:YES];
    }else{
        FilmFactoryComenmtNotiViewController * filmComentNotiVc = [[FilmFactoryComenmtNotiViewController alloc]init];
        filmComentNotiVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:filmComentNotiVc animated:YES];
        
    }
}
-(void)FilmFacotryMsgTableViewClick{
    NSArray * FilmDataArr =[WHC_ModelSqlite query:[FilmChatMsgListModel class]];
    
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([FilmFactoryToolModel FilmFactoryisLogin]) {
            if (weakSelf.FilmMsgDataArr.count > 0) {
                [weakSelf.FilmMsgDataArr removeAllObjects];
            }
            weakSelf.FilmMsgDataArr = FilmDataArr.mutableCopy;
            [weakSelf.FilmFacotryMsgTableView reloadData];
            [weakSelf.FilmFacotryMsgTableView.mj_header endRefreshing];

        }else{
            LYEmptyView * emtyView = [LYEmptyView emptyActionViewWithImage:nil titleStr:@"未登录" detailStr:@"" btnTitleStr:@"去登录" target:self action:@selector(FilmFactorytologin)];
            weakSelf.FilmFacotryMsgTableView.ly_emptyView = emtyView;
            [weakSelf.FilmFacotryMsgTableView.mj_header endRefreshing];

        }
    });
}
-(void)FilmFactorytologin{
    [self FilmFactoryBaseShowLoginVc];
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
