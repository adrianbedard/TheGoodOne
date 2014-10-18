//
//  main.m
//  Purple
//
//  Created by ADRIAN BEDARD on 10/18/14.
//  Copyright (c) 2014 Team Space. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#import <Sinch/Sinch.h>

int main(int argc, char * argv[]) {
	@autoreleasepool {
	    return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
	}
    

    
    // Instantiate a Sinch client object
    id<SINClient> sinchClient = [Sinch clientWithApplicationKey:@"1c74e080-f553-4f69-ae89-657fb2ea3ab5"
                                              applicationSecret:@"V+TXJ9EKZk+7ZXZijXex+g=="
                                                environmentHost:@"sandbox.sinch.com"
                                                         userId:@"<user id>"];

}
