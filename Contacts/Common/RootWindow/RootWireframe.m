//
//  RootWireframe.m
//  Contacts
//
//  Created by Anand Singh on 11/30/15.
//  Copyright © 2015 Applicious. All rights reserved.
//

#import "RootWireframe.h"

@implementation RootWireframe

- (void)showRootViewController:(UIViewController *)viewController InWindow:(UIWindow *)window
{
	UINavigationController *navigationController = [self navigationControllerFromWindow:window];
	navigationController.viewControllers = @[viewController];
}

#pragma mark - Private 

- (UINavigationController *)navigationControllerFromWindow:(UIWindow *)window
{
	return (UINavigationController *)[window rootViewController];
}

@end
