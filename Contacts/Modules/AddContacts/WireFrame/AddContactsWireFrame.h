//
// Created by Applicious
// Copyright (c) 2015 Applicious. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddContactsProtocols.h"
#import "AddContactsView.h"
#import "AddContactsLocalDataManager.h"
#import "AddContactsInteractor.h"
#import "AddContactsPresenter.h"
#import "AddContactsWireframe.h"
#import <UIKit/UIKit.h>

@interface AddContactsWireFrame : NSObject <AddContactsWireFrameProtocol>

@property (nonatomic, strong) AddContactsPresenter *presenter;
@property (nonatomic, strong) UIViewController<AddContactsViewProtocol> *view;

@end
