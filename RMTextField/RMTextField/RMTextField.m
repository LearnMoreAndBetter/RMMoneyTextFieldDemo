//
//  RMTextField.m
//  RMTextField
//
//  Created by 王林 on 2017/6/26.
//  Copyright © 2017年 CETC. All rights reserved.
//

#import "RMTextField.h"
#import "NSString+Expense.h"

@implementation RMTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
	self = [super initWithFrame:frame];
	if (self) {
		self.keyboardType = UIKeyboardTypeNumberPad;
	
		[self addTarget:self action:@selector(textFieldDidChanged:) forControlEvents:UIControlEventEditingChanged];
		self.moneyStr = @"0.00";
	}
	return self;
}


- (void)textFieldDidChanged:(UITextField *)textField{
	if ([self.moneyPreText length] < [textField.text length]) {
		//输入字符
		
		//新字符
		NSString *news = [textField.text substringFromIndex:[textField.text length] - 1];
		
		NSString *money = [NSString decimalNumberMutiplyWithString:self.moneyStr other:@"10"];
		NSString *decimalMoney = [NSString decimalNumberMutiplyWithString:news other:@"0.01"];
		
		money = [NSString decimalNumberAddWithString:money other:decimalMoney];
		
		//补0
		self.moneyStr = [NSString keepDesimalFormatWithString:money];
		
		textField.text = [NSString strmethodComma:self.moneyStr];
		self.moneyPreText = textField.text;
		
	}else if ([self.moneyPreText length] > [textField.text length]) {
		//退格
		if ([self.moneyStr doubleValue] <= 0) {
			textField.text = @"";
			self.moneyPreText = @"";
			return;
		}
		
		NSString *money = [NSString  decimalNumberDivideWithString:self.moneyStr other:@"10"];
		
		self.moneyStr = [NSString keepDesimalFormatWithString:money];
		
		textField.text = [NSString strmethodComma:self.moneyStr];;
		self.moneyPreText = textField.text;
	}
}


@end
