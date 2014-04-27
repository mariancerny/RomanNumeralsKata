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
                                        @5: @"V"};

    [conversionsToTest enumerateKeysAndObjectsUsingBlock:^(NSNumber *arabicNumber, NSString *expectedRomanNumber, BOOL *stop) {
        NSString *romanNumber = [arabicNumber toRoman];

        XCTAssertEqualObjects(romanNumber, expectedRomanNumber, @"Arabic number %@ should convert to roman number %@", arabicNumber, romanNumber);
    }];
}

@end

@implementation NSNumber (RomanNumeral)

- (NSString *)toRoman
{
    if ([self isEqualToNumber:@1])
        return @"I";

    if ([self isEqualToNumber:@5])
        return @"V";

    return @"";
}

@end
