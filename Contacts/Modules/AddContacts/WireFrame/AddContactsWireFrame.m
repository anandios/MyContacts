//
// Created by Applicious
// Copyright (c) 2015 Applicious. All rights reserved.
//

#import "AddContactsWireFrame.h"

@interface AddContactsWireFrame ()

@property (nonatomic, strong) UIViewController *parentView;

@end

@implementation AddContactsWireFrame

- (void)presentAddContactModuleFrom:(UIViewController *)fromViewController
{
	self.parentView = fromViewController;	
	//get ListContactsView from storyboard
	self.view = [self addViewFromStoryboard];
	id <AddContactsPresenterProtocol, AddContactsInteractorOutputProtocol> presenter = self.presenter;
	[presenter setView:self.view];
	[self.view setPresenter:presenter];
	[fromViewController.navigationController pushViewController:self.view animated:YES];
}

- (void)dismissAddContactView
{
	[self.parentView.navigationController popViewControllerAnimated:YES];
}

#pragma mark - private

- (AddContactsView *)addViewFromStoryboard
{
	UIStoryboard *storyboard = [self mainStoryboard];
	AddContactsView *addContactView = [storyboard instantiateViewControllerWithIdentifier:@"AddContactsView"];
	
	return addContactView;
}

- (UIStoryboard *)mainStoryboard
{
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
														 bundle:[NSBundle mainBundle]];
	
	return storyboard;
}


@end
