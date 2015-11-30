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
	//call add module delegate method as a callback
	[self.addModuleDelegate didCancelAddContactAction];
}

- (void)saveAddContactActionWithFirstName:(NSString *)firstName lastName:(NSString *)lastName phoneNumber:(NSString *)phoneNumber
{
	[self.wireFrame dismissAddContactView];
	[self.interactor saveNewContactWithFirstName:firstName lastName:lastName phoneNumber:phoneNumber];
	//call add module delegate method as a callback
	[self.addModuleDelegate didSaveContactAction];
}

@end