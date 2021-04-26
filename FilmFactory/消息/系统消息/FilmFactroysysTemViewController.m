//
//  FilmFactroysysTemViewController.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/26.
//

#import "FilmFactroysysTemViewController.h"
#import "FilmFactroysystemTableViewCell.h"
#import "FilmFacotrysystemDetailViewController.h"
@interface FilmFactroysysTemViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * FilmFactorySysTableView;
@property(nonatomic,strong) NSMutableArray * FilmFactroyDataArr;
@end

@implementation FilmFactroysysTemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"系统消息";
    self.view.backgroundColor = LGDLightGaryColor;
    [self.view addSubview:self.FilmFactorySysTableView];
    // Do any additional setup after loading the view.
}
- (NSMutableArray *)FilmFactroyDataArr{
    if (!_FilmFactroyDataArr) {
        _FilmFactroyDataArr = [NSMutableArray array];
    }
    return _FilmFactroyDataArr;
}
-(UITableView *)FilmFactorySysTableView{
    if (!_FilmFactorySysTableView) {
        _FilmFactorySysTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-GK_SAFEAREA_BTM) style:UITableViewStylePlain];
        _FilmFactorySysTableView.delegate = self;
        _FilmFactorySysTableView.dataSource = self;
        _FilmFactorySysTableView.showsVerticalScrollIndicator = NO;
        _FilmFactorySysTableView.showsHorizontalScrollIndicator = NO;
        _FilmFactorySysTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _FilmFactorySysTableView.backgroundColor = [UIColor clearColor];
    }
    return _FilmFactorySysTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * FilmFacotoryIdentifer = @"FilmFactroysystemTableViewCell";
    FilmFactroysystemTableViewCell * FilmCell = [tableView dequeueReusableCellWithIdentifier:FilmFacotoryIdentifer];
    if (FilmCell == nil) {
        FilmCell =[[FilmFactroysystemTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FilmFacotoryIdentifer];
    }
    return FilmCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(170);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FilmFacotrysystemDetailViewController * FilmDetailVc = [[FilmFacotrysystemDetailViewController alloc]init];
    FilmDetailVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:FilmDetailVc animated:YES];
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
