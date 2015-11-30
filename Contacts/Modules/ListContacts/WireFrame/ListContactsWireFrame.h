//
// Created by Applicious
// Copyright (c) 2015 Applicious. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListContactsProtocols.h"
#import "ListContactsView.h"
#import "ListContactsLocalDataManager.h"
#import "ListContactsInteractor.h"
#import "ListContactsPresenter.h"
#import "ListContactsWireframe.h"
#import "RootWireframe.h"
#import <UIKit/UIKit.h>

@class AddContactsWireFrame;
@class EditContactsWireFrame;
@protocol AddContactsWireFrameProtocol;

@interface ListContactsWireFrame : NSObject <ListContactsWireFrameProtocol>

@property (nonatomic, strong) RootWireframe *rootWireframe;
@property (nonatomic, strong) ListContactsPresenter *listcontactsPresenter;
@property (nonatomic, strong) AddContactsWireFrame<AddContactsWireFrameProtocol> *addContactsWireFrame;
@property (nonatomic, strong) UIViewController<ListContactsViewProtocol> *view;

@end
