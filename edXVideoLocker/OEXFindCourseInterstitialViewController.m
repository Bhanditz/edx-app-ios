//
//  OEXFindCourseInterstitialViewController.m
//  edXVideoLocker
//
//  Created by Abhradeep on 28/01/15.
//  Copyright (c) 2015 edX. All rights reserved.
//

#import "OEXFindCourseInterstitialViewController.h"

@interface OEXFindCourseInterstitialViewController ()
@property (strong, nonatomic) IBOutlet UILabel* topLabel;
@property (strong, nonatomic) IBOutlet UILabel* bottomLabel;

- (IBAction)openInBrowserTapped:(id)sender;
- (IBAction)closeTapped:(id)sender;
@end

@implementation OEXFindCourseInterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.topLabel.text = OEXLocalizedString(@"NO_ENROLLMENT_INTERSTITIAL_TOP_LABEL", nil);
    self.topLabel.font = [UIFont fontWithName:@"OpenSans" size:self.topLabel.font.pointSize];

    NSString* bottomLabelText = OEXLocalizedString(@"NO_ENROLLMENT_INTERSTITIAL_BOTTOM_LABEL", nil);

    NSMutableAttributedString* bottomLabelAttributedText = [[NSMutableAttributedString alloc] initWithString:bottomLabelText];
    [bottomLabelAttributedText setAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"OpenSans" size:self.bottomLabel.font.pointSize]} range:[bottomLabelText rangeOfString:bottomLabelText]];
    self.bottomLabel.attributedText = bottomLabelAttributedText;
    [_btn_openWebsiteInBrowser setBackgroundImage:nil forState:UIControlStateNormal];
    [_btn_openWebsiteInBrowser setBackgroundColor:[AppsemblerUtils colorFromHexString:BRAND_MEDIUM_COLOR]];
    
}

- (IBAction)openInBrowserTapped:(id)sender {
    [self.delegate interstitialViewControllerDidChooseToOpenInBrowser:self];
}

- (IBAction)closeTapped:(id)sender {
    [self.delegate interstitialViewControllerDidClose:self];
}

@end
