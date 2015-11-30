//
// Created by Applicious
// Copyright (c) 2015 Applicious. All rights reserved.
//

#import "ListContactsLocalDataManager.h"
#import "Datastore.h"
#import "Contact.h"
#import "PContact.h"

@implementation ListContactsLocalDataManager

- (void)contactsForString:(NSString *)searchString withCompletionBlock:(void (^)(NSArray *contacts))completionBlock
{
	__weak typeof(self) weakSelf = self;
	[weakSelf.ds fetchContactsWithPredicate:nil sortDescriptors:nil completionBlock:^(NSArray *result) {
		completionBlock([self contactsFromDatastoreEntries:result]);
	}];
}

- (NSArray *)contactsFromDatastoreEntries:(NSArray *)entries
{
	__block NSMutableArray *finalResult = [NSMutableArray new];
	[entries enumerateObjectsUsingBlock:^(PContact *pContact, NSUInteger idx, BOOL * _Nonnull stop) {
		Contact *contact = [Contact contactWithFirstName:pContact.firstName lastName:pContact.lastName phoneNumber:pContact.phoneNumber];
		[finalResult addObject:contact];
	}];
	
	return finalResult;
}

- (void)deleteContactAtIndex:(NSInteger)index withCompletionBlock:(void (^)(NSArray *contacts))completionBlock
{
	[self.ds removeContactAtIndex:index completionBlock:completionBlock];
}

@end