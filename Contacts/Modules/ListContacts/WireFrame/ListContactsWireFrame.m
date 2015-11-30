//
// Created by Applicious
// Copyright (c) 2015 Applicious. All rights reserved.
//

#import "ListContactsWireFrame.h"
#import "DataStore.h"
#import "AddContactsWireFrame.h"

@implementation ListContactsWireFrame

- (void)presentListContactInterfaceFromWindow:(UIWindow *)window
{
	//get ListContactsView from storyboard
	self.view = [self listViewFromStoryboard];
	id <ListContactsPresenterProtocol, ListContactsInteractorOutputProtocol> presenter = self.listcontactsPresenter;
	[presenter setView:self.view];
	[self.view setPresenter:presenter];
	[self.rootWireframe showRootViewController:self.view InWindow:window];
}

- (void)presentAddContactView
{
	[self.addContactsWireFrame presentAddContactModuleFrom:self.view];
}

#pragma mark - private

- (ListContactsView *)listViewFromStoryboard
{
	UIStoryboard *storyboard = [self mainStoryboard];
	ListContactsView *listContactView = [storyboard instantiateViewControllerWithIdentifier:@"ListContactsView"];
	
	return listContactView;
}

- (UIStoryboard *)mainStoryboard
{
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
														 bundle:[NSBundle mainBundle]];
	
	return storyboard;
}

@end
