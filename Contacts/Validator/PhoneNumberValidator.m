//
//  PhoneNumberValidator.m
//  Contacts
//
//  Created by Anand Singh on 12/1/15.
//  Copyright © 2015 Applicious. All rights reserved.
//

#import "PhoneNumberValidator.h"

@implementation PhoneNumberValidator

- (BOOL)validate:(NSString *)string
{
	NSDataDetector *phoneNumberDetector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypePhoneNumber error:nil];
	NSUInteger matches = [phoneNumberDetector numberOfMatchesInString:string options:0 range:NSMakeRange(0, string.length)];
	
	return matches > 0;

}

@end
