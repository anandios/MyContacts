//
//  AddContactsInteractorTests.m
//  Contacts
//
//  Created by Anand Singh on 12/2/15.
//  Copyright © 2015 Applicious. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "AddContactsInteractor.h"
#import "AddContactsPresenter.h"
#import "AddContactsLocalDataManager.h"

@interface AddContactsInteractorTests : XCTestCase

@property AddContactsInteractor *sut;
@property (nonatomic, weak) id <AddContactsInteractorOutputProtocol> presenter;
@property (nonatomic, strong) id <AddContactsDataManagerInputProtocol> localDataManager;

@end

@implementation AddContactsInteractorTests

- (void)setUp {
    [super setUp];
	self.sut = [AddContactsInteractor new];
	self.presenter = OCMClassMock([AddContactsPresenter class]);
	self.localDataManager = OCMClassMock([AddContactsLocalDataManager class]);
	[self.sut setPresenter:self.presenter];
	[self.sut setLocalDataManager:self.localDataManager];
}

- (void)tearDown {
	self.sut = nil;
	self.presenter = nil;
	self.localDataManager = nil;
    [super tearDown];
}

- (void)testSaveNewContactWithFirstName {
	
	[self.sut saveNewContactWithFirstName:@"Anand" lastName:@"S" phoneNumber:@"238748723" withCompletionBlock:^(BOOL success) {}];
	OCMVerify([self.localDataManager addNewContact:[OCMArg any]]);
	[self.sut saveNewContactWithFirstName:@"" lastName:@"S" phoneNumber:@"238748723" withCompletionBlock:^(BOOL success) {}];
	OCMVerify([self.presenter invalidDataEntered]);
	[self.sut saveNewContactWithFirstName:@"Anand" lastName:@"S" phoneNumber:@"askdkasadsjk" withCompletionBlock:^(BOOL success) {}];
	OCMVerify([self.presenter invalidDataEntered]);
}

@end
