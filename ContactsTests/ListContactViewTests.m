//
//  ListContactViewTests.m
//  Contacts
//
//  Created by Anand Singh on 12/1/15.
//  Copyright © 2015 Applicious. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "ListContactsView.h"
#import "Utilities.h"
#import "ListContactsPresenter.h"

@interface ListContactViewTests : XCTestCase

@property (nonatomic, strong) ListContactsView<ListContactsViewProtocol> *listContactsView;
@property (nonatomic, strong) id <ListContactsPresenterProtocol> presenter;

@end

@implementation ListContactViewTests

- (void)setUp {
    [super setUp];
	self.listContactsView = [[Utilities mainStoryboard] instantiateViewControllerWithIdentifier:@"ListContactsView"];
	self.presenter = OCMClassMock([ListContactsPresenter class]);
	[self.listContactsView setPresenter:self.presenter];
	
}

- (void)tearDown {
	self.listContactsView = nil;
	self.presenter = nil;
    [super tearDown];
}

- (void)testAddButtonAction {
	[self.listContactsView performSelector:@selector(addContactButtonAction:) withObject:nil];
	OCMVerify([self.presenter addNewContact]);
}

@end
