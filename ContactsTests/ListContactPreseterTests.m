//
//  ListContactPreseterTests.m
//  Contacts
//
//  Created by Anand Singh on 12/1/15.
//  Copyright © 2015 Applicious. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "ListContactsPresenter.h"
#import "ListContactsInteractor.h"
#import "ListContactsWireFrame.h"
#import "ListContactsView.h"

@interface ListContactPreseterTests : XCTestCase

@property ListContactsPresenter *sut;
@property ListContactsInteractor *interactor;
@property ListContactsWireFrame *wireframe;
@property ListContactsView<ListContactsViewProtocol> *view;


@end

@implementation ListContactPreseterTests

- (void)setUp {
    [super setUp];
	//Object that needs to be tested
	self.sut = [ListContactsPresenter new];
	//Mocking dependencies
	self.interactor = OCMClassMock([ListContactsInteractor class]);
	self.wireframe = OCMClassMock([ListContactsWireFrame class]);
	self.view = OCMClassMock([ListContactsView class]);
	//Injecting dependencies
	[self.sut setInteractor:self.interactor];
	[self.sut setWireFrame:self.wireframe];
	[self.sut setView:self.view];
}

- (void)tearDown {
	self.sut = nil;
	self.view = nil;
	self.interactor = nil;
	self.wireframe = nil;
    [super tearDown];
}

- (void)testAddContact {
	[self.sut addNewContact];
	OCMVerify([self.wireframe presentAddContactView]);
}

- (void)testUpdateContactList {
	[self.sut updateContactList];
	OCMVerify([self.interactor findContacts]);
}

- (void)testDeleteContact {
	[self.sut deleteContactAtIndex:7];
	OCMVerify([self.interactor removeContactAtIndex:7]);
}

- (void)testFoundContacts {
	NSArray *fakeContacts = nil;
	[self.sut foundContacts:fakeContacts];
	OCMVerify([self.view showNoContactsMessage]);
	fakeContacts = @[@"fakeContact1", @"fakeContact2"];
	[self.sut foundContacts:fakeContacts];
	OCMVerify([self.view showContactsUsingArray:fakeContacts]);
	OCMVerify([self.view updateTitle]);
	OCMVerify([self.view reloadContacts]);
}

- (void)testDidSaveContactAction {
	[self.sut didSaveContactAction];
	OCMVerify([self.interactor findContacts]);
}

@end
