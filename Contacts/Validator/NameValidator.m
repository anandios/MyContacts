//
//  NameValidator.m
//  Contacts
//
//  Created by Anand Singh on 12/1/15.
//  Copyright © 2015 Applicious. All rights reserved.
//

#import "NameValidator.h"

@implementation NameValidator

- (BOOL)validate:(NSString *)string
{
	return string && [string length] > 0;
}

@end
