//
// Created by Applicious
// Copyright (c) 2015 Applicious. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListContactsProtocols.h"
#import "ListContactsLocalDataManager.h"

@interface ListContactsInteractor : NSObject <ListContactsInteractorInputProtocol>

@property (nonatomic, weak) id <ListContactsInteractorOutputProtocol> presenter;

@property (nonatomic, strong) id <ListContactsDataManagerInputProtocol> localDataManager;
@property (nonatomic, weak) id<ListContactsInteractorOutputProtocol> output;

- (instancetype)initWithDataManager:(ListContactsLocalDataManager *)dataManager;

@end