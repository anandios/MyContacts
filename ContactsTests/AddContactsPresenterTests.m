//
//  AddContactsPresenterTests.m
//  Contacts
//
//  Created by Anand Singh on 12/2/15.
//  Copyright © 2015 Applicious. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "AddContactsPresenter.h"
#import "AddContactsView.h"
#import "AddContactsInteractor.h"
#import "AddContactsWireFrame.h"
#import "ListContactsPresenter.h"

@interface AddContactsPresenterTests : XCTestCase

@property (nonatomic, weak) id <AddContactsViewProtocol> view;
@property (nonatomic, strong) id <AddContactsInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <AddContactsWireFrameProtocol> wireFrame;
@property (nonatomic, weak) id <AddModuleDelegate> addModuleDelegate;
@property (nonatomic, strong) AddContactsPresenter *sut;

@end

@implementation AddContactsPresenterTests

- (void)setUp {
    [super setUp];
	//System under test
	self.sut = [AddContactsPresenter new];
	//Instatiate the dependencies
	self.view = OCMClassMock([AddContactsView class]);
	self.interactor = OCMClassMock([AddContactsInteractor class]);
	self.wireFrame = OCMClassMock([AddContactsWireFrame class]);
	self.addModuleDelegate = OCMClassMock([ListContactsPresenter class]);
	//Wire them up
	[self.sut setView:self.view];
	[self.sut setInteractor:self.interactor];
	[self.sut setWireFrame:self.wireFrame];
	[self.sut setAddModuleDelegate:self.addModuleDelegate];
}

- (void)tearDown {
	self.sut = nil;
	//Instatiate the dependencies
	self.view = nil;
	self.interactor = nil;
	self.wireFrame = nil;
	self.addModuleDelegate = nil;
	[super tearDown];
}

- (void)testCancelAddAction {
	[self.sut cancelAddContactAction];
	OCMVerify([self.wireFrame dismissAddContactView]);
}

- (void)testSaveAddContactAction {
	OCMStub([self.interactor saveNewContactWithFirstName:[OCMArg any]
												lastName:[OCMArg any]
											 phoneNumber:[OCMArg any]
									 withCompletionBlock:[OCMArg any]]).andDo(^(NSInvocation *invocation) {
		//Completion block signature
		void (^completionBlock)(BOOL success);
		//Capture the completionBlock reference
		[invocation getArgument:&completionBlock atIndex:5];
		completionBlock(YES);
	});
	[self.sut saveAddContactActionWithFirstName:@"Anand" lastName:@"Singh" phoneNumber:@"287348"];
	OCMVerify([self.wireFrame dismissAddContactView]);
	OCMVerify([self.addModuleDelegate didSaveContactAction]);
}

- (void)testInvalidDataEntered {
	[self.sut invalidDataEntered];
	OCMVerify([self.view presentInvalidDataAlert]);
}

@end
