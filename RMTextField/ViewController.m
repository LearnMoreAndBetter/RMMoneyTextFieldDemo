//
//  ViewController.m
//  RMTextField
//
//  Created by 王林 on 2017/6/26.
//  Copyright © 2017年 CETC. All rights reserved.
//

#import "ViewController.h"
#import "RMTextField.h"

@interface ViewController ()

@property (strong, nonatomic)RMTextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
	
	[self.view addSubview:self.textField];
	
	CALayer *lineLayer = [CALayer layer];
	lineLayer.frame = CGRectMake(30, 150, [UIScreen mainScreen].bounds.size.width - 60, 2);
	lineLayer.backgroundColor = [UIColor redColor].CGColor;
	[self.view.layer addSublayer:lineLayer];
	
	double x = 12345678901234.56;
	NSLog(@"%f", x * 10);
	
	NSString *y = @"12345678901234.56";
	NSLog(@"%f", [y doubleValue]);
}


- (RMTextField *)textField{
	if (!_textField) {
		_textField = [[RMTextField alloc]initWithFrame:CGRectMake(30, 100, [UIScreen mainScreen].bounds.size.width - 60, 50)];
		_textField.placeholder = @"请输入金额";
		_textField.tintColor = [UIColor redColor];
		_textField.font = [UIFont systemFontOfSize:20];
		_textField.textColor = [UIColor redColor];
	}
	return _textField;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
