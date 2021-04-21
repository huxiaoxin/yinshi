//
//  FilmFactoryLoactionViewController.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/21.
//

#import "FilmFactoryLoactionViewController.h"
#import "FilmFactoryLoactionTableViewCell.h"
@interface FilmFactoryLoactionViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * FilmFactoryTableView;
@property(nonatomic,strong) NSMutableArray * FilmFactoryDataArr;
@end

@implementation FilmFactoryLoactionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"首映";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.FilmFactoryTableView];
    // Do any additional setup after loading the view.
}
- (UITableView *)FilmFactoryTableView{
    if (!_FilmFactoryTableView) {
        _FilmFactoryTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-kTabBarHeight) style:UITableViewStylePlain];
        _FilmFactoryTableView.delegate = self;
        _FilmFactoryTableView.dataSource = self;
        _FilmFactoryTableView.showsVerticalScrollIndicator = NO;
        _FilmFactoryTableView.showsHorizontalScrollIndicator = NO;
        _FilmFactoryTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    }
    return _FilmFactoryTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString  * FilmFactoryIdetifer =  @"FilmFactoryLoactionTableViewCell";
    FilmFactoryLoactionTableViewCell * FilmFactoriCell = [tableView dequeueReusableCellWithIdentifier:FilmFactoryIdetifer];
    if (FilmFactoriCell == nil) {
        FilmFactoriCell = [[FilmFactoryLoactionTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FilmFactoryIdetifer];
    }
    return FilmFactoriCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(100);
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
