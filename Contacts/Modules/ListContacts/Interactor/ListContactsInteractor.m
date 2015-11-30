//
// Created by Applicious
// Copyright (c) 2015 Applicious. All rights reserved.
//

#import "ListContactsInteractor.h"

@interface ListContactsInteractor ()


@end

@implementation ListContactsInteractor
@synthesize localDataManager;

- (instancetype)initWithDataManager:(ListContactsLocalDataManager *)dataManager
{
	if (self = [super init]) {
		self.localDataManager = dataManager;
	}
	
	return self;
}

#pragma mark - ListContactsInteractorInputProtocol method

- (void)findContacts
{
	__weak typeof(self) weakSelf = self;
	[self.localDataManager contactsForString:nil withCompletionBlock:^(NSArray *contacts) {
		[weakSelf.output foundContacts:contacts];
	}];
}

- (void)removeContactAtIndex:(NSInteger)index
{
	__weak typeof(self) weakSelf = self;
	[self.localDataManager deleteContactAtIndex:index withCompletionBlock:^(NSArray *contacts) {
		[weakSelf.output foundContacts:contacts];
	}];
}

@end