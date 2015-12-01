//
//  Datastore.m
//  Contacts
//
//  Created by Anand Singh on 11/30/15.
//  Copyright © 2015 Applicious. All rights reserved.
//

#import "Datastore.h"
#import "PContact.h"

@interface Datastore ()

@property (nonatomic, strong) NSMutableArray *storage;

@end

@implementation Datastore

- (instancetype)init {
	if (self = [super init]) {
		self.storage = [NSMutableArray new];
	}
	return self;
}

- (PContact *)newContact
{
	return [PContact new];
}

- (void)save:(PContact *)contact
{
	[self.storage addObject:contact];
}

- (void)fetchContactsWithPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors completionBlock:(void (^)(NSArray *result))completionBlock
{
	NSArray *result = self.storage;
	if (predicate) {
		result = [self.storage filteredArrayUsingPredicate:predicate];
	}
	
	if (sortDescriptors) {
		result = [result sortedArrayUsingDescriptors:sortDescriptors];
	}
	
	completionBlock(result);
}

- (void)removeContactAtIndex:(NSInteger)index completionBlock:(void (^)(NSArray *result))completionBlock;
{
	if (index > -1) {
		[self.storage removeObjectAtIndex:index];
	}
	if (completionBlock) {
		completionBlock(self.storage);
	}
}

@end

