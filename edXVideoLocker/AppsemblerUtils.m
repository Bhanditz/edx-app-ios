//
//  AppsemblerUtils.m
//  edXVideoLocker
//
//  Created by Tyler Martin on 2/1/16.
//  Copyright © 2016 edX. All rights reserved.
//

#import "AppsemblerUtils.h"

@implementation AppsemblerUtils

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xff5757) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

+ (NSString *) replaceStringInString: (NSString *) replaceThis withThis:(NSString *) newString inThat: (NSString *) targetString {
    NSMutableString* result = [NSMutableString stringWithString:targetString];
    NSRange range = NSMakeRange(0, targetString.length);
    [result replaceOccurrencesOfString:replaceThis withString:newString options:0 range:range];
    return result;
}

@end
