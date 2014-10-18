//
//  TalkingVC.h
//  Purple
//
//  Created by ADRIAN BEDARD on 10/18/14.
//  Copyright (c) 2014 Team Space. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TalkingVC : UIViewController
{
	IBOutlet UILabel *countdownLabel;
	NSTimer *countdownTimer;
	int secondsCount;
	
}
@end
