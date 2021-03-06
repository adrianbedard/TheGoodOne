//
//  CallScreenViewController.m
//  CallingApp
//
//  Created by christianjensen on 01/08/14.
//  Copyright (c) 2014 sinch. All rights reserved.
//

#import "CallScreenViewController.h"
#import "LoginViewController.h"

@interface CallScreenViewController ()
{
    id<SINClient> _client;
    id<SINCall> _call;
    
}
@end

@implementation CallScreenViewController
@synthesize username, remoteUsername, callButton, callname, isInCall2;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
		//username = [self generateRandomString:20];
		//callname = [self generateRandomString:20];
	
    [self initSinchClient];
	
	
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString*)generateRandomString:(int)num {
    NSMutableString* string = [NSMutableString stringWithCapacity:num];
    for (int i = 0; i < num; i++) {
        [string appendFormat:@"%C", (unichar)('a' + arc4random_uniform(25))];
    }
    return string;
}

- (void)initSinchClient {
		// NSString *key = @"d";
    _client = [Sinch clientWithApplicationKey:@"1c74e080-f553-4f69-ae89-657fb2ea3ab5"
                            applicationSecret:@"V+TXJ9EKZk+7ZXZijXex+g=="
                              environmentHost:@"sandbox.sinch.com"
                                       userId:username];
	
	_client.delegate = self;
    _client.callClient.delegate = self;
    [_client setSupportCalling:YES];
    [_client start];
    [_client startListeningOnActiveConnection];
    isInCall2 = YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
/*
- (IBAction)callUser:(id)sender {
    if (_call == nil)
    {
        _call = [_client.callClient callUserWithId:callname];
        _call.delegate = self;
    }
    else
    {
        [_call hangup];
        _call = nil;
    }
}
*/


-(void)clientDidStart:(id<SINClient>)client{
	[self callUser:callname];
}
-(void)callUser:(id)sender{
	/*if (_call == nil)
		{
		_call = [_client.callClient callUserWithId:callname];
		_call.delegate = self;
		}
	else
		{
		[_call hangup];
		_call = nil;
		}
	 */
	NSLog(@"hope");
	
	NSComparisonResult result = [username compare:callname];
	
	if (result == NSOrderedDescending) // stringOne > stringTwo
		{
		NSLog(@"attempt %@", callname);
		_call = [_client.callClient callUserWithId:callname];
		_call.delegate = self;
		}
	
}

-(void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender {
    // check that its the right segue
    if ([segue.identifier isEqualToString:@"BackToLoad"])
    {
        
        // Get destination viewController
        LoginViewController *vc = [segue destinationViewController];
        // set the username property of CallScreenViewController
        vc.username = nil;
        vc.callname = nil;
        vc.isInCall = NO;
    }
	
	[_call hangup];
	_call = nil;
	[_client stopListeningOnActiveConnection];
	[_client terminate];
}



-(void)client:(id<SINCallClient>)client didReceiveIncomingCall:(id<SINCall>)call {
    //for now we are just going to answer calls,
    //in a normal app you would show in incoming call screen
    call.delegate = self;
    [call answer];
    _call = call;
	NSLog(@"call");
}

#pragma mark - SINCallDelegate

- (void)callDidProgress:(id<SINCall>)call {
    //in this method you can play ringing tone adn update ui to display progress of call.
}

- (void)callDidEstablish:(id<SINCall>)call {
    //Called when a call connects.
	// [self.callButton setTitle:@"Hang up" forState:UIControlStateNormal];
	[self setTimer];
}

- (void)callDidEnd:(id<SINCall>)call {
    //called when call finnished.
    [self.callButton setTitle:@"Call" forState:UIControlStateNormal];
	[_call hangup];
    _call = nil;
	[_client stopListeningOnActiveConnection];
	[_client terminate];
	callname = nil;
	username = nil;
	[self performSegueWithIdentifier:@"BackToLoad" sender:self];

}

-(void) timerRun {
	secondsCount -= 1;
	int seconds = secondsCount;
	NSString *timerOutput = [NSString stringWithFormat:@"%2d", seconds];
	countdownLabel.text = timerOutput;
	
	if (secondsCount == 0) {
		[countdownTimer invalidate];
		countdownTimer = nil;
		[_call hangup];
		_call = nil;
		[_client stopListeningOnActiveConnection];
		[_client terminate];
		callname = nil;
		username = nil;
		[self performSegueWithIdentifier:@"BackToLoad" sender:self];
	}
}

-(void) setTimer {
	secondsCount = 15;
	countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
}

@end
