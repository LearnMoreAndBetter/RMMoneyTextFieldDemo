# RMMoneyTextFieldDemo
金额输入按照元角分格式，不需要输入小数点

http://blog.csdn.net/qq_25303213/article/details/73733144

最近项目中需要实现一个功能：
1. 输入金额时，按照元角分格式输入，不需要输入小数点。比如输入1，就显示0.01，再输入2，变为0.12，再输入3，变成1.23。。。以此类推~（功能虽然奇葩了点，但是还是要去实现的）
2. 保留两位小数
3. 不限制金额长度
4. 小数点前整数部分过三位数，加逗号分隔

我的思路
1. 监听textField输入框的变化
2. 通过计算得到当前金额
3. 根据要求处理数据的显示

具体操作
1. 给textField添加监听，监听输入框中text的改变
2. 用self.moneyPreText存储上一个textfield中的text文本（包括‘,’）
3.用self.moneyStr存储上一次金额的数据
4. 在textFieldDidChanged时通过比对当前的text与self.moneyPreText的长度，判断是输入字符还是做退格操作
5.输入字符时，取当前text的最后一个字符，即为新输入的字符，通过计算得到当前的金额信息：上一次金额 * 10 + 新字符 * 0.01 = 当前金额；
6.做退格操作时，通过计算得到当前的金额信息：上一次金额 / 10 = 当前金额；
7.再对当前的金额做处理，保留两位小数，小数点前整数部分过三位数，加逗号分隔

项目中遇到的问题
1. double类型数据进行加减乘除运算时，存在数据失真情况。比如12345678901234.56 * 10 = 123456789012345.609375，计算出来的当前金额就会数据错乱。
2.数据字符串过长时，转double类型会数据错乱

所以本项目中全部采用的字符串代替加减乘除运算，避免数据错乱问题

#import "NSString+Expense.h"

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
