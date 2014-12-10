//
//  ViewController.m
//  OPENUDID+KEYCHAIN
//
//  Created by Adan on 14/12/10.
//  Copyright (c) 2014年 Adan. All rights reserved.
//

#import "ViewController.h"
#import "CHKeychain.h"

@interface ViewController ()
{
    UITextField * textField;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    textField = [[UITextField alloc]init];
    
    [textField setFrame:CGRectMake(50, 100, 200, 30)];
    [textField setBackgroundColor:[UIColor grayColor]];
    
    [self.view addSubview:textField];
    
    UIButton * btnSave = [[UIButton alloc]init];
    [btnSave setFrame:CGRectMake(60, 150, 80, 50)];
    [btnSave setTitle:@"保存" forState:UIControlStateNormal];
    [btnSave setBackgroundColor:[UIColor redColor]];
    [btnSave addTarget:self action:@selector(saveButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnSave];
    
    UIButton * btnRead = [[UIButton alloc]init];
    [btnRead setFrame:CGRectMake(160, 150, 80, 50)];
    [btnRead setTitle:@"读取" forState:UIControlStateNormal];
    [btnRead setBackgroundColor:[UIColor redColor]];
    [btnRead addTarget:self action:@selector(readButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnRead];
    
    UIButton * btnDelete = [[UIButton alloc]init];
    [btnDelete setFrame:CGRectMake(100, 250, 80, 50)];
    [btnDelete setTitle:@"删除" forState:UIControlStateNormal];
    [btnDelete setBackgroundColor:[UIColor redColor]];
    [btnDelete addTarget:self action:@selector(deleteButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnDelete];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)saveButtonAction
{
    NSString * text = textField.text;
    
    [CHKeychain saveByKey:@"test" data:text];
}

-(void)readButtonAction
{
     NSString * text = [CHKeychain readByKey:@"test"];
    
    textField.text = text;
}

-(void)deleteButtonAction
{
    [CHKeychain deleteByKey:@"test"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
