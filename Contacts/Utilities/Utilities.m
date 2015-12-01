//
//  Utilities.m
//  Contacts
//
//  Created by Anand Singh on 11/30/15.
//  Copyright © 2015 Applicious. All rights reserved.
//

#import "Utilities.h"
#import <UIKIt/UIKit.h>

static NSString *const kMainStoryboard = @"Main";

@implementation Utilities

+ (void)makeCallOnNumber:(NSString *)number
{
	NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@", number]];
	[[UIApplication sharedApplication] openURL:phoneUrl];
}

+ (UIStoryboard *)mainStoryboard
{
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:kMainStoryboard
														 bundle:[NSBundle mainBundle]];
	
	return storyboard;
}

@end
