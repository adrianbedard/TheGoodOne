//
//  CallScreenViewController.h
//  CallingApp
//
//  Created by christianjensen on 01/08/14.
//  Copyright (c) 2014 sinch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Sinch/Sinch.h>

@interface CallScreenViewController : UIViewController <SINCallClientDelegate, SINCallDelegate>
{
	
IBOutlet UILabel *countdownLabel;
NSTimer *countdownTimer;
int secondsCount;
}
- (IBAction)callUser:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *remoteUsername;
@property NSString* username;
@property NSString* callname;
@property (strong, nonatomic) IBOutlet UIButton *callButton;
@end
