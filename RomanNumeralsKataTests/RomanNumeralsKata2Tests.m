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

- (void)testZeroConvertsToEmptyString
{
    NSNumber *arabicNumber = @0;

    NSString *romanNumber = [arabicNumber toRoman];

    XCTAssertEqualObjects(romanNumber, @"", @"Zero should convert to an empty string");
}

- (void)testOneConvertsToI
{
    NSNumber *arabicNumber = @1;

    NSString *romanNumber = [arabicNumber toRoman];

    XCTAssertEqualObjects(romanNumber, @"I", @"One should convert to I");
}

- (void)testFiveConvertsToV
{
    NSNumber *arabicNumber = @5;

    NSString *romanNumber = [arabicNumber toRoman];

    XCTAssertEqualObjects(romanNumber, @"V", @"Five should convert to V");
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
