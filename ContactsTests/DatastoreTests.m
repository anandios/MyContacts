//
//  DatastoreTests.m
//  Contacts
//
//  Created by Anand Singh on 12/1/15.
//  Copyright © 2015 Applicious. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Datastore.h"
#import <OCMock/OCMock.h>
#import "PContact.h"

@interface NSArray (CompareArray)

- (void)compareWithArray:(NSArray *)arrayToCompareWith withCompletion:(void(^)(BOOL isSame))completionBlock;

@end

@implementation NSArray (CompareArray)

- (void)compareWithArray:(NSArray *)arrayToCompareWith withCompletion:(void(^)(BOOL isSame))completionBlock
{
	__block BOOL areArraysSame = YES;
	__weak typeof(self) weakSelf = self;
	[self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		areArraysSame = [obj isEqual:arrayToCompareWith[idx]];
		if (!areArraysSame) {
			*stop = YES;
		}
	}];
	completionBlock(areArraysSame);
}

@end

@interface DatastoreTests : XCTestCase

@property Datastore *ds;

@end

@implementation DatastoreTests

- (void)setUp {
	[super setUp];
	self.ds = [Datastore new];
}

- (void)tearDown {
	self.ds = nil;
    [super tearDown];
}

- (void)testNewContactMethod {
	PContact *contact = [self.ds newContact];
	XCTAssertNotNil(contact);
}

- (void)testSave {
	NSMutableArray *fakeStorage = OCMClassMock([NSMutableArray class]);
	[self.ds setValue:fakeStorage forKey:@"storage"];

	PContact *contact1 = [self.ds newContact];
	[self.ds save:contact1];
	OCMVerify([fakeStorage addObject:contact1]);
}

- (void)testFetchUsingPredicateAndSortDescriptor {
	NSMutableArray *fakeStorage = [self getFakeStoreForTest];
	[self.ds setValue:fakeStorage forKey:@"storage"];
	
	[self.ds fetchContactsWithPredicate:nil sortDescriptors:nil completionBlock:^(NSArray *result) {
		[result compareWithArray:fakeStorage withCompletion:^(BOOL isSame) {
			XCTAssertTrue(isSame);
		}];
	}];
	
	[self.ds fetchContactsWithPredicate:[NSPredicate predicateWithFormat:@"firstName = 'Anand'"]
						sortDescriptors:nil
						completionBlock:^(NSArray *result) {
							PContact *p = [result firstObject];
							XCTAssertTrue([p.firstName isEqualToString:@"Anand"]);
	}];
	
	[self.ds fetchContactsWithPredicate:[NSPredicate predicateWithFormat:@"firstName BEGINSWITH[c] %@", @"A"]
						sortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"firstName" ascending:YES]]
						completionBlock:^(NSArray *result) {
							XCTAssertTrue(result.count == 2);
							PContact *p = [result firstObject];
							XCTAssertTrue([p.firstName isEqualToString:@"Aman"]);
						}];
}

- (void)testRemove {
	NSMutableArray *fakeStorage = [self getFakeStoreForTest];
	[self.ds setValue:fakeStorage forKey:@"storage"];
	NSInteger indexOfObject = 1;
	id obj = fakeStorage[indexOfObject];
	[self.ds removeContactAtIndex:indexOfObject completionBlock:^(NSArray *result) {
		XCTAssertTrue(result.count == 2);
		//Check if correct object was remove and should not exist in store
		XCTAssertTrue(![fakeStorage containsObject:obj]);
	}];

}


#pragma mark - Private

- (NSMutableArray *)getFakeStoreForTest {
	NSMutableArray *fakeStorage = [NSMutableArray new];
	PContact *contact1 = [self.ds newContact];
	[contact1 setFirstName:@"Anand"];
	[contact1 setLastName:@"Singh"];
	[contact1 setPhoneNumber:@"+4023424543"];
	[fakeStorage addObject:contact1];
	PContact *contact2 = [self.ds newContact];
	[contact2 setFirstName:@"Cristian"];
	[contact2 setLastName:@"Zifceac"];
	[contact2 setPhoneNumber:@"+4023443543"];
	[fakeStorage addObject:contact2];

	PContact *contact3 = [self.ds newContact];
	[contact2 setFirstName:@"Aman"];
	[contact2 setLastName:@"Azad"];
	[contact2 setPhoneNumber:@"+91276342734"];
	[fakeStorage addObject:contact3];

	return fakeStorage;
}

@end
