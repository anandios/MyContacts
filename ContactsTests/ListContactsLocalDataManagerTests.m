//
//  ListContactsLocalDataManagerTests.m
//  Contacts
//
//  Created by Anand Singh on 12/2/15.
//  Copyright © 2015 Applicious. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "ListContactsLocalDataManager.h"
#import "Datastore.h"
#import "PContact.h"
#import "Contact.h"

@interface ListContactsLocalDataManagerTests : XCTestCase

@end

@implementation ListContactsLocalDataManagerTests

- (void)testContactsForStringWithCompletionBlock {
	//Prepare for test
	Datastore *ds = [Datastore new];
	ListContactsLocalDataManager *sut = [[ListContactsLocalDataManager alloc] initWithDatastore:ds];
	 
	NSMutableArray *storage = [self getFakeStoreForTestWithDataStore:ds];
	[ds setValue:storage forKey:@"storage"];
	NSString *search = @"Anand";
	//Launch
	[sut contactsForString:search withCompletionBlock:^(NSArray *contacts) {
		Contact *contact = [contacts firstObject];
		//Test
		XCTAssertTrue(contacts.count == 1);
		XCTAssertTrue([contact.firstName isEqualToString:search]);
	}];
	search = @"+91";
	//Launch
	[sut contactsForString:search withCompletionBlock:^(NSArray *contacts) {
		Contact *contact = [contacts firstObject];
		//Test
		XCTAssertTrue(contacts.count == 1);
		XCTAssertTrue([contact.firstName isEqualToString:@"Aman"]);
	}];

}

- (void)testDeleteContactAtIndex {
	//Prepare for test
	Datastore *ds = OCMClassMock([Datastore class]);
	ListContactsLocalDataManager *sut = [[ListContactsLocalDataManager alloc] initWithDatastore:ds];
	void (^completionBlock)(NSArray *contacts) = ^void (NSArray *contacts) {};
	NSInteger indexToRemove = 7;
	[sut deleteContactAtIndex:indexToRemove withCompletionBlock:completionBlock];
	OCMVerify([ds removeContactAtIndex:indexToRemove completionBlock:completionBlock]);
}

#pragma mark - private

- (NSMutableArray *)getFakeStoreForTestWithDataStore:(Datastore *)ds {
	NSMutableArray *fakeStorage = [NSMutableArray new];
	PContact *contact1 = [ds newContact];
	[contact1 setFirstName:@"Anand"];
	[contact1 setLastName:@"Singh"];
	[contact1 setPhoneNumber:@"+4023424543"];
	[fakeStorage addObject:contact1];
	PContact *contact2 = [ds newContact];
	[contact2 setFirstName:@"Cristian"];
	[contact2 setLastName:@"Zifceac"];
	[contact2 setPhoneNumber:@"+4023443543"];
	[fakeStorage addObject:contact2];
	
	PContact *contact3 = [ds newContact];
	[contact2 setFirstName:@"Aman"];
	[contact2 setLastName:@"Azad"];
	[contact2 setPhoneNumber:@"+91276342734"];
	[fakeStorage addObject:contact3];
	
	return fakeStorage;
}

@end
