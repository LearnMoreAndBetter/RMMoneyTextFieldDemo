//
//  NSString+Expense.h
//  RMTextField
//
//  Created by 王林 on 2017/6/26.
//  Copyright © 2017年 CETC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Expense)


/**
 数字过三位加逗号间隔，可为小数
 
 @param str 金额数字
 @return 格式化的字符
 */
+ (NSString*)strmethodComma:(NSString*)str;


/**
 处理double类型数据的乘法 避免精度误差
 
 @param multiplierValue 乘数
 @param multiplicandValue 被乘数
 @return 算式结果
 */
+ (NSString *)decimalNumberMutiplyWithString:(NSString *)multiplierValue other:(NSString *)multiplicandValue;

/**
 处理double类型数据的除法 避免精度误差
 
 @param beDividedValue 被除数
 @param divideValue 除数
 @return 算式结果
 */
+ (NSString *)decimalNumberDivideWithString:(NSString *)beDividedValue other:(NSString *)divideValue;

/**
 处理double类型数据的加法 避免精度误差
 
 @param addValue1 加数
 @param addValue2 加数
 @return 算式结果
 */
+ (NSString *)decimalNumberAddWithString:(NSString *)addValue1 other:(NSString *)addValue2;

//保留小数点后两位，不足补0 (字符串操作) 避免精度误差
+ (NSString *)keepDesimalFormatWithString:(NSString *)string;



@end
