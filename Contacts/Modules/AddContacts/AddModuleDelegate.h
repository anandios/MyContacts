//
//  AddModuleDelegate.h
//  Contacts
//
//  Created by Anand Singh on 11/30/15.
//  Copyright © 2015 Applicious. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AddModuleDelegate <NSObject>

- (void)didCancelAddContactAction;
- (void)didSaveContactAction;

@end
