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
#import "CallScreenViewController.h"

@interface LoginViewController ()

@property (nonatomic, assign) unsigned int participantsCount;
@property (nonatomic, strong) NSArray *participants;

@end

@implementation LoginViewController
@synthesize username, callname, isInCall;

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
    
  //  isInCall = NO;
	
    //Set up configuration for a channel
    [PubNub setConfiguration:[PNConfiguration defaultConfiguration]];
    [PubNub connect];

    PNChannel *Lobby = [PNChannel channelWithName:@"MainLobby" shouldObservePresence:YES];
    //check to see if a channel has already been created; if not create channel
    
    //if ([PNHereNow:[PNChannel channelWithName:@"MainLobby"].participantsCount == 0)
    //{
    //
    //}
         
    //subscribe to channel
    [PubNub subscribeOnChannel:Lobby];
         
    //find a callname in the participants array; remove yourself from array once paired
    
    //NSLog(@"%@\n", Lobby.participants[0]);

    int i;
    while (1)
    {
        sleep(.05);
        if (isInCall == YES)
        {
            [PubNub unsubscribeFromChannel:Lobby];
            break;
        }
        for (i = 0; i < Lobby.participantsCount ; i++)
        {
            if (Lobby.participants[i] != username & isInCall == NO)
            {
               // callname = Lobby.participants[i].username;
                [PubNub unsubscribeFromChannel:Lobby];
                break;
            }
        }
    }
}

-(void)didReceiveMemoryWarning
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
        vc.isInCall2 = self.isInCall;
        
    }
}

/*-(IBAction)login:(id)sender {
    if (username.text != nil ) {
        [self performSegueWithIdentifier:@"showCallScreen" sender:username.text];
	}
}
*/

@end
