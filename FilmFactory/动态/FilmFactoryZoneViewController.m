//
//  FilmFactoryZoneViewController.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/20.
//

#import "FilmFactoryZoneViewController.h"
#import "FilmFactoryZoneTableViewCell.h"
#import "FilmFactorySectionHeader.h"
@interface FilmFactoryZoneViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView  * FilmFactoryTableView;
@property(nonatomic,strong) NSMutableArray * FilmFactorydataArr;
@end

@implementation FilmFactoryZoneViewController

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
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return K(20);
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
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
    return FilmFactoryCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180;
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
    }
    return _FilmFactoryTableView;
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
