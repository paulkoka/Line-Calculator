//
//  KPILineCalculator.h
//  Line-Calculator
//
//  Created by paul on 4/21/18.
//  Copyright © 2018 Paul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KPILineCalculator : NSObject

+(KPILineCalculator *)defaultValue:(NSNumber *) number;

-(KPILineCalculator *) add:(NSNumber *) number;
-(KPILineCalculator *) subtract:(NSNumber *) number;
-(KPILineCalculator *) multiply:(NSNumber *) number;
-(KPILineCalculator *) devide:(NSNumber *) number;
-(KPILineCalculator *) pow:(NSNumber *) number;

@end
