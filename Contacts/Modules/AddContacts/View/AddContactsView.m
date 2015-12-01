//
// Created by Applicious
// Copyright (c) 2015 Applicious. All rights reserved.
//

#import "AddContactsView.h"
#import "NameValidator.h"
#import "PhoneNumberValidator.h"

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

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
	if (![self isDataValid]) {
		[self.presenter cancelAddContactAction];
	}

}

#pragma mark - 

- (IBAction)saveButtonAction:(id)sender
{
	if ([self isDataValid]) {
		[self.presenter saveAddContactActionWithFirstName:self.firstNameTextField.text
											 lastName:self.lastNameTextField.text
										  phoneNumber:self.phoneNumberTextField.text];
	} else {
		[[[UIAlertView alloc] initWithTitle:kValidationErrorTitle
									message:kValidationErrorMessage
								   delegate:nil
						  cancelButtonTitle:kValidationErrorAlertButtonTitle
						  otherButtonTitles:nil, nil] show];
	}
}

#pragma mark - Private

- (BOOL)isDataValid
{
	NameValidator *nameValidator = [NameValidator new];
	PhoneNumberValidator *phValidator = [PhoneNumberValidator new];
	
	return [nameValidator validate:self.firstNameTextField.text] && [phValidator validate:self.phoneNumberTextField.text];
}

@end