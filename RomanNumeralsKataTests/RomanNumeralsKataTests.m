//
//  RomanNumeralsKataTests.m
//  RomanNumeralsKataTests
//
//  Created by Marián Černý on 27.03.14.
//
//

#import <XCTest/XCTest.h>

@interface RomanNumeralsKataTests : XCTestCase

@end

@implementation NSNumber (MCToRomanConversion)

- (NSString *)toRoman
{
    NSMutableString *romanNumeral = [[NSMutableString alloc] init];
    __block NSInteger value = self.integerValue;

    NSArray *substractions = @[ @[@1000, @"M"],
                                @[@900, @"CM"],
                                @[@500, @"D"],
                                @[@100, @"C"],
                                @[@90, @"XC"],
                                @[@50, @"L"],
                                @[@40, @"XL"],
                                @[@10, @"X"],
                                @[@9, @"IX"],
                                @[@5, @"V"],
                                @[@4, @"IV"],
                                @[@1, @"I"] ];

    [substractions enumerateObjectsUsingBlock:^(NSArray *pairs, NSUInteger idx, BOOL *stop) {
        NSNumber *arabic = pairs[0];
        NSString *roman = pairs[1];

        while (value >= arabic.integerValue) { [romanNumeral appendString:roman]; value -= arabic.integerValue; }
    }];

    return romanNumeral;
}

@end

@implementation RomanNumeralsKataTests

- (void)testValidConversions
{
    NSDictionary *validConversions = @{
                                       @0: @"",
                                       @1: @"I",
                                       @4: @"IV",
                                       @5: @"V",
                                       @8: @"VIII",
                                       @9: @"IX",
                                       @10: @"X",
                                       @20: @"XX",
                                       @40: @"XL",
                                       @50: @"L",
                                       @80: @"LXXX",
                                       @90: @"XC",
                                       @100: @"C",
                                       @500: @"D",
                                       @900: @"CM",
                                       @1000: @"M",
                                       @1666: @"MDCLXVI",
                                       @1999: @"MCMXCIX",
                                       };
    [validConversions enumerateKeysAndObjectsUsingBlock:^(NSNumber *number, NSString *romanNumeral, BOOL *stop) {
        [self assertNumber:number convertsToRomanNumeral:romanNumeral];
    }];
}

- (void)assertNumber:(NSNumber *)number convertsToRomanNumeral:(NSString *)romanNumeral
{
    XCTAssertEqualObjects([number toRoman], romanNumeral, @"Number %@ should be converted to roman numeral %@.", number, romanNumeral);
}

@end
