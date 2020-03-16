#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    NSMutableArray <NSNumber*> *mismatchedPositions = [NSMutableArray new];
    NSMutableArray <NSNumber*> *numbers = [self getArrayOfNumbersFromString:s];

    for (NSInteger i = 0; i < [n integerValue]/2; i++) {
        if ([numbers objectAtIndex:i] != [numbers objectAtIndex:[n integerValue]-1-i]) {
            [mismatchedPositions addObject:[NSNumber numberWithInteger:i]];
        }
    }
    
    if ([mismatchedPositions count] > [k intValue]) {
        return @"-1";
    }
    
    int allowedChanges = [k intValue];
    for (NSNumber *posIndex in mismatchedPositions) {
        NSInteger leftPosition = [posIndex intValue];
        NSInteger rightPosition = [n integerValue]-1-[posIndex intValue];
        
        if ([mismatchedPositions count] != [k intValue] || allowedChanges > 1) {
            [numbers replaceObjectAtIndex:leftPosition withObject:@9];
            [numbers replaceObjectAtIndex:rightPosition withObject:@9];
            allowedChanges -= 2;
        } else {
            if ([numbers[leftPosition] integerValue] < [numbers[rightPosition] integerValue]) {
                [numbers replaceObjectAtIndex:leftPosition withObject:numbers[rightPosition]];
            } else {
                [numbers replaceObjectAtIndex:rightPosition withObject:numbers[leftPosition]];
            }
        }
    }
    
    return [numbers componentsJoinedByString:@""];
}

- (NSMutableArray *) getArrayOfNumbersFromString:(NSString *) str {
    NSMutableArray <NSNumber*> *numbers = [NSMutableArray new];
    for (int i = 0; i < [str length]; i++) {
        int digit = [str characterAtIndex:i] - '0';
        [numbers addObject:[NSNumber numberWithInt:digit]];
    }
    return numbers;
}

@end
