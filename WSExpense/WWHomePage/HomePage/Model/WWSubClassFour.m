//
//  WWSubClassFour.m
//  WSExpense
//
//  Created by APPLE on 2021/3/17.
//

#import "WWSubClassFour.h"

@implementation WWSubClassFour

- (double)getResult {
    double result = 0.00;
    
    @try{
        result = numberA/numberB;
    }
    @catch(NSException *exception) {
        NSLog(@"除数不能为0");
    }
    
    return result;
}

@end
