#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    
    NSNumber *maxElem = [array valueForKeyPath:@"@max.self"];
    NSNumber *minElem = [array valueForKeyPath:@"@min.self"];
    NSInteger sum = [[array valueForKeyPath:@"@sum.self"] integerValue];

    NSNumber *minSum = [NSNumber numberWithInteger:sum - [maxElem integerValue]];
    NSNumber *maxSum = [NSNumber numberWithInteger:sum - [minElem integerValue]];
    
    return @[minSum, maxSum];
}

@end
