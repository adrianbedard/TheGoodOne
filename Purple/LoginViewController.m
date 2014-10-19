//
//  LoginViewController.m
//  CallingApp
//
//  Created by christianjensen on 30/07/14.
//  Copyright (c) 2014 sinch. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize username, callname;
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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//before you click connect                 DONE (see above)
//generate user ID rand fuction            DONE (see above)

//at this point connect has been pressed
//if a channel does not exist, create it
//once u create channel, join it with your unique ID
//if a channel does exist, join it with your unique ID

if ()

[PubNub setConfiguration:[PNConfiguration defaultConfiguration]];
[PubNub connect];

//Define a channel
PNChannel *Lobby = [PNChannel channelWithName:@"MainLobby" shouldObservePresence:YES];

//Subscribe to the channel
[PubNub subscribeOnChannel:Lobby];

//If number of people in channel >= 2
//return list of ID sessions
//choose first ID != self, remeber that ID
//take in other ID as argument to sinch
//wait until other process takes in your id
//when both ID's have been taken in, queue chat.

-(void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender {
    // check that its the right segue
    if ([segue.identifier isEqualToString:@"showCallScreen"])
    {
        // Get destination viewController
        CallScreenViewController *vc = [segue destinationViewController];
        // set the username property of CallScreenViewController
        vc.username = self.username;
        vc.callname = self.callname;
    }
}

-(IBAction)login:(id)sender {
    if (username.text != nil ) {
        [self performSegueWithIdentifier:@"showCallScreen" sender:username.text];
	}
}

@end
