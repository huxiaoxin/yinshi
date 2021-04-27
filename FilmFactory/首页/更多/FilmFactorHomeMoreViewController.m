//
//  FilmFactorHomeMoreViewController.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/21.
//

#import "FilmFactorHomeMoreViewController.h"
#import "FilmFacroyHomeTableViewCell.h"
@interface FilmFactorHomeMoreViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * FilmFactoryTableView;
@end

@implementation FilmFactorHomeMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"企鹅追剧";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.FilmFactoryTableView];
    // Do any additional setup after loading the view.
}

- (UITableView *)FilmFactoryTableView{
    if (!_FilmFactoryTableView) {
        _FilmFactoryTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, GK_SCREEN_WIDTH, GK_SCREEN_HEIGHT-NaviH-GK_SAFEAREA_BTM) style:UITableViewStylePlain];
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
