//
// Created by Applicious
// Copyright (c) 2015 Applicious. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddContactsProtocols.h"

@class AddContactsLocalDataManager;

@interface AddContactsInteractor : NSObject <AddContactsInteractorInputProtocol>

@property (nonatomic, weak) id <AddContactsInteractorOutputProtocol> presenter;
@property (nonatomic, strong) id <AddContactsDataManagerInputProtocol> localDataManager;

- (instancetype)initWithDataManager:(AddContactsLocalDataManager *)dataManager;

@end