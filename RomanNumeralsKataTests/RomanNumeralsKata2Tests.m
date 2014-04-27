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

@end

@implementation NSNumber (RomanNumeral)

- (NSString *)toRoman
{
    return @"";
}

@end
