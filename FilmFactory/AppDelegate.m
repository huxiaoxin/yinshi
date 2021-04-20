//
//  AppDelegate.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/20.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [NSClassFromString(@"FilmFactoryBaeTabbarViewController") new];
    // Override point for customization after application launch.
    return YES;
}

@end
