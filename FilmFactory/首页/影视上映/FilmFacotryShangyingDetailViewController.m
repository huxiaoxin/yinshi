//
//  FilmFacotryShangyingDetailViewController.m
//  FilmFactory
//
//  Created by codehzx on 2021/4/26.
//

#import "FilmFacotryShangyingDetailViewController.h"
#import "FilmFacotryShangyinDetailHeader.h"
#import "FilmFarZoneDetiaCell.h"
@interface FilmFacotryShangyingDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * FilmFacotyTableView;
@property(nonatomic,strong) FilmFacotryShangyinDetailHeader * FilmDetaiHeader;
@property(nonatomic,strong) UIButton  * FilmAddBtn;
@end

@implementation FilmFacotryShangyingDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navBarAlpha = 0;
    [self.view addSubview:self.FilmFacotyTableView];
    self.FilmDetaiHeader.kheight = self.FilmDetaiHeader.FilmFacotryShangyinDetailHeaderHeight;
    _FilmFacotyTableView.tableHeaderView = self.FilmDetaiHeader;
    [self.view addSubview:self.FilmAddBtn];
    // Do any additional setup after loading the view.
}
- (UIButton *)FilmAddBtn{
    if (!_FilmAddBtn) {
        _FilmAddBtn  =[[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_Height-K(50), SCREEN_Width, K(50))];
        [_FilmAddBtn setBackgroundColor:LGDMianColor];
        [_FilmAddBtn setTitle:@"添加评论" forState:UIControlStateNormal];
        _FilmAddBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_FilmAddBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_FilmAddBtn addTarget:self action:@selector(FilmAddBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _FilmAddBtn;
}
- (FilmFacotryShangyinDetailHeader *)FilmDetaiHeader{
    if (!_FilmDetaiHeader) {
        _FilmDetaiHeader = [[FilmFacotryShangyinDetailHeader alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, 0) WithConfig:self.filmHomeMode];
    }
    return _FilmDetaiHeader;
}
- (UITableView *)FilmFacotyTableView{
    if (!_FilmFacotyTableView) {
        _FilmFacotyTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, SCREEN_Height-K(60)) style:UITableViewStylePlain];
        _FilmFacotyTableView.delegate  = self;
        _FilmFacotyTableView.dataSource= self;
        _FilmFacotyTableView.showsVerticalScrollIndicator = NO;
        _FilmFacotyTableView.showsHorizontalScrollIndicator  =NO;
        _FilmFacotyTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _FilmFacotyTableView.backgroundColor = [UIColor clearColor];
    }
    return _FilmFacotyTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *  FilmzoneIdnetiders = @"FilmFarZoneDetiaCell";
    FilmFarZoneDetiaCell   * FilmzoneCell  =[tableView dequeueReusableCellWithIdentifier:FilmzoneIdnetiders];
    if (FilmzoneCell == nil) {
        FilmzoneCell = [[FilmFarZoneDetiaCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FilmzoneIdnetiders];
    }
//    FilmzoneCell.tag = indexPath.row;
//    FilmzoneCell.delegate = self;
//    FilmzoneCell.comentModel = self.FilmDataArr[indexPath.row];
    return FilmzoneCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(150);
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return K(40);
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * FilmHeader =[UIView new];
    FilmHeader.backgroundColor = [UIColor whiteColor];
    UILabel * FilmSeciotnlb = [[UILabel alloc]initWithFrame:CGRectMake(K(12), 0, SCREEN_Width, K(30))];
    FilmSeciotnlb.textColor = [UIColor blackColor];
    FilmSeciotnlb.font = [UIFont boldSystemFontOfSize:16];
    FilmSeciotnlb.text = @"热门评论";
    [FilmHeader addSubview:FilmSeciotnlb];
    return FilmHeader;
}
-(void)FilmAddBtnClick{
    
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
