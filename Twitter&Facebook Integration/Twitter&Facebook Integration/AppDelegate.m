//
//  AppDelegate.m
//  Twitter&Facebook Integration
//
//  Created by Shreekant Pawar on 01/02/13.
//  Copyright (c) 2013 Suniket Wagh. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil];
    } else {
        self.viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPad" bundle:nil];
    }
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    
    UIButton *twitter = [UIButton buttonWithType:UIButtonTypeCustom];
    [twitter setFrame:CGRectMake(50, 10, [self.window frame].size.width - 100, 45)];
    [twitter setTitle:@"Twitter" forState:UIControlStateNormal];
    [twitter addTarget:self action:@selector(twitterPress) forControlEvents:UIControlEventTouchUpInside];
    
    [twitter setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [twitter setTitleShadowColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3f] forState:UIControlStateNormal];
    
    [twitter setTitleColor:[UIColor colorWithRed:0.61f green:0.61f blue:0.61f alpha:1.00f] forState:UIControlStateDisabled];
    [twitter setTitleShadowColor:[UIColor clearColor] forState:UIControlStateDisabled];
    
    [[twitter titleLabel] setFont:[UIFont boldSystemFontOfSize:14.0f]];
    [[twitter titleLabel] setShadowOffset:CGSizeMake(0.0f, -1.0f)];
    [twitter setBackgroundImage:[[UIImage imageNamed:@"twitter_n"] stretchableImageWithLeftCapWidth:10 topCapHeight:0] forState:UIControlStateNormal];
    [twitter setBackgroundImage:[[UIImage imageNamed:@"twitter_h"] stretchableImageWithLeftCapWidth:10 topCapHeight:0] forState:UIControlStateHighlighted];
    [twitter setBackgroundImage:[[UIImage imageNamed:@"twitter_d"] stretchableImageWithLeftCapWidth:10 topCapHeight:0] forState:UIControlStateDisabled];
    [twitter setEnabled:(__IOS_VERSION >= 5)];
    [[self.viewController view] addSubview:twitter];
    
    UIButton *facebook = [UIButton buttonWithType:UIButtonTypeCustom];
    [facebook setFrame:CGRectMake(50, 80, [self.window frame].size.width - 100, 45)];
    [facebook setTitle:@"Facebook" forState:UIControlStateNormal];
    [facebook addTarget:self action:@selector(facebookPress) forControlEvents:UIControlEventTouchUpInside];
    
    [facebook setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [facebook setTitleShadowColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3f] forState:UIControlStateNormal];
    
    [facebook setTitleColor:[UIColor colorWithRed:0.61f green:0.61f blue:0.61f alpha:1.00f] forState:UIControlStateDisabled];
    [facebook setTitleShadowColor:[UIColor clearColor] forState:UIControlStateDisabled];
    
    [[facebook titleLabel] setFont:[UIFont boldSystemFontOfSize:14.0f]];
    [[facebook titleLabel] setShadowOffset:CGSizeMake(0.0f, -1.0f)];
    [facebook setBackgroundImage:[[UIImage imageNamed:@"facebook_n"] stretchableImageWithLeftCapWidth:10 topCapHeight:0] forState:UIControlStateNormal];
    [facebook setBackgroundImage:[[UIImage imageNamed:@"facebook_h"] stretchableImageWithLeftCapWidth:10 topCapHeight:0] forState:UIControlStateHighlighted];
    [facebook setBackgroundImage:[[UIImage imageNamed:@"facebook_d"] stretchableImageWithLeftCapWidth:10 topCapHeight:0] forState:UIControlStateDisabled];
    [facebook setEnabled:(__IOS_VERSION >= 6)];
    [[self.viewController view] addSubview:facebook];
    
    return YES;
}

- (void) twitterPress {
    if(NSClassFromString(@"SLComposeViewController") != nil) {
        SLComposeViewController *twitterController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
            SLComposeViewControllerCompletionHandler __block completionHandler = ^(SLComposeViewControllerResult result) {
                [twitterController dismissViewControllerAnimated:YES completion:nil];
                switch(result) {
                    case SLComposeViewControllerResultDone: {
                        NSLog(@"Posted....");
                    }
                        break;
                    default:{
                        NSLog(@"Cancelled.....");
                    }
                        break;
                }
            };
            
            [twitterController addImage:[UIImage imageNamed:@"sip.png"]];
            [twitterController setInitialText:@"Compose Your Tweet Here."];
            [twitterController addURL:[NSURL URLWithString:@"http://farasbee.com/"]];
            [twitterController setCompletionHandler:completionHandler];
            [self.viewController presentViewController:twitterController animated:YES completion:nil];
        }
    } else if(NSClassFromString(@"TWTweetComposeViewController") != nil) {
        TWTweetComposeViewController *twitterController = [[TWTweetComposeViewController alloc] init];
        [twitterController addImage:[UIImage imageNamed:@"sip.png"]];
        [twitterController setInitialText:@"Compose Your Tweet Here."];
        [twitterController addURL:[NSURL URLWithString:@"http://farasbee.com/"]];
        
        [self.viewController presentViewController:twitterController animated:YES completion:nil];
        twitterController.completionHandler = ^(TWTweetComposeViewControllerResult res) {
            [self.viewController dismissModalViewControllerAnimated:YES];
        };
    }
}

- (void) facebookPress {
    if(NSClassFromString(@"SLComposeViewController") != nil) {
        SLComposeViewController *facebookController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
            SLComposeViewControllerCompletionHandler __block completionHandler = ^(SLComposeViewControllerResult result) {
                [facebookController dismissViewControllerAnimated:YES completion:nil];
                switch(result) {
                    case SLComposeViewControllerResultDone: {
                        NSLog(@"Posted....");
                    }
                        break;
                    default:{
                        NSLog(@"Cancelled.....");
                    }
                        break;
                }
            };
            
            [facebookController addImage:[UIImage imageNamed:@"sip.png"]];
            [facebookController setInitialText:@"Share Your Facebook Status with your Friends."];
            [facebookController addURL:[NSURL URLWithString:@"http://farasbee.com/"]];
            [facebookController setCompletionHandler:completionHandler];
            [self.viewController presentViewController:facebookController animated:YES completion:nil];
        }
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
