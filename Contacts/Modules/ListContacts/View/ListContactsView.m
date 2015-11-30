//
// Created by Applicious
// Copyright (c) 2015 Applicious. All rights reserved.
//

#import "ListContactsView.h"
#import "Contact.h"

@interface ListContactsView ()

@property (nonatomic, weak) IBOutlet UITableView *contactListTableView;

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

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[self.presenter updateContactList];
}

#pragma mark - ListContactsViewProtocol

//TODO
- (void)showNoContactsMessage
{
	self.view = self.noContactsView;
}

- (void)showContactsUsingArray:(NSArray *)contactsArray
{
	self.view = self.contactListTableView;
	self.contacts = contactsArray;
	[self reloadContacts];
}

- (void)updateTitle
{
	[self.navigationItem setTitle:[@"My Contacts" stringByAppendingString:[NSString stringWithFormat:@" (%ld)", self.contacts.count]]];
}

- (void)reloadContacts
{
	[self.contactListTableView reloadData];
	[self updateTitle];
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

// Override to support editing the table view.
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
	
	UITableViewCell *cell = [self.contactListTableView dequeueReusableCellWithIdentifier:@"ContactInfoCell" forIndexPath:indexPath];
	Contact *contact = self.contacts[indexPath.row];
	cell.textLabel.text = [[contact.firstName stringByAppendingString:@" "] stringByAppendingString:contact.lastName];
	cell.detailTextLabel.text = contact.phoneNumber;
	
	return cell;

}

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	//TODO
	//Ask user if he wants to call
}


#pragma mark - Private

//TODO : Localize it
- (void)configureView
{
	[self.navigationItem setTitle:@"My Contacts"];
}

@end