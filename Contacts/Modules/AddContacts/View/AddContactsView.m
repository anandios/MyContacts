//
// Created by Applicious
// Copyright (c) 2015 Applicious. All rights reserved.
//

#import "AddContactsView.h"

@interface AddContactsView ()

@property (nonatomic, weak) IBOutlet UITextField *firstNameTextField;
@property (nonatomic, weak) IBOutlet UITextField *lastNameTextField;
@property (nonatomic, weak) IBOutlet UITextField *phoneNumberTextField;

@end

@implementation AddContactsView

#pragma mark - ViewController Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

//- (void)viewDidDisappear:(BOOL)animated
//{
//    [super viewDidDisappear:animated];
//	//Being removed from ParentViewController
//	if (self.isMovingFromParentViewController) {
//		[self.presenter cancelAddContactAction];
//	}
//
//}

#pragma mark - 

- (IBAction)saveButtonAction:(id)sender
{
	[self.presenter saveAddContactActionWithFirstName:self.firstNameTextField.text
											 lastName:self.lastNameTextField.text
										  phoneNumber:self.phoneNumberTextField.text];
}

@end