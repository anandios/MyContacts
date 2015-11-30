//
//  PContact.h
//  Contacts
//
//  Created by Anand Singh on 11/30/15.
//  Copyright © 2015 Applicious. All rights reserved.
//

#import <Foundation/Foundation.h>

//This can be persisted in future (Coredata, SQLite etc.)

@interface PContact : NSObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *phoneNumber;

@end
