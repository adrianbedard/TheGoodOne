//
//  TalkingVC.m
//  Purple
//
//  Created by ADRIAN BEDARD on 10/18/14.
//  Copyright (c) 2014 Team Space. All rights reserved.
//

#import "TalkingVC.h"
#import <Sinch/Sinch.h>
@interface TalkingVC ()


@end

@implementation TalkingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
    //Sinch connection here?
    // Instantiate a Sinch client object
    
     id<SINClient> sinchClient = [Sinch clientWithApplicationKey:@"1c74e080-f553-4f69-ae89-657fb2ea3ab5"
     applicationSecret:@"V+TXJ9EKZk+7ZXZijXex+g=="
     environmentHost:@"sandbox.sinch.com"
     userId:@"<userid>"];
     [sinchClient setSupportCalling:YES];
     [sinchClient setSupportActiveConnectionInBackground:NO];
     //sinchClient.delegate = ;
     [sinchClient start];
     [sinchClient startListeningOnActiveConnection];
     
     //stop listening
     //-[SINClient stopListeningOnActiveConnection]
     
     id<SINCallClient> callClient = [sinchClient callClient];
     id<SINCall> call = [callClient callUserWithId:@"<remote user id>"];
     
     [sinchClient stopListeningOnActiveConnection];
     [sinchClient terminate];
     [sinchClient release]; // unless using ARC
     sinchClient = nil;

    */
    [self setTimer];
     
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) timerRun {
	secondsCount -= 1;
	int seconds = secondsCount;
	NSString *timerOutput = [NSString stringWithFormat:@"%2d", seconds];
	countdownLabel.text = timerOutput;
	
	if (secondsCount == 0) {
		[countdownTimer invalidate];
		countdownTimer = nil;
		[self performSegueWithIdentifier:@"BackToLoad" sender:self];
	}
}

-(void) setTimer {
	secondsCount = 5;
	countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
