//
//  NSString+Expense.m
//  RMTextField
//
//  Created by 王林 on 2017/6/26.
//  Copyright © 2017年 CETC. All rights reserved.
//

#import "NSString+Expense.h"

@implementation NSString (Expense)


+ (NSString*)strmethodComma:(NSString*)str
{
	
	NSString *intStr;
	
	NSString *floStr;
	
	if ([str containsString:@"."]) {
		
		NSRange range = [str rangeOfString:@"."];
		
		floStr = [str substringFromIndex:range.location];
		
		intStr = [str substringToIndex:range.location];
		
	}else{
		
		floStr = @"";
		
		intStr = str;
		
	}
	
	if (intStr.length <=3) {
		
		return [intStr stringByAppendingString:floStr];
		
	}else{
		
		NSInteger length = intStr.length;
		
		NSInteger count = length/3;
		
		NSInteger y = length%3;
		
		
		NSString *tit = [intStr substringToIndex:y] ;
		
		NSMutableString *det = [[intStr substringFromIndex:y] mutableCopy];
		
		
		for (int i =0; i < count; i ++) {
			
			NSInteger index = i + i *3;
			
			[det insertString:@","atIndex:index];
			
		}
		
		if (y ==0) {
			
			det = [[det substringFromIndex:1]mutableCopy];
			
		}
		
		intStr = [tit stringByAppendingString:det];
		
		return [intStr stringByAppendingString:floStr];
		
	}
}

+ (NSString *)decimalNumberMutiplyWithString:(NSString *)multiplierValue other:(NSString *)multiplicandValue{
	NSDecimalNumber *multiplierNumber = [NSDecimalNumber decimalNumberWithString:multiplierValue];
	NSDecimalNumber *multiplicandNumber = [NSDecimalNumber decimalNumberWithString:multiplicandValue];
	NSDecimalNumber *product = [multiplicandNumber decimalNumberByMultiplyingBy:multiplierNumber];
	return [product stringValue];
}

+ (NSString *)decimalNumberDivideWithString:(NSString *)beDividedValue other:(NSString *)divideValue{
	NSDecimalNumber *beDividedNumber = [NSDecimalNumber decimalNumberWithString:beDividedValue];
	NSDecimalNumber *divideNumber = [NSDecimalNumber decimalNumberWithString:divideValue];
	NSDecimalNumber *product = [beDividedNumber decimalNumberByDividingBy:divideNumber];
	return [product stringValue];
}

+ (NSString *)decimalNumberAddWithString:(NSString *)addValue1 other:(NSString *)addValue2{
	NSDecimalNumber *addNumber1 = [NSDecimalNumber decimalNumberWithString:addValue1];
	NSDecimalNumber *addNumber2 = [NSDecimalNumber decimalNumberWithString:addValue2];
	NSDecimalNumber *product = [addNumber1 decimalNumberByAdding:addNumber2];
	return [product stringValue];
}

//保留小数点后两位，不足补0 (字符串操作)
+ (NSString *)keepDesimalFormatWithString:(NSString *)string{
	NSString *desimalString = [string copy];
	for (NSInteger i = 0; i < 2; i ++) {
		NSRange range = [desimalString rangeOfString:@"."];
		if (range.location == NSNotFound) {
			desimalString = [desimalString stringByAppendingString:@".00"];
			break;
		}
		NSString *subMoney = [desimalString substringFromIndex:range.location + 1];
		if ([subMoney length] < 2) {
			desimalString = [desimalString stringByAppendingString:@"0"];
		}else{
			desimalString = [desimalString substringToIndex:range.location + 3];
		}
		
	}
	return desimalString;
}



@end
