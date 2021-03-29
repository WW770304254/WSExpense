//
//  WWFactoryClass.h
//  WSExpense
//
//  Created by APPLE on 2021/3/17.
//

#import <Foundation/Foundation.h>

#import "WWSubClassOne.h"
#import "WWSubClassTwo.h"
#import "WWSubClassThree.h"
#import "WWSubClassFour.h"

NS_ASSUME_NONNULL_BEGIN

@interface WWFactoryClass : NSObject

+ (WWFatherClass *)createWWFactory:(char)factory;

@end

NS_ASSUME_NONNULL_END
