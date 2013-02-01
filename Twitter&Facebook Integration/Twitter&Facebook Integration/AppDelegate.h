//
//  AppDelegate.h
//  Twitter&Facebook Integration
//
//  Created by Shreekant Pawar on 01/02/13.
//  Copyright (c) 2013 Suniket Wagh. All rights reserved.
//

#define __IOS_VERSION [[[[UIDevice currentDevice] systemVersion] substringToIndex:1] intValue]

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Twitter/Twitter.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@end
