//
//  Utilities.h
//  Contacts
//
//  Created by Anand Singh on 11/30/15.
//  Copyright © 2015 Applicious. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UIStoryboard;

@interface Utilities : NSObject

+ (void)makeCallOnNumber:(NSString *)number;
+ (UIStoryboard *)mainStoryboard;

@end
