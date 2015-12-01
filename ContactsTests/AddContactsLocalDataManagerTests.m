//
//  AddContactsLocalDataManagerTests.m
//  Contacts
//
//  Created by Anand Singh on 12/2/15.
//  Copyright © 2015 Applicious. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "Datastore.h"
#import "Contact.h"
#import "AddContactsLocalDataManager.h"

@interface AddContactsLocalDataManagerTests : XCTestCase

@end

@implementation AddContactsLocalDataManagerTests

- (void)testAddContact {
	Datastore *ds = OCMClassMock([Datastore class]);
	AddContactsLocalDataManager *dm = [[AddContactsLocalDataManager alloc] initWithDatastore:ds];
	Contact *contact = [Contact contactWithFirstName:@"A" lastName:@"R" phoneNumber:@"283482347"];
	[dm addNewContact:contact];
	OCMVerify([ds newContact]);
	OCMVerify([ds save:[OCMArg any]]);
}

@end
