//
//  ContactsTests.m
//  ContactsTests
//
//  Created by Anand Singh on 11/30/15.
//  Copyright © 2015 Applicious. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PhoneNumberValidator.h"
#import "NameValidator.h"

@interface ValidatorsTests : XCTestCase

@end

@implementation ValidatorsTests


- (void)testAValidPhoneNumberSuccess {
	PhoneNumberValidator *phValidator = [PhoneNumberValidator new];
	XCTAssertTrue([phValidator validate:@"+919827716208"], @"Validation is broken");
	XCTAssertTrue([phValidator validate:@"0040743237323"], @"Validation is broken");
}

- (void)testAValidPhoneNumberFail {
	PhoneNumberValidator *phValidator = [PhoneNumberValidator new];
	XCTAssertFalse([phValidator validate:@"asdadasdasdad"], @"Validation is broken");
	XCTAssertFalse([phValidator validate:@"0040743237323asd"], @"Validation is broken");
}

- (void)testAValidFirstName {
	NameValidator *nv = [NameValidator new];
	XCTAssertTrue([nv validate:@"aasd"], @"Validation is broken");
	XCTAssertTrue([nv validate:@"a"], @"Validation is broken");
}

- (void)testAInvalidFirstName {
	NameValidator *nv = [NameValidator new];
	XCTAssertFalse([nv validate:@""], @"Validation is broken");
}

@end
