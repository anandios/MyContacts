//
//  DataManager.m
//  Contacts
//
//  Created by Anand Singh on 11/30/15.
//  Copyright © 2015 Applicious. All rights reserved.
//

#import "DataManager.h"
#import "Datastore.h"

@interface DataManager ()

@property (nonatomic, strong, readwrite) Datastore *ds;

@end

@implementation DataManager

- (instancetype)initWithDatastore:(Datastore *)datastore
{
	if (self = [super init]) {
		self.ds = datastore;
	}
	
	return self;
}

@end
