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
		[self.view updateTitle];
	} else {
		[self.view showNoContactsMessage];
	}
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

- (void)didDeleteContactAction
{
	[self updateContactList];
}

@end