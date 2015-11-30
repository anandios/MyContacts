//
//  Contact.m
//  Contacts
//
//  Created by Anand Singh on 11/30/15.
//  Copyright © 2015 Applicious. All rights reserved.
//

#import "Contact.h"

@implementation Contact

+ (instancetype)contactWithFirstName:(NSString *)firstName lastName:(NSString *)lastName phoneNumber:(NSString *)phoneNumber
{
	Contact *newContact = [Contact new];
	[newContact setFirstName:firstName];
	[newContact setLastName:lastName];
	[newContact setPhoneNumber:phoneNumber];
	
	return newContact;
}

@end
