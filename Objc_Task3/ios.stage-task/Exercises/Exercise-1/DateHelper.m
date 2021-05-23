#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if (monthNumber <= 0 || monthNumber > 12) {
        return nil;
    }
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    return [[formatter monthSymbols] objectAtIndex:(monthNumber - 1)];
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    NSString* dateFormat1 = @"yyyy-MM-dd'T'HH:mm:ssZ";
    [formatter setDateFormat:dateFormat1];
    NSDate* dateFromString = [formatter dateFromString:date];
    if (dateFromString == nil) {
        return 0;
    }
    NSCalendar* calendar = [NSCalendar autoupdatingCurrentCalendar];
    [calendar setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    return [calendar component:NSCalendarUnitDay fromDate:dateFromString];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSCalendar* calendar = [NSCalendar autoupdatingCurrentCalendar];
    [calendar setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSLocale* locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    [calendar setLocale:locale];
    NSInteger weekDayIdx = [calendar component:NSCalendarUnitWeekday fromDate:date];
    if (weekDayIdx == NULL) {
        return nil;
    }
    return [calendar shortWeekdaySymbols][weekDayIdx];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSDate* nowDate = [NSDate now];
    NSCalendar* calendar = [NSCalendar autoupdatingCurrentCalendar];
    return [calendar component:NSCalendarUnitWeekOfMonth fromDate:date] ==
    [calendar component:NSCalendarUnitWeekOfMonth fromDate:nowDate];
}

@end
