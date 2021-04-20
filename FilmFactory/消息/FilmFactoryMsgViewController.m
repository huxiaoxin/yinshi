//
//  FilmFactoryMsgViewController.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/20.
//

#import "FilmFactoryMsgViewController.h"
#import "FilmFactoryMsgHeaderView.h"
#import "FilmFacotryMsgTableViewCell.h"
@interface FilmFactoryMsgViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * FilmFacotryMsgTableView;
@property(nonatomic,strong) FilmFactoryMsgHeaderView * msgHeader;
@end

@implementation FilmFactoryMsgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"消息";
    [self.view addSubview:self.FilmFacotryMsgTableView];
    _FilmFacotryMsgTableView.tableHeaderView = self.msgHeader;
    // Do any additional setup after loading the view.
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
    }
    return _FilmFacotryMsgTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * FilmFacorryIdentiefer =  @"FilmFacotryMsgTableViewCell";
    FilmFacotryMsgTableViewCell * FilmCell = [tableView dequeueReusableCellWithIdentifier:FilmFacorryIdentiefer];
    if (FilmCell == nil) {
        FilmCell = [[FilmFacotryMsgTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FilmFacorryIdentiefer];
    }
    return FilmCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(80);
}
-(FilmFactoryMsgHeaderView *)msgHeader{
    if (!_msgHeader) {
        _msgHeader = [[FilmFactoryMsgHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width,K(120))];
    }
    return _msgHeader;
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
