//
// Created by Applicious
// Copyright (c) 2015 Applicious. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListContactsProtocols.h"

@interface ListContactsView : UIViewController <ListContactsViewProtocol>

@property (nonatomic, weak) IBOutlet UIView *noContactsView;
@property (nonatomic, weak) IBOutlet UITableView *contactListTableView;
@property (nonatomic, strong) id <ListContactsPresenterProtocol> presenter;

@end
