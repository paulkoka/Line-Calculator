//
//  KPILineCalculator.m
//  Line-Calculator
//
//  Created by paul on 4/21/18.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "KPILineCalculator.h"
#import <math.h>

#define FirsArgument ([[expression objectAtIndex:i - 2] doubleValue])
#define SecondArgument ([[expression objectAtIndex:i - 1] doubleValue])

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
}


//-(NSString *)description{
//    NSNumber* result = [self computing:[self convertionToReversePolishNotation]];
//    current = [NSMutableString stringWithFormat:@"%@", result ];
//    return current;
//};


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
    
    NSSet* operators = [NSSet setWithObjects:@"^", @"*", @"/", @"+", @"-", nil];
    
     __block NSUInteger i = 0;
     __block NSNumber* temp = [[[NSNumber alloc] init] autorelease];
    TypicalBlock cleaning = ^{
                [expression replaceObjectAtIndex:i - 2 withObject:temp];
                [expression removeObjectAtIndex:i - 1];
                [expression removeObjectAtIndex:i - 1];
                i -= 2;
            };

    TypicalBlock add = ^{
        temp = [NSNumber numberWithDouble:(FirsArgument + SecondArgument)];
        cleaning();
    };
    TypicalBlock subtract = ^{
        temp = [NSNumber numberWithDouble:(FirsArgument - SecondArgument)];
        cleaning();
    };
    TypicalBlock multyply = ^{
        temp = [NSNumber numberWithDouble:(FirsArgument * SecondArgument)];
        cleaning();
    };
    TypicalBlock devide = ^{
        temp = [NSNumber numberWithDouble:(FirsArgument / SecondArgument)];
        cleaning();
    };
    TypicalBlock power = ^{
        temp = [NSNumber numberWithDouble:pow(FirsArgument, SecondArgument)];
        cleaning();
    };
    
    NSDictionary *computing = @{@"-" : subtract,
                               @"+" : add,
                               @"/" : devide,
                                @"*" : multyply,
                               @"^" : power,
                               };
    
    for ( i = 0; expression.count > 1; i++) {
        id element = [expression objectAtIndex:i];
        
        if ([operators containsObject:element]) {
            TypicalBlock runBlock = [computing valueForKey:element];
            runBlock();
        }
    }
    current = [[[[expression lastObject] stringValue] mutableCopy] autorelease];
}
@end
