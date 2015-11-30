//
// Created by Applicious
// Copyright (c) 2015 Applicious. All rights reserved.
//

#import "AddContactsLocalDataManager.h"
#import "Datastore.h"
#import "PContact.h"
#import "Contact.h"

@implementation AddContactsLocalDataManager

- (void)addNewContact:(Contact *)contact
{
	PContact *pContact = [self.ds newContact];
	[pContact setFirstName:contact.firstName];
	[pContact setLastName:contact.lastName];
	[pContact setPhoneNumber:contact.phoneNumber];
	
	[self.ds save:pContact];
}


@end