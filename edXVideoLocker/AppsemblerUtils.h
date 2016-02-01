//
//  AppsemblerUtils.h
//  edXVideoLocker
//
//  Created by Tyler Martin on 2/1/16.
//  Copyright © 2016 edX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppsemblerUtils : NSObject

+ (UIColor *)colorFromHexString:(NSString *)hexString;
+ (NSString *) replaceStringInString: (NSString *) replaceThis withThis:(NSString *) newString inThat: (NSString *) targetString;

@end
