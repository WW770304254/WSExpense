//
//  WWFatherClass.h
//  WSExpense
//
//  Created by APPLE on 2021/3/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WWFatherClass : NSObject {
    double numberA;
    double numberB;
}

@property (nonatomic, assign)double numberA;
@property (nonatomic, assign)double numberB;

- (double)getResult;

@end

NS_ASSUME_NONNULL_END
