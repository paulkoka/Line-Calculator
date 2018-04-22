//
//  KPILineCalculator.m
//  Line-Calculator
//
//  Created by paul on 4/21/18.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "KPILineCalculator.h"
#import <math.h>

#define FirsArgument ([[array objectAtIndex:i - 1] doubleValue])
#define SecondArgument ([[array objectAtIndex:i + 1] doubleValue])

typedef void(^TypicalBlock)(void);

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
    [self calculation];
    return current;
};



-(void)calculation{
    NSMutableArray* array = [[current componentsSeparatedByString:@" "] mutableCopy];
//    NSSet *topPriority = [NSSet setWithObject:@"^"];
//    NSSet *middlePriority = [NSSet setWithObjects:@"*", @"/", nil];
//    NSSet *lowPriority = [NSSet setWithObjects:@"+", @"-", nil];
    __block NSUInteger i;
    __block NSNumber* temp;
    TypicalBlock cleaning = ^{
        [array replaceObjectAtIndex:i-1 withObject:temp];
        [array removeObjectAtIndex:i];
        [array removeObjectAtIndex:i];
    };
    while (array.count!=1) {
        while ([array containsObject:@"^"]) {
           i = [array indexOfObject:@"^"];
            temp = [NSNumber numberWithDouble: pow(FirsArgument, SecondArgument)];
            cleaning();
        }
        
        break;
    }
    
    
    
    
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
