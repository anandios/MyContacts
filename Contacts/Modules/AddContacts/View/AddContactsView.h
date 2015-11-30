//
// Created by Applicious
// Copyright (c) 2015 Applicious. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddContactsProtocols.h"

@interface AddContactsView : UIViewController <AddContactsViewProtocol>

@property (nonatomic, strong) id <AddContactsPresenterProtocol> presenter;

@end
