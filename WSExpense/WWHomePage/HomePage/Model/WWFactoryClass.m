//
//  WWFactoryClass.m
//  WSExpense
//
//  Created by APPLE on 2021/3/17.
//

#import "WWFactoryClass.h"

@implementation WWFactoryClass

+ (WWFatherClass *)createWWFactory:(char)factory {
    WWFatherClass *father;
    switch (factory) {
        case '+':
            father = [[WWSubClassOne alloc] init];
            break;
        case '-':
            father = [[WWSubClassTwo alloc] init];
            break;
        case '*':
            father = [[WWSubClassThree alloc] init];
            break;
        case '/':
            father = [[WWSubClassFour alloc] init];
            break;
            
        default:
            break;
    }
    return father;;
}

@end
