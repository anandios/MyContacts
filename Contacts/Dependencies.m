//
//  Dependencies.m
//  Contacts
//
//  Created by Anand Singh on 11/30/15.
//  Copyright © 2015 Applicious. All rights reserved.
//

#import "Dependencies.h"
#import "ListContactsWireFrame.h"
#import "RootWireframe.h"
#import "Datastore.h"
#import "AddContactsWireFrame.h"
#import "AddContactsInteractor.h"

@interface Dependencies ()

@property (nonatomic, strong) ListContactsWireFrame *listContactsWireframe;

@end


@implementation Dependencies

- (instancetype)init
{
	if (self = [super init]) {
		[self setupDependencies];
	}
	
	return self;
}

- (void)setupRootViewControllerIntoWindow:(UIWindow *)window
{
	[self.listContactsWireframe presentListContactInterfaceFromWindow:window];
}

- (void)setupDependencies
{
	//For now only runtime data
	Datastore *datastore = [Datastore new];
	RootWireframe *rootWireframe = [RootWireframe new];
	
	//List Contacts Module
	ListContactsWireFrame *listContactsWireFrame = [ListContactsWireFrame new];
	ListContactsPresenter *listContactsPresenter = [ListContactsPresenter new];
	ListContactsLocalDataManager *listContactDataManager = [[ListContactsLocalDataManager alloc] initWithDatastore:datastore];
	ListContactsInteractor *listContactsInteractor = [[ListContactsInteractor alloc] initWithDataManager:listContactDataManager];

	//Add Contacts Module
	AddContactsWireFrame *addContactsWireFrame = [AddContactsWireFrame new];
	AddContactsPresenter *addContactPresenter = [AddContactsPresenter new];
	AddContactsLocalDataManager *addContactDataManager = [[AddContactsLocalDataManager alloc] initWithDatastore:datastore];
	AddContactsInteractor *addContactInteractor = [[AddContactsInteractor alloc] initWithDataManager:addContactDataManager];
	
	//Inject dependencies
	//Interactor
	[listContactsInteractor setOutput:listContactsPresenter];
	//Presenter
	[listContactsPresenter setInteractor:listContactsInteractor];
	[listContactsPresenter setWireFrame:listContactsWireFrame];
	
	//Add Interactor
	[addContactInteractor setPresenter:addContactPresenter];
	//Add Presenter
	[addContactPresenter setInteractor:addContactInteractor];
	[addContactPresenter setWireFrame:addContactsWireFrame];
	//Wireframe
	[addContactsWireFrame setPresenter:addContactPresenter];
	//Add Module Delegate
	[addContactPresenter setAddModuleDelegate:listContactsPresenter];
	//Wireframe
	[listContactsWireFrame setAddContactsWireFrame:addContactsWireFrame];
	[listContactsWireFrame setRootWireframe:rootWireframe];
	[listContactsWireFrame setListcontactsPresenter:listContactsPresenter];
	self.listContactsWireframe = listContactsWireFrame;
	[self.listContactsWireframe setRootWireframe:rootWireframe];
}

@end
