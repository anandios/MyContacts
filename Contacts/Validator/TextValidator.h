//
//  Validator.h
//  Contacts
//
//  Created by Anand Singh on 12/1/15.
//  Copyright © 2015 Applicious. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol TextValidator <NSObject>
@required
- (BOOL)validate:(NSString *)string;

@end
