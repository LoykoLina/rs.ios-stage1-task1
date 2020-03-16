#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    if ([sadArray count] != 0) {
        NSMutableArray *happyArray = [sadArray mutableCopy];
        
        NSUInteger index = 1;
        while (index < [happyArray count] - 1) {
            NSInteger currentNumber = [happyArray[index] intValue];
            NSInteger previousNumber = [happyArray[index-1] intValue];
            NSInteger nextNumber = [happyArray[index+1] intValue];

            if (previousNumber + nextNumber < currentNumber) {
                [happyArray removeObjectAtIndex:index];
                if (index != 1) index--;
            } else index++;
        }
        return happyArray;
    }
    return @[];
}

@end
