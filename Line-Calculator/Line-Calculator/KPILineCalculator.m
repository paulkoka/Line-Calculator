//
//  KPILineCalculator.m
//  Line-Calculator
//
//  Created by paul on 4/21/18.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "KPILineCalculator.h"
#import <math.h>

#define FirsArgument ([[expression objectAtIndex:i - 1] doubleValue])
#define SecondArgument ([[expression objectAtIndex:i + 1] doubleValue])

#define push ([stack addObject: element])

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
    [self computing:[self convertionToReversePolishNotation]];
    return current;
};


-(NSMutableArray* ) convertionToReversePolishNotation{
    
    [current appendString:@" end"];
    
    NSArray* input  = [current componentsSeparatedByString:@" "];
    
    NSMutableArray* stack = [NSMutableArray array];
    
    NSMutableArray *output = [NSMutableArray array];
    
    NSSet* operators = [NSSet setWithObjects:@"^", @"*", @"/", @"+", @"-", nil];
    
    NSDictionary *priority = @{@"-" : @0,
                               @"+" : @0,
                               @"/" : @1,
                               @"*" : @1,
                               @"^" : @2,
                               };
    
    for (id element in input) {
        if ([operators containsObject:element])
        {
            if ((stack.count == 0)){
                push;
                
            } else {
                while ( [operators containsObject:[stack lastObject]] && [[priority valueForKey:
                        element] integerValue] <= [[priority valueForKey:[stack lastObject]] integerValue])
                {
                    [output addObject:[stack lastObject]];
                    [stack removeLastObject];
                }
                push;
            }
        } else if(![element isEqualToString:@"end"]){
            [output addObject:element];
        } else {
            while (stack.count > 0) {
                [output addObject:[stack lastObject]];
                [stack removeLastObject];
            }
        }
    }
    return output;
}


-(void) computing: (NSMutableArray *) expression{
    
    
     __block NSUInteger i = 0;
     __block NSNumber* temp = [[[NSNumber alloc] init] autorelease];
    TypicalBlock cleaning = ^{
                [expression replaceObjectAtIndex:i-1 withObject:temp];
                [expression removeObjectAtIndex:i];
                [expression removeObjectAtIndex:i];
            };

    TypicalBlock add = ^{
        temp = [NSNumber numberWithDouble:(FirsArgument + SecondArgument)];
        cleaning();
        i -= 2;
    };
    TypicalBlock subtract = ^{
        temp = [NSNumber numberWithDouble:(FirsArgument - SecondArgument)];
        cleaning();
        i -= 2;
    };
    TypicalBlock multyply = ^{
        temp = [NSNumber numberWithDouble:(FirsArgument * SecondArgument)];
        cleaning();
        i -= 2;
    };
    TypicalBlock devide = ^{
        temp = [NSNumber numberWithDouble:(FirsArgument / SecondArgument)];
        cleaning();
        i -= 2;
    };
    TypicalBlock power = ^{
        temp = [NSNumber numberWithDouble:pow(FirsArgument, SecondArgument)];
        cleaning();
        i -= 2;
    };
}
@end
