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
@synthesize username, remoteUsername, callButton, callname;

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
    username = [self generateRandomString:20];
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
    NSString *key = @"d";
    _client = [Sinch clientWithApplicationKey:key
                            applicationSecret:@"V+TXJ9EKZk+7ZXZijXex+g=="
                              environmentHost:@"sandbox.sinch.com"
                                       userId:self.username];
    
    _client.callClient.delegate = self;
    [_client setSupportCalling:YES];
    [_client start];
    [_client startListeningOnActiveConnection];
    isInCall = YES;
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

- (IBAction)callUser:(id)sender {
    if (_call == nil)
    {
        _call = [_client.callClient callUserWithId:self.remoteUsername.text];
        _call.delegate = self;
    }
    else
    {
        [_call hangup];
        _call = nil;
    }
}


-(void)client:(id<SINCallClient>)client didReceiveIncomingCall:(id<SINCall>)call {
    //for now we are just going to answer calls,
    //in a normal app you would show in incoming call screen
    call.delegate = self;
    [call answer];
    _call = call;
}

#pragma mark - SINCallDelegate

- (void)callDidProgress:(id<SINCall>)call {
    //in this method you can play ringing tone adn update ui to display progress of call.
}

- (void)callDidEstablish:(id<SINCall>)call {
    //Called when a call connects.
     [self.callButton setTitle:@"Hang up" forState:UIControlStateNormal];
}

- (void)callDidEnd:(id<SINCall>)call {
    //called when call finnished.
    [self.callButton setTitle:@"Call" forState:UIControlStateNormal];
    _call = nil;

}



@end
