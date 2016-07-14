//
//  AppDelegate.m
//  LeTian
//
//  Created by jobs on 16/7/12.
//  Copyright © 2016年 jobs. All rights reserved.
//

#import "AppDelegate.h"
#import "ListViewController.h"
#import "LikeViewController.h"
#import "MeViewController.h"

@interface AppDelegate ()
@property(nonatomic,strong)UITabBarController *TabBarCV;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
        [Bmob registerWithAppKey:@"39049dfb4af47c9f842e2589249b4a2b"];

    
    UITabBarController *tabBarVC = [[UITabBarController alloc]init];
    self.window.rootViewController = tabBarVC;
    self.window.backgroundColor = [UIColor whiteColor];
    ListViewController *listVc =[[ListViewController alloc]init];
    LikeViewController *likeVc = [[LikeViewController alloc]init];
    MeViewController *meVc = [[MeViewController alloc]init];
    self.TabBarCV.tabBar.backgroundColor=[UIColor redColor];
    UINavigationController *navClist =[[UINavigationController alloc]initWithRootViewController:listVc];
    UINavigationController *navClike = [[UINavigationController alloc]initWithRootViewController:likeVc];
    UINavigationController *navCme =[[UINavigationController alloc]initWithRootViewController:meVc];
    
    NSArray *controllers = [NSArray arrayWithObjects:navClist,navClike,navCme, nil];
    
    tabBarVC.viewControllers = controllers;
    
    
    UITabBar *tabBar = tabBarVC.tabBar;
    UITabBarItem *tabBarItem0 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:2];
    
    tabBarItem0.selectedImage = [UIImage imageNamed:@"show"];
    tabBarItem0.image = [[UIImage imageNamed:@"show"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    tabBarItem1.selectedImage = [UIImage imageNamed:@"like"];
    tabBarItem1.image = [[UIImage imageNamed:@"like"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    tabBarItem2.selectedImage = [UIImage imageNamed:@"me"];
    tabBarItem2.image = [[UIImage imageNamed:@"me"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
