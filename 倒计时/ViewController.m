//
//  ViewController.m
//  倒计时
//
//  Created by 王奥东 on 16/7/5.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(strong,nonatomic)UILabel *timeLabel;
@property(strong,nonatomic)NSTimer *time;
@property(assign,nonatomic)int i;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
}
-(void)setupUI{
    self.i = 60;
    self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 200, 30, 30)];
    [self.view addSubview:self.timeLabel];
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 200, 100)];
    [btn setTitle:@"暂停" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(0, 600, 200, 100)];
    [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn2 setTitle:@"继续" forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor greenColor];
    [btn2 addTarget:self action:@selector(clickBtn2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    
    
    NSTimer *time = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(labelSet) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop]addTimer:time forMode:NSDefaultRunLoopMode];
    
    self.time = time;
}
-(void)labelSet{
    self.i -- ;
    self.timeLabel.text = [NSString stringWithFormat:@"%d",self.i];
    
    if (self.i == 0) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
}
-(void)clickBtn{
    
    [self.time invalidate];
    self.time = nil;
    
}
-(void)clickBtn2{
    
    if(!self.time){
        self.time =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(labelSet) userInfo:nil repeats:YES];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
