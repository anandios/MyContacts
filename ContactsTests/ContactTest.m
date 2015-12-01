//
//  ContactTest.m
//  Contacts
//
//  Created by Anand Singh on 12/1/15.
//  Copyright © 2015 Applicious. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Contact.h"

@interface ContactTest : XCTestCase

@end

@implementation ContactTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testContactStaticConstructor
{
	Contact *sut = [Contact contactWithFirstName:@"Anand" lastName:@"Singh" phoneNumber:@"+40743237323"];
	XCTAssertTrue([sut.firstName isEqualToString:@"Anand"]);
	XCTAssertTrue([sut.lastName isEqualToString:@"Singh"]);
	XCTAssertTrue([sut.phoneNumber isEqualToString:@"+40743237323"]);
}

@end
