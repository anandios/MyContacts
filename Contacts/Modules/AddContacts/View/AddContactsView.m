//
// Created by Applicious
// Copyright (c) 2015 Applicious. All rights reserved.
//

#import "AddContactsView.h"

static NSString *const kValidationErrorTitle = @"Error";
static NSString *const kValidationErrorMessage = @"Data provided by you is not valid. Please enter correctly";
static NSString *const kValidationErrorAlertButtonTitle = @"OK";

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

#pragma mark - Button actions

- (IBAction)saveButtonAction:(id)sender
{
	[self.presenter saveAddContactActionWithFirstName:self.firstNameTextField.text
											 lastName:self.lastNameTextField.text
										  phoneNumber:self.phoneNumberTextField.text];
}

#pragma mark - AddContactsViewProtocol method

- (void)presentInvalidDataAlert
{
	[[[UIAlertView alloc] initWithTitle:kValidationErrorTitle
								message:kValidationErrorMessage
							   delegate:nil
					  cancelButtonTitle:kValidationErrorAlertButtonTitle
					  otherButtonTitles:nil, nil] show];
}

@end