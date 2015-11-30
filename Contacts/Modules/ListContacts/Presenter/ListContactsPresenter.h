//
// Created by Applicious
// Copyright (c) 2015 Applicious. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListContactsProtocols.h"
#import "AddModuleDelegate.h"

@class ListContactsWireFrame;

@interface ListContactsPresenter : NSObject <ListContactsPresenterProtocol, ListContactsInteractorOutputProtocol, AddModuleDelegate>

@property (nonatomic, weak) id <ListContactsViewProtocol> view;
@property (nonatomic, strong) id <ListContactsInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <ListContactsWireFrameProtocol> wireFrame;

@end
