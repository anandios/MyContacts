//
// Created by Applicious
// Copyright (c) 2015 Applicious. All rights reserved.
//

#import "AddContactsInteractor.h"
#import "AddContactsLocalDataManager.h"
#import "Contact.h"

@interface AddContactsInteractor ()


@end

@implementation AddContactsInteractor
@synthesize presenter, localDataManager;

- (instancetype)initWithDataManager:(AddContactsLocalDataManager *)dataManager
{
	if (self = [super init]) {
		self.localDataManager = dataManager;
	}
	
	return self;
}

- (void)saveNewContactWithFirstName:(NSString *)firstName lastName:(NSString *)lastName phoneNumber:(NSString *)phoneNumber
{
	Contact *newContact = [Contact new];
	[newContact setFirstName:firstName];
	[newContact setLastName:lastName];
	[newContact setPhoneNumber:phoneNumber];
	[self.localDataManager addNewContact:newContact];
}

- (void)removeContact:(Contact *)contact
{
	
}

@end