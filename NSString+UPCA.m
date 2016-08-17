//
//  NSString+UPCA.m
//  UPCEtoUPCAOBJC
//
//  Created by Anil on 31/03/16.
//  Copyright © 2016 Anil. All rights reserved.
//

#import "NSString+UPCA.h"

@implementation NSString (UPCA)

-(char)firstChar {
    char toReturn;
    if (self.length > 0) {
        toReturn = [self characterAtIndex:0];
    }
    return toReturn;
}

-(char)lastChar {
    char toReturn;
    if (self.length > 0) {
        toReturn = [self characterAtIndex:self.length - 1];
    }
    return toReturn;
}

- (BOOL)isLastChar:(char)character {
    BOOL result = NO;
    if (character == [self lastChar]) {
        result = YES;
    }
    return result;
}

- (NSString *)upcaCode{
    NSString *upca = self;
    char firstCharacter = [upca firstChar];
    char lastCharacter = [upca lastChar];
    NSString *stringToBeConvert = [self subStringToBeConvertToUPCA:self];
    
    if ([stringToBeConvert isLastChar:'0'] || [stringToBeConvert isLastChar:'1'] || [stringToBeConvert isLastChar:'2'] ) {
        upca = [NSString stringWithFormat:@"%c%@%c",firstCharacter,[self upcaForZeroOneAndTwo:stringToBeConvert],lastCharacter];
    }
    else if ([stringToBeConvert isLastChar:'3']){
        upca = [NSString stringWithFormat:@"%c%@%c",firstCharacter,[self upcaForThree:stringToBeConvert],lastCharacter];
    }
    else if ([stringToBeConvert isLastChar:'4']){
        upca = [NSString stringWithFormat:@"%c%@%c",firstCharacter,[self upcaForFour:stringToBeConvert],lastCharacter];
    }
    else if ([stringToBeConvert isLastChar:'5'] || [stringToBeConvert isLastChar:'6'] || [stringToBeConvert isLastChar:'7'] || [stringToBeConvert isLastChar:'8'] || [stringToBeConvert isLastChar:'9']){
        upca = [NSString stringWithFormat:@"%c%@%c",firstCharacter,[self upcaForFiveSixSevenEightAndNine:stringToBeConvert],lastCharacter];
    }
    
    return upca;
}

//returns the part of string on which conversation has to do.
- (NSString *)subStringToBeConvertToUPCA:(NSString *)upce {
    NSString *subStringToBeConvert;
    NSRange subStringrange = NSMakeRange(1, upce.length - 2);
    subStringToBeConvert = [upce substringWithRange:subStringrange];
    return subStringToBeConvert;
}

- (NSString *)upcaForZeroOneAndTwo:(NSString *)stringtoConvert {
    NSString *upca;
    NSRange firstTwoCharRange = NSMakeRange(0, 2);
    NSString *firstTwoCharsOfUPCECode = [stringtoConvert substringWithRange:firstTwoCharRange];
    char lastCharOFUPCECode = [stringtoConvert lastChar];
    NSString *fourZero = @"0000";
    NSRange rangeOfThreeDigitsWithFourthIndex = NSMakeRange(2, 3);
    NSString *threeDigitsWithFourthIndex = [stringtoConvert substringWithRange:rangeOfThreeDigitsWithFourthIndex];
    upca = [NSString stringWithFormat:@"%@%c%@%@",firstTwoCharsOfUPCECode,lastCharOFUPCECode,fourZero,threeDigitsWithFourthIndex];
    return upca;
}

- (NSString *)upcaForThree:(NSString *)stringtoConvert {
    NSString *upca;
    
    NSRange firstThreeCharRange = NSMakeRange(0, 3);
    NSString *firstThreeCharOfUPCECode =  [stringtoConvert substringWithRange:firstThreeCharRange];
    NSString *fiveZeros = @"00000";
    NSRange rangeOfFourthAndFivethCharOfUPCECode = NSMakeRange(3, 2);
    NSString *fourthAndFivethCharOfUPCECode = [stringtoConvert substringWithRange:rangeOfFourthAndFivethCharOfUPCECode];
    upca = [NSString stringWithFormat:@"%@%@%@",firstThreeCharOfUPCECode,fiveZeros,fourthAndFivethCharOfUPCECode];
    return upca;
}

- (NSString *)upcaForFour:(NSString *)stringtoConvert {
    NSString *upca;
    NSRange firstFourCharRange = NSMakeRange(0, 4);
    NSString *firstFourCharOfUPCECode =  [stringtoConvert substringWithRange:firstFourCharRange];
    NSString *fiveZeros = @"00000";
    char fifthCharOfUPCECode = [stringtoConvert characterAtIndex:4];
    upca = [NSString stringWithFormat:@"%@%@%c",firstFourCharOfUPCECode,fiveZeros,fifthCharOfUPCECode];
    return upca;
}

- (NSString *)upcaForFiveSixSevenEightAndNine:(NSString *)stringtoConvert {
    NSString *upca;
    NSRange firstFiveCharRange = NSMakeRange(0, 5);
    NSString *firstFiveCharOfUPCECode =  [stringtoConvert substringWithRange:firstFiveCharRange];
    NSString *fourZero = @"0000";
    char lastCharOfUPCECode = [stringtoConvert lastChar];
    upca = [NSString stringWithFormat:@"%@%@%c",firstFiveCharOfUPCECode,fourZero,lastCharOfUPCECode];
    return upca;
}

@end
