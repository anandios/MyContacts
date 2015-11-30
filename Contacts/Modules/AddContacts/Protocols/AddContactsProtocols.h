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

@protocol AddContactsViewProtocol
@required
@property (nonatomic, strong) id <AddContactsPresenterProtocol> presenter;
/**
 * Add here your methods for communication PRESENTER -> VIEWCONTROLLER
 */

@end

/**
 * Add here your methods for communication PRESENTER -> WIREFRAME
 */
@protocol AddContactsWireFrameProtocol
@required

- (void)presentAddContactModuleFrom:(id)fromView;
- (void)dismissAddContactView;

@end

@class Contact;
@protocol AddContactsPresenterProtocol
@required
@property (nonatomic, weak) id <AddContactsViewProtocol> view;
@property (nonatomic, strong) id <AddContactsInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <AddContactsWireFrameProtocol> wireFrame;
/**
 * Add here your methods for communication VIEWCONTROLLER -> PRESENTER
 */

- (void)cancelAddContactAction;
- (void)saveAddContactActionWithFirstName:(NSString *)firstName lastName:(NSString *)lastName phoneNumber:(NSString *)phoneNumber;

@end

@protocol AddContactsInteractorOutputProtocol
/**
 * Add here your methods for communication INTERACTOR -> PRESENTER
 */
@end

@protocol AddContactsDataManagerInputProtocol;
@class Contact;
@protocol AddContactsInteractorInputProtocol
@required
@property (nonatomic, weak) id <AddContactsInteractorOutputProtocol> presenter;
@property (nonatomic, strong) id <AddContactsDataManagerInputProtocol> localDataManager;
/**
 * Add here your methods for communication PRESENTER -> INTERACTOR
 */
- (void)saveNewContactWithFirstName:(NSString *)firstName lastName:(NSString *)lastName phoneNumber:(NSString *)phoneNumber;

@end

@class Contact;
@protocol AddContactsDataManagerInputProtocol
/**
 * Add here your methods for communication INTERACTOR -> DATAMANAGER
 */
- (void)addNewContact:(Contact *)contact;

@end

