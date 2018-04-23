//
//  ViewController.m
//  Line-Calculator
//
//  Created by paul on 4/19/18.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "ViewController.h"
#import "KPILineCalculator.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     KPILineCalculator *calc1 = [KPILineCalculator defaultValue:@4];
  [[[[[calc1 add:@3] multiply:@7] subtract:@2] pow:@2] devide:@4];
    
   // NSLog(@"%@", calc);
     NSLog(@"%@", calc1);
    NSLog(@"Finish");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
