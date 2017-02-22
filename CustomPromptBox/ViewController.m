//
//  ViewController.m
//  CustomPromptBox
//
//  Created by bihu_Mac on 2017/2/22.
//  Copyright © 2017年 initial. All rights reserved.
//

#import "ViewController.h"
#import "PromptBoxView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"定制提示框";
   
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.center = self.view.center;
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClick{
    PromptBoxView *prom = [[PromptBoxView  alloc] initWithFrame:self.view.bounds WithTitle:nil andTitleColor:nil andPromptViewAlpha:0.2 addpromptViewY:0 andpromptViewColor:nil andAnimateShowTime:2];
   
    [[UIApplication sharedApplication].keyWindow addSubview:prom];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
