//
//  DataManager.h
//  Contacts
//
//  Created by Anand Singh on 11/30/15.
//  Copyright © 2015 Applicious. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Datastore;

@interface DataManager : NSObject

@property (nonatomic, strong, readonly) Datastore *ds;

- (instancetype)initWithDatastore:(Datastore *)datastore;

@end
