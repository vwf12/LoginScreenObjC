//
//  AppDelegate.m
//  LoginScreenObjC
//
//  Created by FARIT GATIATULLIN on 02.07.2021.
//

#import "AppDelegate.h"
#import <UIKit/UIKit.h>
#import "LoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.windowScene = (UIWindowScene *)scene;
//    self.window.rootViewController = [[UINavigationController alloc]
//                         initWithRootViewController:LoginViewController.new];
    self.window.rootViewController = [[LoginViewController alloc]init];

    [self.window makeKeyAndVisible];
    
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//
//    NSArray* xibContents = [[NSBundle mainBundle] loadNibNamed:@"LoginViewController"
//                                                         owner:nil
//                                                       options:nil];
//    UIViewController* vc = [xibContents objectAtIndex:0];
//    UINavigationController *navigationController =
//        [[UINavigationController alloc] initWithRootViewController:vc];
//    self.window.rootViewController = vc;
//    [self.window makeKeyAndVisible];

    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options  API_AVAILABLE(ios(13.0)){
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions  API_AVAILABLE(ios(13.0)){
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
