//
//  KPILineCalculator.m
//  Line-Calculator
//
//  Created by paul on 4/21/18.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "KPILineCalculator.h"
#import <math.h>

#define FirsArgument ([self doubleValue])
#define SecondArgument ([number doubleValue])

@implementation KPILineCalculator

NSMutableString* current;

+(KPILineCalculator *)defaultValue:(NSNumber *)number{
    KPILineCalculator *calc = [[[KPILineCalculator alloc] init] autorelease];
    current = [NSMutableString stringWithFormat:@"%@", [number stringValue]];
    return (calc);
};


-(KPILineCalculator *) add:(NSNumber *) number{
    [current appendFormat:@" + %@", [number stringValue]];
     return (self);
};

-(KPILineCalculator *)subtract:(NSNumber *) number{
    [current appendFormat:@" - %@", [number stringValue]];
    return (self);
};

-(KPILineCalculator *)multiply:(NSNumber *) number{
    [current appendFormat:@" * %@", [number stringValue]];
    return (self);
};

-(KPILineCalculator *)devide:(NSNumber *) number{
    [current appendFormat:@" / %@", [number stringValue]];
    return (self);
};

-(KPILineCalculator *)pow:(NSNumber *) number{
    [current appendFormat:@" ^ %@", [number stringValue]];
    return (self);
};

-(NSString *)description{
    [self calc];
    return current;
};

-(void)calc{
    NSMutableArray* array = [[current componentsSeparatedByString:@" "] mutableCopy];
    //[[NSNumber numberWithDouble:[[array objectAtIndex:0] doubleValue] + [[array objectAtIndex:2] doubleValue]] stringValue];
    NSLog(@"%@", array);
};

//
//-(void) add:(NSNumber *) number{
//
//  [KPILineCalculator defaultValue:[NSNumber numberWithDouble: FirsArgument + SecondArgument]];
//};

//
//-(void)subtract:(NSNumber *) number{
//    self = [NSNumber numberWithFloat:FirsArgument - SecondArgument];
//};
//
//-(void)multiply:(NSNumber *) number{
//    self = [NSNumber numberWithFloat:FirsArgument * SecondArgument];
//};
//
//-(void)devide:(NSNumber *) number{
//    self = [NSNumber numberWithFloat:FirsArgument / SecondArgument];
//};
//
//-(void)pow:(NSNumber *) number{
//    self = [NSNumber numberWithDouble: pow(FirsArgument, SecondArgument)];
//};

//+ (KPILineCalculator *)defaultValue:(NSNumber *) number{
//    KPILineCalculator *calc = [[[KPILineCalculator alloc] init]autorelease];
//    calc = (KPILineCalculator*) number;
//     return calc;
//};
//
//-(void ) add:(NSNumber *) number{
//    self  = [NSNumber numberWithDouble:([self doubleValue] + [number doubleValue])];
//};

@end
