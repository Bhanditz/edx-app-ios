//
//  OEXFindCourseInterstitialViewController.h
//  edXVideoLocker
//
//  Created by Abhradeep on 28/01/15.
//  Copyright (c) 2015 edX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OEXConfig.h"
#import "AppsemblerUtils.h"

@class OEXFindCourseInterstitialViewController;

@protocol OEXFindCourseInterstitialViewControllerDelegate <NSObject>
- (void)interstitialViewControllerDidChooseToOpenInBrowser:(OEXFindCourseInterstitialViewController*)interstitialViewController;
- (void)interstitialViewControllerDidClose:(OEXFindCourseInterstitialViewController*)interstitialViewController;
@end

@interface OEXFindCourseInterstitialViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *btn_openWebsiteInBrowser;
@property (weak, nonatomic) id <OEXFindCourseInterstitialViewControllerDelegate> delegate;
@end
