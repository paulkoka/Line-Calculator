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
    KPILineCalculator *calc = [KPILineCalculator defaultValue:@4];
    [[[[[calc add:@3] subtract:@7] pow:@2] devide:@2] add:@4];
    //[[[[[calc add:@3] multiply:@7] subtract:@2] pow:@2] devide:@4];
    
    NSLog(@"%@", calc);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
