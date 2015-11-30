//
//  ContactsTests.m
//  ContactsTests
//
//  Created by Anand Singh on 11/30/15.
//  Copyright © 2015 Applicious. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Utilities.h"

@interface UtilitiesTests : XCTestCase

@end

@implementation UtilitiesTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAValidPhoneNumberSuccess {
	XCTAssertTrue([Utilities isValidPhoneNumber:@"+919827716208"], @"Validation is broken");
	XCTAssertTrue([Utilities isValidPhoneNumber:@"0040743237323"], @"Validation is broken");
}

- (void)testAValidPhoneNumberFail {
	XCTAssertFalse([Utilities isValidPhoneNumber:@"asdadasdasdad"], @"Validation is broken");
	XCTAssertFalse([Utilities isValidPhoneNumber:@"0040743237323asd"], @"Validation is broken");
}

@end
