//
//  LoginViewController.m
//  CallingApp
//
//  Created by christianjensen on 30/07/14.
//  Copyright (c) 2014 sinch. All rights reserved.
//

#import "LoginViewController.h"
#import "PNImports.h"
#import "PNMessage+Protected.h"

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
    
    //Set up configuration for a channel
    [PubNub setConfiguration:[PNConfiguration defaultConfiguration]];

    //check to see if a channel has already been created; if not create channel
    if ([PubNub PNHereNow:[PNChannel channelWithName:@"MainLobby"].participantsCount == 0)
    {
        PNChannel *Lobby = [PNChannel channelWithName:@"MainLobby" shouldObservePresence:YES];
    }
         
    //subscribe to channel
    [PubNub subscribeOnChannel:Lobby];
    
    //remember your PubNub ID
    username = PubNub.getUUID
         
    //find a callname in the participants array; remove that from array once paired
    while (1)
    {
        if ([PubNub participants][i] != username)
        {
            callname = get uuid.participants[i]
            remove particpants[i] from q;
            break;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


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

/*-(IBAction)login:(id)sender {
    if (username.text != nil ) {
        [self performSegueWithIdentifier:@"showCallScreen" sender:username.text];
	}
}
*/
@end
