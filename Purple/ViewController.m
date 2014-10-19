//
//  ViewController.m
//  Purple
//
//  Created by ADRIAN BEDARD on 10/18/14.
//  Copyright (c) 2014 Team Space. All rights reserved.
//

#import "ViewController.h"
#import <PNImports.h>
#import "PNMessage+Protected.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)connect:(id)sender {
	//[self presentedViewController]
}
- (IBAction)voiceModifier:(UISegmentedControl *)sender {
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
    
    //[PubNub setConfiguration:[PNConfiguration defaultConfiguration]];
    //[PubNub connect];
    
    //Define a channel
    //PNChannel *channel_1 = [PNChannel channelWithName:@"Lobby" shouldObservePresence:YES];
    
    //Subscribe to the channel
    //[PubNub subscribeOnChannel:channel_1];
}

@end
