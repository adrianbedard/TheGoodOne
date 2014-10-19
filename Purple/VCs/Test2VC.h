//
//  Test2VC.h
//  Purple
//
//  Created by ADRIAN BEDARD on 10/18/14.
//  Copyright (c) 2014 Team Space. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Sinch/Sinch.h>

@interface Test2VC : UIViewController <SINCallClientDelegate, SINCallDelegate>
@property NSString* username;
@end
