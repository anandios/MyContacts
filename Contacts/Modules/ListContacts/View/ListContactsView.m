//
// Created by Applicious
// Copyright (c) 2015 Applicious. All rights reserved.
//

#import "ListContactsView.h"
#import "Contact.h"
#import "Utilities.h"

static NSString *const kViewTitle = @"My Contacts";
static NSString *const kContactInfoCellIdentifier = @"ContactInfoCell";
static NSString *const kSpaceString = @" ";

@interface ListContactsView ()

@property (nonatomic, weak) IBOutlet UITableView *contactListTableView;
@property (nonatomic, copy) NSString *viewTitle;
@property (nonatomic, strong) NSArray *contacts;

@end

@implementation ListContactsView


#pragma mark - ViewController Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self showNoContactsMessage];
	[self configureView];
}

#pragma mark - ListContactsViewProtocol

- (void)showNoContactsMessage
{
	self.view = self.noContactsView;
	self.viewTitle = kViewTitle;
}

- (void)showContactsUsingArray:(NSArray *)contactsArray
{
	self.view = self.contactListTableView;
	self.contacts = contactsArray;
	self.viewTitle = [kViewTitle stringByAppendingString:[NSString stringWithFormat:@"%@(%ld)", kSpaceString, self.contacts.count]];
	[self reloadContacts];
}

- (void)updateTitle
{
	[self.navigationItem setTitle:self.viewTitle];
}

- (void)reloadContacts
{
	[self.contactListTableView reloadData];
}

#pragma - Button Actions 

- (IBAction)addContactButtonAction:(id)sender
{
	[self.presenter addNewContact];
}

#pragma mark - TableView Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.contacts count];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
	return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		[self.presenter deleteContactAtIndex:indexPath.row];
		[self reloadContacts];
	}
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return UITableViewCellEditingStyleDelete;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	UITableViewCell *cell = [self.contactListTableView dequeueReusableCellWithIdentifier:kContactInfoCellIdentifier
																			forIndexPath:indexPath];
	Contact *contact = self.contacts[indexPath.row];
	cell.textLabel.text = [[contact.firstName stringByAppendingString:kSpaceString] stringByAppendingString:contact.lastName];
	cell.detailTextLabel.text = contact.phoneNumber;
	
	return cell;
}

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	Contact *selectedContact = self.contacts[indexPath.row];
	[Utilities makeCallOnNumber:selectedContact.phoneNumber];
}


#pragma mark - Private

- (void)configureView
{
	[self.navigationItem setTitle:kViewTitle];
}

@end