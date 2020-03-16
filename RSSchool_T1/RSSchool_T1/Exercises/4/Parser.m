#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    
    NSMutableArray <NSString*> *result = [NSMutableArray new];
    NSMutableArray <NSNumber *> *circleClosePos = [NSMutableArray new];
    NSMutableArray <NSNumber *> *squareClosePos = [NSMutableArray new];
    NSMutableArray <NSNumber *> *triangleClosePos = [NSMutableArray new];
    
    for (NSInteger i = [string length] - 1; i >= 0; i--) {
        switch ([string characterAtIndex:i]) {
            case ')':
                [circleClosePos addObject:[NSNumber numberWithInteger:i]];
                break;
            case '(':
            {
                NSInteger endRange = [[circleClosePos lastObject] intValue] ;
                NSInteger startRange = i + 1;
                [result addObject:[string substringWithRange: NSMakeRange(startRange, endRange - startRange)]];
                [circleClosePos removeLastObject];
            }
                break;
            case '[':
            {
                NSInteger endRange = [[squareClosePos lastObject] intValue] ;
                NSInteger startRange = i + 1;
                [result addObject:[string substringWithRange: NSMakeRange(startRange, endRange - startRange)]];
                [squareClosePos removeLastObject];
            }
                break;
            case ']':
                [squareClosePos addObject:[NSNumber numberWithInteger:i]];
                break;
            case '<':
            {
                NSInteger endRange = [[triangleClosePos lastObject] intValue] ;
                NSInteger startRange = i + 1;
                [result addObject:[string substringWithRange: NSMakeRange(startRange, endRange - startRange)]];
                [triangleClosePos removeLastObject];
            }
                break;
            case '>':
                [triangleClosePos addObject:[NSNumber numberWithInteger:i]];
                break;
            default:
                break;
        }
    }
    
    return [[result reverseObjectEnumerator] allObjects];
}

@end
