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
@property (nonatomic, strong) id <ListContactsPresenterProtocol, AddModuleDelegate> presenter;

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

- (void)testDeleteAction {
	SEL selector = @selector(tableView:commitEditingStyle:forRowAtIndexPath:);
	NSInvocation *anInvocation = [NSInvocation invocationWithMethodSignature:[ListContactsView instanceMethodSignatureForSelector:selector]];
	[anInvocation setSelector:selector];
	[anInvocation setTarget:self.listContactsView];
	UITableViewCellEditingStyle style = UITableViewCellEditingStyleDelete;
	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:5 inSection:0];
	[anInvocation setArgument:&style atIndex:3];
	[anInvocation setArgument:&indexPath atIndex:4];
	[anInvocation invokeWithTarget:self.listContactsView];
	
	OCMVerify([self.presenter deleteContactAtIndex:5]);
	OCMVerify([self.listContactsView reloadContacts]);
	OCMVerify([self.listContactsView updateTitle]);
}

- (void)testUpdateListCallAfterSaving
{
	[self.presenter didSaveContactAction];//Fake call, normally this will be called by AddModuleDelegate
	OCMStub([self.presenter didSaveContactAction]);
	OCMVerify([self.listContactsView updateTitle]);
}

@end
