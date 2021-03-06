//
//  RomanNumeralsKata2Tests.m
//  RomanNumeralsKata
//
//  Created by Marián Černý on 27.04.14.
//
//

#import <XCTest/XCTest.h>

@interface RomanNumeralsKata2Tests : XCTestCase
@end

@interface NSNumber (RomanNumeral)
- (NSString *)toRoman;
@end

@implementation RomanNumeralsKata2Tests

- (void)testConversion
{
    NSDictionary *conversionsToTest = @{@0: @"",
                                        @1: @"I",
                                        @2: @"II",
                                        @3: @"III",
                                        @4: @"IV",
                                        @5: @"V",
                                        @6: @"VI",
                                        @7: @"VII",
                                        @8: @"VIII",
                                        @9: @"IX",
                                        @10: @"X",
                                        @40: @"XL",
                                        @50: @"L",
                                        @90: @"XC",
                                        @100: @"C",
                                        @400: @"CD",
                                        @500: @"D",
                                        @900: @"CM",
                                        @1000: @"M",
                                        @1666: @"MDCLXVI",
                                        @1999: @"MCMXCIX",
                                        };

    [conversionsToTest enumerateKeysAndObjectsUsingBlock:^(NSNumber *arabicNumber, NSString *expectedRomanNumber, BOOL *stop) {
        NSString *romanNumber = [arabicNumber toRoman];

        XCTAssertEqualObjects(romanNumber, expectedRomanNumber, @"Failed to conver arabic number %@", arabicNumber);
    }];
}

@end

@implementation NSNumber (RomanNumeral)

- (NSString *)toRoman
{
    NSArray *replacements = @[
                              @[@1000, @"M"],
                              @[@900, @"CM"],
                              @[@500, @"D"],
                              @[@400, @"CD"],
                              @[@100, @"C"],
                              @[@90, @"XC"],
                              @[@50, @"L"],
                              @[@40, @"XL"],
                              @[@10, @"X"],
                              @[@9, @"IX"],
                              @[@5, @"V"],
                              @[@4, @"IV"],
                              @[@1, @"I"],
                              ];

    __block NSString *result = @"";

    [replacements enumerateObjectsUsingBlock:^(NSArray *pair, NSUInteger idx, BOOL *stop) {
        NSNumber *arabicNumber = pair[0];
        NSString *romanNumber = pair[1];

        if (self.integerValue >= arabicNumber.integerValue) {
            NSNumber *reminder = @(self.integerValue - arabicNumber.integerValue);
            result = [romanNumber stringByAppendingString:[reminder toRoman]];
            *stop = YES;
        }
    }];

    return result;
}

@end
