//
//  ViewController.m
//  20160428001-CustomTabBarViewController-PresentAndChildViewController
//
//  Created by Rainer on 16/4/28.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "ViewController.h"
#import "PayTableViewController.h"
#import "PayForSandPayViewController.h"
#import "PayForBankViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *tabBarView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)payButtonClickAction:(id)sender {
    PayTableViewController *payTableViewController = [[PayTableViewController alloc] init];
    
    payTableViewController.view.frame = CGRectMake(0, CGRectGetMaxY(self.tabBarView.frame), self.view.frame.size.width, self.view.frame.size.height - CGRectGetMaxY(self.tabBarView.frame));
    
    [self.view addSubview:payTableViewController.view];
}
- (IBAction)PayForSandPayButtonClickAction:(id)sender {
    PayForSandPayViewController *payForSandPayViewController = [[PayForSandPayViewController alloc] init];
    
    payForSandPayViewController.view.frame = CGRectMake(0, CGRectGetMaxY(self.tabBarView.frame), self.view.frame.size.width, self.view.frame.size.height - CGRectGetMaxY(self.tabBarView.frame));
    
    [self.view addSubview:payForSandPayViewController.view];
}
- (IBAction)payForBankButtonClickAction:(id)sender {
    PayForBankViewController *payForBankViewController = [[PayForBankViewController alloc] init];
    
    payForBankViewController.view.frame = CGRectMake(0, CGRectGetMaxY(self.tabBarView.frame), self.view.frame.size.width, self.view.frame.size.height - CGRectGetMaxY(self.tabBarView.frame));
    
    [self.view addSubview:payForBankViewController.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
