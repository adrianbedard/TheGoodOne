//
//  TalkingVC.m
//  Purple
//
//  Created by ADRIAN BEDARD on 10/18/14.
//  Copyright (c) 2014 Team Space. All rights reserved.
//

#import "TalkingVC.h"

@interface TalkingVC ()


@end

@implementation TalkingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setTimer {
	countdownTimer = [NSTimer scheduledTimerWithTimeInterval:90 target:self selector:<#(SEL)#> userInfo:<#(id)#> repeats:<#(BOOL)#>]
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
