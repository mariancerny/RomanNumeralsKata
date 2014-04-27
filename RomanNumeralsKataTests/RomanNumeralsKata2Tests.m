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
                                        @10: @"X"};

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
                              @[@10, @"X"],
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
