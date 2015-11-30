//
// Created by Applicious
// Copyright (c) 2015 Applicious. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ListContactsInteractorOutputProtocol;
@protocol ListContactsInteractorInputProtocol;
@protocol ListContactsViewProtocol;
@protocol ListContactsPresenterProtocol;
@protocol ListContactsDataManagerInputProtocol;

@class ListContactsWireFrame;

/**
 * Add here your methods for communication PRESENTER -> VIEWCONTROLLER
 */
@protocol ListContactsViewProtocol
@required
@property (nonatomic, strong) id <ListContactsPresenterProtocol> presenter;

- (void)showNoContactsMessage;
- (void)showContactsUsingArray:(NSArray *)contactsArray;
- (void)reloadContacts;
- (void)updateTitle;

@end

/**
 * Add here your methods for communication PRESENTER -> WIREFRAME
 */
@protocol ListContactsWireFrameProtocol
@required

- (void)presentListContactInterfaceFromWindow:(UIWindow *)window;
- (void)presentAddContactView;

@end

/**
 * Add here your methods for communication VIEWCONTROLLER -> PRESENTER
 */
@protocol ListContactsPresenterProtocol
@required
@property (nonatomic, weak) id <ListContactsViewProtocol> view;
@property (nonatomic, strong) id <ListContactsInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <ListContactsWireFrameProtocol> wireFrame;

- (void)addNewContact;
- (void)updateContactList;
- (void)deleteContactAtIndex:(NSInteger)index;

@end

/**
 * Add here your methods for communication INTERACTOR -> PRESENTER
 */
@protocol ListContactsInteractorOutputProtocol
- (void)foundContacts:(NSArray *)contacts;

@end

/**
 * Add here your methods for communication PRESENTER -> INTERACTOR
 */
@protocol ListContactsInteractorInputProtocol
@required
@property (nonatomic, weak) id <ListContactsInteractorOutputProtocol> presenter;
@property (nonatomic, strong) id <ListContactsDataManagerInputProtocol> localDataManager;

- (void)findContacts;
- (void)removeContactAtIndex:(NSInteger)index;

@end

/**
 * Add here your methods for communication INTERACTOR -> DATAMANAGER
 */
@protocol ListContactsDataManagerInputProtocol

- (void)contactsForString:(NSString *)searchString withCompletionBlock:(void (^)(NSArray *contacts))completionBlock;
- (void)deleteContactAtIndex:(NSInteger)index withCompletionBlock:(void (^)(NSArray *contacts))completionBlock;

@end