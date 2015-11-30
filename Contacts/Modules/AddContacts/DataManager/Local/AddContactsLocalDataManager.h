//
// Created by Applicious
// Copyright (c) 2015 Applicious. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddContactsProtocols.h"
#import "DataManager.h"

@class Contact;

@interface AddContactsLocalDataManager : DataManager <AddContactsDataManagerInputProtocol>

- (void)addNewContact:(Contact *)contact;

@end