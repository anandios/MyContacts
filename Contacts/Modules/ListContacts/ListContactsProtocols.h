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

@protocol ListContactsViewProtocol
@required
@property (nonatomic, strong) id <ListContactsPresenterProtocol> presenter;
/**
 * Add here your methods for communication PRESENTER -> VIEWCONTROLLER
 */

- (void)showNoContactsMessage;
- (void)showContactsUsingArray:(NSArray *)contactsArray;
- (void)reloadContacts;
- (void)updateTitle;

@end

@protocol ListContactsWireFrameProtocol
//@required
- (void)presentListContactInterfaceFromWindow:(UIWindow *)window;
- (void)presentAddContactView;
/**
 * Add here your methods for communication PRESENTER -> WIREFRAME
 */

@end

@protocol ListContactsPresenterProtocol
@required
@property (nonatomic, weak) id <ListContactsViewProtocol> view;
@property (nonatomic, strong) id <ListContactsInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <ListContactsWireFrameProtocol> wireFrame;
/**
 * Add here your methods for communication VIEWCONTROLLER -> PRESENTER
 */
- (void)addNewContact;
- (void)updateContactList;
- (void)deleteContactAtIndex:(NSInteger)index;

@end

@protocol ListContactsInteractorOutputProtocol
/**
 * Add here your methods for communication INTERACTOR -> PRESENTER
 */
- (void)foundContacts:(NSArray *)contacts;

@end

@protocol ListContactsInteractorInputProtocol
@required
@property (nonatomic, weak) id <ListContactsInteractorOutputProtocol> presenter;
@property (nonatomic, strong) id <ListContactsDataManagerInputProtocol> localDataManager;
/**
 * Add here your methods for communication PRESENTER -> INTERACTOR
 */
- (void)findContacts;
- (void)removeContactAtIndex:(NSInteger)index;

@end


@protocol ListContactsDataManagerInputProtocol
/**
 * Add here your methods for communication INTERACTOR -> DATAMANAGER
 */
- (void)contactsForString:(NSString *)searchString withCompletionBlock:(void (^)(NSArray *contacts))completionBlock;
- (void)deleteContactAtIndex:(NSInteger)index withCompletionBlock:(void (^)(NSArray *contacts))completionBlock;
@end