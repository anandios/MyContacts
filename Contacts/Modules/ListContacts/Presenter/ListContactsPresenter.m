//
// Created by Applicious
// Copyright (c) 2015 Applicious. All rights reserved.
//

#import "ListContactsPresenter.h"
#import "ListContactsWireframe.h"

@implementation ListContactsPresenter

#pragma mark - ListContactsPresenterProtocol methods

- (void)addNewContact
{
	[self.wireFrame presentAddContactView];
}

- (void)updateContactList
{
	[self.interactor findContacts];
}

- (void)deleteContactAtIndex:(NSInteger)index
{
	[self.interactor removeContactAtIndex:index];
}

#pragma mark - ListContactsInteractorOutputProtocol methods

- (void)foundContacts:(NSArray *)contacts
{
	if ([contacts count] > 0) {
		[self.view showContactsUsingArray:contacts];
	} else {
		[self.view showNoContactsMessage];
	}
	[self.view updateTitle];
}


#pragma mark - Add Module Delegate methods

- (void)didCancelAddContactAction
{
	//TODO:
}

- (void)didSaveContactAction
{
	[self updateContactList];
}

@end