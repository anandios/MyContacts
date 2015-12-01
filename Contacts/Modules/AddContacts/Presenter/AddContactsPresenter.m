//
// Created by Applicious
// Copyright (c) 2015 Applicious. All rights reserved.
//

#import "AddContactsPresenter.h"
#import "AddContactsWireframe.h"

@implementation AddContactsPresenter

- (void)cancelAddContactAction
{
	[self.wireFrame dismissAddContactView];
}

- (void)saveAddContactActionWithFirstName:(NSString *)firstName lastName:(NSString *)lastName phoneNumber:(NSString *)phoneNumber
{
	__weak typeof(self) weakSelf = self;
	[self.interactor saveNewContactWithFirstName:firstName lastName:lastName phoneNumber:phoneNumber withCompletionBlock:^(BOOL success) {
		if (success) {
			[weakSelf.wireFrame dismissAddContactView];
			//call add module delegate method as a callback
			[self.addModuleDelegate didSaveContactAction];
		}
	}];
}

- (void)invalidDataEntered
{
	[self.view presentInvalidDataAlert];
}

@end