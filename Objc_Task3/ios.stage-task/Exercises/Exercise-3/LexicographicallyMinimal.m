#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSString* resultString = @"";
    if (string1.length == 0 && string2.length == 0) {
        return resultString;
    }
    if ([self isFirstLowerThan:string1 second:string2]) {
        NSString* newFirstString = string1.length < 2 ? @"" : [string1 substringFromIndex:1];
        NSString* addditionalString = [self findLexicographicallyMinimalForString1:newFirstString andString2:string2];
        resultString = [NSString stringWithFormat:@"%c", [string1 characterAtIndex:0]];
        resultString = [resultString stringByAppendingString:addditionalString];
    } else {
        NSString* newSecondString = string2.length < 2 ? @"" : [string2 substringFromIndex:1];
        NSString* addditionalString = [self findLexicographicallyMinimalForString1:string1 andString2:newSecondString];
        resultString = [NSString stringWithFormat:@"%c", [string2 characterAtIndex:0]];
        resultString = [resultString stringByAppendingString:addditionalString];
    }

    return resultString;
}

-(BOOL) isFirstLowerThan:(NSString *) string1 second:(NSString *)string2 {
    if (string2.length == 0) {
        return YES;
    }
    if (string1.length == 0) {
        return NO;
    }
    if ([string1 characterAtIndex:0] < [string2 characterAtIndex:0]) {
        return YES;
    } else if ([string1 characterAtIndex:0] == [string2 characterAtIndex:0]) {
        NSString* newFirstString = string1.length == 1 ? @"" : [string1 substringFromIndex:1];
        NSString* newSecondString = string2.length == 1 ? @"" : [string2 substringFromIndex:1];
        return [self isFirstLowerThan:newFirstString second:newSecondString];
    }
    return NO;
}

@end
