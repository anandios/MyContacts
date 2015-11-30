//
// Created by Applicious
// Copyright (c) 2015 Applicious. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddContactsProtocols.h"
#import "AddModuleDelegate.h"

@class AddContactsWireFrame;

@interface AddContactsPresenter : NSObject <AddContactsPresenterProtocol, AddContactsInteractorOutputProtocol>

@property (nonatomic, weak) id <AddContactsViewProtocol> view;
@property (nonatomic, strong) id <AddContactsInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <AddContactsWireFrameProtocol> wireFrame;
@property (nonatomic, weak) id <AddModuleDelegate> addModuleDelegate;

@end
