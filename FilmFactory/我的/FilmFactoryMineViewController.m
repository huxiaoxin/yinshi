//
//  FilmFactoryMineViewController.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/20.
//

#import "FilmFactoryMineViewController.h"
#import "FilmacroryMineTableViewCell.h"
#import "FilmFacroryMineHeaderView.h"
#import "FilmFactorySugestionViewController.h"
#import "FilmFactoryAboutusViewController.h"
#import "FilmFactoryChangeInfoViewController.h"
@interface FilmFactoryMineViewController ()<UITableViewDelegate,UITableViewDataSource,FilmFacroryMineHeaderViewDelegate>
@property(nonatomic,strong) UITableView * FilmFacroryTableView;
@property(nonatomic,strong) FilmFacroryMineHeaderView * FilmFacoryHeader;
@property(nonatomic,strong) NSMutableArray * FilmDataArr;
@end

@implementation FilmFactoryMineViewController

- (NSMutableArray *)FilmDataArr{
    if (!_FilmDataArr) {
        _FilmDataArr = @[@"意见反馈",@"清除缓存",@"关于我们",@"当前版本"].mutableCopy;
    }
    return _FilmDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navigationBar.hidden = YES;
    [self.view addSubview:self.FilmFacroryTableView];
    _FilmFacroryTableView.tableHeaderView = self.FilmFacoryHeader;
    // Do any additional setup after loading the view.
}
- (FilmFacroryMineHeaderView *)FilmFacoryHeader{
    if (!_FilmFacoryHeader) {
        _FilmFacoryHeader  =[[FilmFacroryMineHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, K(250))];
        _FilmFacoryHeader.delegate = self;
    }
    return _FilmFacoryHeader;
}
-(UITableView *)FilmFacroryTableView{
    if (!_FilmFacroryTableView) {
        _FilmFacroryTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, GK_SCREEN_WIDTH, GK_SCREEN_HEIGHT-GK_TABBAR_HEIGHT) style:UITableViewStylePlain];
        _FilmFacroryTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _FilmFacroryTableView.delegate = self;
        _FilmFacroryTableView.dataSource =  self;
        _FilmFacroryTableView.showsVerticalScrollIndicator = NO;
        _FilmFacroryTableView.showsHorizontalScrollIndicator = NO;
        _FilmFacroryTableView.backgroundColor = [UIColor clearColor];
    }
    return _FilmFacroryTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.FilmDataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * FilmFacrotyIdentifer = @"FilmacroryMineTableViewCell";
    FilmacroryMineTableViewCell * FilmFacorCell = [tableView dequeueReusableCellWithIdentifier:FilmFacrotyIdentifer];
    if (FilmFacorCell == nil) {
        FilmFacorCell = [[FilmacroryMineTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FilmFacrotyIdentifer];
    }
    FilmFacorCell.xiaoxinIconStr  = self.FilmDataArr[indexPath.row];
    
    if (indexPath.row == 0) {
        NSTextAttachment * attachment = [[NSTextAttachment alloc]init];
        attachment.image = [UIImage imageNamed:@"right"];
        attachment.bounds = CGRectMake(0, -RealWidth(6), RealWidth(20), RealWidth(20));
        NSAttributedString * attbute =[NSAttributedString attributedStringWithAttachment:attachment];
        NSMutableAttributedString * mutablAttbute = [[NSMutableAttributedString alloc]initWithString:@""];
        [mutablAttbute appendAttributedString:attbute];
        FilmFacorCell.XiaoxinRightlb.attributedText =mutablAttbute;
    }else if (indexPath.row == 1){
        NSTextAttachment * attachment = [[NSTextAttachment alloc]init];
        attachment.image = [UIImage imageNamed:@"right"];
        attachment.bounds = CGRectMake(0, -RealWidth(6), RealWidth(20), RealWidth(20));
        NSAttributedString * attbute =[NSAttributedString attributedStringWithAttachment:attachment];
        NSMutableAttributedString * mutablAttbute = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%.2fM",[self FilmitemCacoutleMermroSize]]];
        [mutablAttbute appendAttributedString:attbute];
        FilmFacorCell.XiaoxinRightlb.attributedText =mutablAttbute;
        
    }else if (indexPath.row == 3){
        NSTextAttachment * attachment = [[NSTextAttachment alloc]init];
        attachment.image = [UIImage imageNamed:@"right"];
        attachment.bounds = CGRectMake(0, -RealWidth(6), RealWidth(20), RealWidth(20));
        NSAttributedString * attbute =[NSAttributedString attributedStringWithAttachment:attachment];
        NSMutableAttributedString * mutablAttbute = [[NSMutableAttributedString alloc]initWithString:@"V_1.0"];
        [mutablAttbute appendAttributedString:attbute];
        FilmFacorCell.XiaoxinRightlb.attributedText =mutablAttbute;
        

    }else{
        NSTextAttachment * attachment = [[NSTextAttachment alloc]init];
        attachment.image = [UIImage imageNamed:@"right"];
        attachment.bounds = CGRectMake(0, -RealWidth(6), RealWidth(20), RealWidth(20));
        NSAttributedString * attbute =[NSAttributedString attributedStringWithAttachment:attachment];
        NSMutableAttributedString * mutablAttbute = [[NSMutableAttributedString alloc]initWithString:@""];
        [mutablAttbute appendAttributedString:attbute];
        FilmFacorCell.XiaoxinRightlb.attributedText =mutablAttbute;
    }
    return FilmFacorCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(50);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        FilmFactorySugestionViewController * FilmSugestionVc = [[FilmFactorySugestionViewController alloc]init];
        FilmSugestionVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:FilmSugestionVc animated:YES];
    }else if (indexPath.row == 1){
        [self FilmitemCacoClearMerSize];
    }else if (indexPath.row == 2){
        FilmFactoryAboutusViewController * FilmFactorVc =  [[FilmFactoryAboutusViewController alloc]init];
        FilmFactorVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:FilmFactorVc animated:YES];
    }else{
        [self FilmFactoryBaseShowLoginVc];
    }
}
- (CGFloat)FilmitemCacoutleMermroSize{
    CGFloat FilmitemCacoutleMermroSize = 0.0;
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)firstObject];
    NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachePath];
    for(NSString *path in files) {
        NSString*filePath = [cachePath stringByAppendingString:[NSString stringWithFormat:@"/%@",path]];
        FilmitemCacoutleMermroSize += [[NSFileManager defaultManager]attributesOfItemAtPath:filePath error:nil].fileSize;
    }
    CGFloat sizeM = FilmitemCacoutleMermroSize /1024.0/1024.0;
    
    return sizeM;
}
- (void)FilmitemCacoClearMerSize{
    NSString*cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)objectAtIndex:0];
    NSArray*files = [[NSFileManager defaultManager]subpathsAtPath:cachePath];
    for(NSString *p in files){
        NSError*error;
        
        NSString*path = [cachePath stringByAppendingString:[NSString stringWithFormat:@"/%@",p]];
        
        if([[NSFileManager defaultManager]fileExistsAtPath:path])
        {
            BOOL isRemove = [[NSFileManager defaultManager]removeItemAtPath:path error:&error];
            if(isRemove) {
                [LCProgressHUD showSuccess:@"清除成功"];
                [self.FilmFacroryTableView reloadData];
            }else{
                
            }
        }
    }
}
#pragma mark--FilmFacroryMineHeaderViewDelegate
-(void)FilmFacroryMineHeaderViewChangeInfo{
    FilmFactoryChangeInfoViewController * FilmChangeVc = [[FilmFactoryChangeInfoViewController alloc]init];
    FilmChangeVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:FilmChangeVc animated:YES];
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
