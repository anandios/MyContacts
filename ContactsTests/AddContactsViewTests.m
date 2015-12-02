//
//  AddContactsViewTests.m
//  Contacts
//
//  Created by Anand Singh on 12/2/15.
//  Copyright © 2015 Applicious. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "AddContactsView.h"
#import "AddContactsPresenter.h"
#import "Utilities.h"

@interface AddContactsViewTests : XCTestCase

@property AddContactsView<AddContactsPresenterProtocol> *sut;
@property id <AddContactsPresenterProtocol> presenter;

@end

@implementation AddContactsViewTests

- (void)setUp {
    [super setUp];
	self.sut = [[Utilities mainStoryboard] instantiateViewControllerWithIdentifier:@"AddContactsView"];
	self.presenter = OCMClassMock([AddContactsPresenter class]);
	[self.sut setPresenter:self.presenter];
}

- (void)tearDown {
	self.sut = nil;
	self.presenter = nil;
	[super tearDown];
}

- (void)testSaveButtonAction {
	[self.sut performSelector:@selector(saveButtonAction:) withObject:nil];
//	[self.sut performSelector:@selector(saveButtonAction:) Object:nil];
	OCMVerify([self.presenter saveAddContactActionWithFirstName:[OCMArg any]
														lastName:[OCMArg any]
													 phoneNumber:[OCMArg any]]);
}

@end
