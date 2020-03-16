#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    int billSum = 0;
    for (NSNumber *price in bill) {
        if (![price isEqualToNumber:[bill objectAtIndex:index]]) {
            billSum += [price intValue];
        }
    }
    if ([sum isEqualToNumber:[NSNumber numberWithInt:billSum/2]]) {
        return @"Bon Appetit";
    } else {
        return [NSString stringWithFormat:@"%d", [sum intValue] - billSum/2];
    }
}

@end
