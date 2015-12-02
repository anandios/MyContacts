//
//  Datastore.h
//  Contacts
//
//  Created by Anand Singh on 11/30/15.
//  Copyright © 2015 Applicious. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PContact;

@interface Datastore : NSObject

//This method will return a new object which can be changed to be persisted
- (PContact *)newContact;
//This method will have to be changed for persistance will be implemented
- (void)save:(PContact *)contact;
- (void)fetchContactsWithPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors completionBlock:(void (^)(NSArray *result))completionBlock;
- (void)removeContactAtIndex:(NSInteger)index completionBlock:(void (^)(NSArray *result))completionBlock;

@end
