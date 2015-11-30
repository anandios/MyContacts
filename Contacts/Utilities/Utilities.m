//
//  Utilities.m
//  Contacts
//
//  Created by Anand Singh on 11/30/15.
//  Copyright © 2015 Applicious. All rights reserved.
//

#import "Utilities.h"
#import <UIKIt/UIKit.h>

@implementation Utilities

+ (void)makeCallOnNumber:(NSString *)number
{
	NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@", number]];
	[[UIApplication sharedApplication] openURL:phoneUrl];
}

@end
