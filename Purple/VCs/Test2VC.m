//
//  Test2VC.m
//  Purple
//
//  Created by ADRIAN BEDARD on 10/18/14.
//  Copyright (c) 2014 Team Space. All rights reserved.
//

#import "Test2VC.h"
/*


@interface Test2VC ()
{
	id<SINClient> _client;
}

@end

@implementation Test2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
	if([segue.identifier isEqualToString:@"showCallScreen"])
		{
		Test2VC *vc = [segue destinationViewController];
		vc.username = sender;
		}
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/*-(void)initSinchClient{
	_client = [Sinch clientWithApplicationKey:@"1c74e080-f553-4f69-ae89-657fb2ea3ab5"
						  applicationSecret:@"V+TXJ9EKZk+7ZXZijXex+g=="
							environmentHost:@"sandbox.sinch.com"
									 userId:@"<userid>"];
	_client.delegate = self;

	[sinchClient setSupportCalling:YES];
	[sinchClient setSupportActiveConnectionInBackground:YES];
		[sinchClient start];
	[sinchClient startListeningOnActiveConnection];

}

@end
*/