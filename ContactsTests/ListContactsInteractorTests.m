//
//  ListContactsInteractorTests.m
//  Contacts
//
//  Created by Anand Singh on 12/1/15.
//  Copyright © 2015 Applicious. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "ListContactsInteractor.h"
#import "ListContactsPresenter.h"
#import "ListContactsLocalDataManager.h"

@interface ListContactsInteractorTests : XCTestCase

@property ListContactsInteractor *sut;
@property id<ListContactsInteractorOutputProtocol> presenter;
@property id <ListContactsDataManagerInputProtocol> dataManager;

@end

@implementation ListContactsInteractorTests

- (void)setUp {
    [super setUp];
	self.sut = [ListContactsInteractor new];
	//Mocking the dependencies
	self.presenter = OCMClassMock([ListContactsPresenter class]);
	self.dataManager = OCMClassMock([ListContactsLocalDataManager class]);
	//Wire things up
	[self.sut setPresenter:self.presenter];
	[self.sut setLocalDataManager:self.dataManager];
}

- (void)tearDown {
	self.sut = nil;
	self.presenter = nil;
	self.dataManager = nil;
	[super tearDown];
}

- (void)testFindContacts {
	//Prepare for the test
	NSArray *someArray = @[@"strObj1", @"strObj2"];
	OCMStub([self.dataManager contactsForString:[OCMArg any] withCompletionBlock:[OCMArg any]]).andDo(^(NSInvocation *invocation) {
		//Completion block signature
		void (^completionBlock)(NSArray *contacts);
		//Capture the completionBlock reference
		[invocation getArgument:&completionBlock atIndex:3];
		//Invoke the captured success block with fake result
		completionBlock(someArray);
	});
	//Launch
	[self.sut findContacts];
	//Test
	OCMVerify([self.presenter foundContacts:someArray]);
}

- (void)testRemoveContact {
	//Prepare for the test
	NSMutableArray *someArray = [NSMutableArray arrayWithArray:@[@"strObj1", @"strObj2", @"strObj3"]];
	NSInteger indexToRemove = 1;
	OCMStub([self.dataManager deleteContactAtIndex:indexToRemove withCompletionBlock:[OCMArg any]]).andDo(^(NSInvocation *invocation) {
		//Completion block signature
		void (^completionBlock)(NSArray *contacts);
		//Capture the completionBlock reference
		[invocation getArgument:&completionBlock atIndex:3];
		//Invoke the captured success block with fake result
		[someArray removeObjectAtIndex:indexToRemove];
		completionBlock(someArray);
	});
	//Launch
	[self.sut removeContactAtIndex:indexToRemove];
	//Test
	OCMVerify([self.presenter foundContacts:someArray]);	
}

@end
