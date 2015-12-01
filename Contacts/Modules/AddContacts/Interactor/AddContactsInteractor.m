//
// Created by Applicious
// Copyright (c) 2015 Applicious. All rights reserved.
//

#import "AddContactsInteractor.h"
#import "AddContactsLocalDataManager.h"
#import "Contact.h"
#import "NameValidator.h"
#import "PhoneNumberValidator.h"

@implementation AddContactsInteractor
@synthesize presenter, localDataManager;

- (instancetype)initWithDataManager:(AddContactsLocalDataManager *)dataManager
{
	if (self = [super init]) {
		self.localDataManager = dataManager;
	}
	
	return self;
}

- (void)saveNewContactWithFirstName:(NSString *)firstName lastName:(NSString *)lastName phoneNumber:(NSString *)phoneNumber withCompletionBlock:(void (^)(BOOL success))completionBlock
{
	BOOL validationSuccessful = [self isDataValid:firstName lastName:phoneNumber];

	if (validationSuccessful) {
		Contact *newContact = [Contact new];
		[newContact setFirstName:firstName];
		[newContact setLastName:lastName];
		[newContact setPhoneNumber:phoneNumber];
		[self.localDataManager addNewContact:newContact];
	} else {
		[self.presenter invalidDataEntered];
	}
	
	completionBlock(validationSuccessful);
}

- (BOOL)isDataValid:(NSString *)firstName lastName:(NSString *)phone
{
	NameValidator *nameValidator = [NameValidator new];
	PhoneNumberValidator *phValidator = [PhoneNumberValidator new];
	
	return [nameValidator validate:firstName] && [phValidator validate:phone];
}

@end