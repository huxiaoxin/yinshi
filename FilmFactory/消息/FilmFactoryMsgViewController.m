//
//  FilmFactoryMsgViewController.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/20.
//

#import "FilmFactoryMsgViewController.h"

@interface FilmFactoryMsgViewController ()
@property(nonatomic,strong) UITableView * FilmFacotryMsgTableView;
@end

@implementation FilmFactoryMsgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.FilmFacotryMsgTableView];
    // Do any additional setup after loading the view.
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
