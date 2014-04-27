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
                                        @5: @"V",
                                        @10: @"X"};

    [conversionsToTest enumerateKeysAndObjectsUsingBlock:^(NSNumber *arabicNumber, NSString *expectedRomanNumber, BOOL *stop) {
        NSString *romanNumber = [arabicNumber toRoman];

        XCTAssertEqualObjects(romanNumber, expectedRomanNumber, @"Arabic number %@ should convert to roman number %@", arabicNumber, romanNumber);
    }];
}

@end

@implementation NSNumber (RomanNumeral)

- (NSString *)toRoman
{
    NSDictionary *replacements = @{@1: @"I",
                                   @5: @"V",
                                   @10: @"X"};

    __block NSString *result = @"";

    [replacements enumerateKeysAndObjectsUsingBlock:^(NSNumber *arabicNumber, NSString *romanNumber, BOOL *stop) {
        if ([self isEqualToNumber:arabicNumber])
            result = romanNumber;
    }];

    return result;
}

@end
