//
// Created by Applicious
// Copyright (c) 2015 Applicious. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol AddContactsInteractorOutputProtocol;
@protocol AddContactsInteractorInputProtocol;
@protocol AddContactsViewProtocol;
@protocol AddContactsPresenterProtocol;
@protocol AddContactsDataManagerInputProtocol;

@class AddContactsWireFrame;

/**
 * Add here your methods for communication PRESENTER -> VIEWCONTROLLER
 */
@protocol AddContactsViewProtocol
@required
@property (nonatomic, strong) id <AddContactsPresenterProtocol> presenter;

- (void)presentInvalidDataAlert;

@end

/**
 * Add here your methods for communication PRESENTER -> WIREFRAME
 */
@protocol AddContactsWireFrameProtocol
@required

- (void)presentAddContactModuleFrom:(id)fromView;
- (void)dismissAddContactView;

@end

/**
 * Add here your methods for communication VIEWCONTROLLER -> PRESENTER
 */
@protocol AddContactsPresenterProtocol
@required
@property (nonatomic, weak) id <AddContactsViewProtocol> view;
@property (nonatomic, strong) id <AddContactsInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <AddContactsWireFrameProtocol> wireFrame;

- (void)cancelAddContactAction;
- (void)saveAddContactActionWithFirstName:(NSString *)firstName lastName:(NSString *)lastName phoneNumber:(NSString *)phoneNumber;

@end

/**
 * Add here your methods for communication INTERACTOR -> PRESENTER
 */
@protocol AddContactsInteractorOutputProtocol

- (void)invalidDataEntered;

@end

/**
 * Add here your methods for communication PRESENTER -> INTERACTOR
 */
@protocol AddContactsDataManagerInputProtocol;

@protocol AddContactsInteractorInputProtocol
@required
@property (nonatomic, weak) id <AddContactsInteractorOutputProtocol> presenter;
@property (nonatomic, strong) id <AddContactsDataManagerInputProtocol> localDataManager;

- (void)saveNewContactWithFirstName:(NSString *)firstName lastName:(NSString *)lastName phoneNumber:(NSString *)phoneNumber withCompletionBlock:(void (^)(BOOL success))completionBlock;

@end

/**
 * Add here your methods for communication INTERACTOR -> DATAMANAGER
 */
@class Contact;
@protocol AddContactsDataManagerInputProtocol

- (void)addNewContact:(Contact *)contact;

@end

