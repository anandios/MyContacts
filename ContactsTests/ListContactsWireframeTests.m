//
//  ListContactsWireframeTests.m
//  Contacts
//
//  Created by Anand Singh on 12/2/15.
//  Copyright © 2015 Applicious. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "ListContactsWireFrame.h"
#import "ListContactsPresenter.h"
#import "AddContactsWireFrame.h"
#import "ListContactsView.h"

@interface ListContactsWireframeTests : XCTestCase

@property ListContactsWireFrame *sut;

@property (nonatomic, strong) RootWireframe *rootWireframe;
@property (nonatomic, strong) ListContactsPresenter *listcontactsPresenter;
@property (nonatomic, strong) AddContactsWireFrame<AddContactsWireFrameProtocol> *addContactsWireFrame;
@property (nonatomic, strong) UIViewController<ListContactsViewProtocol> *view;


@end

@implementation ListContactsWireframeTests

- (void)setUp {
    [super setUp];
	self.sut = [ListContactsWireFrame new];
	//Dependencies
	self.rootWireframe = [RootWireframe new];
	//Mock the dependencies
	self.rootWireframe = OCMClassMock([RootWireframe class]);
	self.listcontactsPresenter = OCMClassMock([ListContactsPresenter class]);
	self.addContactsWireFrame = OCMClassMock([AddContactsWireFrame class]);
	self.view = OCMClassMock([ListContactsView class]);
	//Inject dependencies
	[self.sut setAddContactsWireFrame:self.addContactsWireFrame];
	[self.sut setRootWireframe:self.rootWireframe];
	[self.sut setListcontactsPresenter:self.listcontactsPresenter];
	[self.sut setRootWireframe:self.rootWireframe];
	[self.sut setView:self.view];
}

- (void)tearDown {
	self.sut = nil;
	self.rootWireframe = nil;
	self.listcontactsPresenter = nil;
	self.addContactsWireFrame = nil;
	self.view = nil;
	[super tearDown];
}

- (void)testPresentAddContactView {
	[self.sut presentAddContactView];
	OCMVerify([self.addContactsWireFrame presentAddContactModuleFrom:self.view]);
}

- (void)testPresentListContactInterfaceFromWindow {
	[self.sut presentListContactInterfaceFromWindow:[UIWindow new]];
	OCMVerify([self.sut setView:self.view]);
	OCMVerify([self.listcontactsPresenter setView:[OCMArg any]]);
	OCMVerify([self.rootWireframe showRootViewController:[OCMArg any] InWindow:[OCMArg any]]);
}

@end
