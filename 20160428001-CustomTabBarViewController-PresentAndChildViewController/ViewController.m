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

/**
 *  总结：
 *  1.父子控制器，如果一个控制器的view添加到另外一个控制器的view上，那么这个控制器也应当添加到这个控制器上
 *    如：［BController.view addSubview:AController.view］那么应该有[AController addChildViewController:BController];
 *  2.如果两个控制器的view是父子关系，那么这两个控制器也应当是父子关系。
 *  3.父控制器移除子控制器的方法为：[childViewController removeFromParentViewController];
 *  4.添加子控制器的方法为：[parentViewViewController addChildViewController:childViewController];
 *  5.获取父控制器的方法为：[childViewController parentViewController]
 *  6.获取某个控件子父控件中的位置：[subview.superview.subviews indexOfObject:subview]
 */
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *tabBarView;

/** 当前选中控制器 */
@property (nonatomic, strong) UIViewController *showViewController;

@property (nonatomic, weak) UIView *contentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 将控制器添加为当前控制器的子控制器
    [self addChildViewController:[[PayTableViewController alloc] init]];
    [self addChildViewController:[[PayForSandPayViewController alloc] init]];
    [self addChildViewController:[[PayForBankViewController alloc] init]];
}

/**
 *  按钮点击切换试图
 */
- (IBAction)changeViewControllerButtonClickAction:(UIButton *)button {
    // 1.获取当前点击按钮在父试图中的位置
    NSUInteger index = [button.superview.subviews indexOfObject:button];
    
    // 2.获取当前显示控制器在子控制器中的位置
    NSUInteger oldIndex = [self.childViewControllers indexOfObject:self.showViewController];
    
    // 3.当前点击要切换的控制器和已显示的控制器位置相同则不跳转
    if (index == oldIndex) return;
    
    // 3.先移除当前显示的控制器试图
    [self.showViewController.view removeFromSuperview];
    
    // 4.根据按钮的位置取出子控制器数组中对应位置的控制器
    self.showViewController = self.childViewControllers[index];
    
    // 5.设置当前位置子控制器试图的位置
    self.showViewController.view.frame = self.contentView.bounds;
    
    // 6.将当前子控制器的试图添加到当前控制器的试图上
    [self.contentView addSubview:self.showViewController.view];
    
    // 7.添加转场动画
    CATransition *transition = [[CATransition alloc] init];
    
    // 7.1.动画类型
    transition.type = @"cube";
    // 7.2.动画时长
    transition.duration = 0.25;
    // 7.3.动画方向
    transition.subtype = index > oldIndex ? kCATransitionFromRight : kCATransitionFromLeft;
    // 7.4.将动画添加到内容试图的layer层上
    [self.contentView.layer addAnimation:transition forKey:nil];
}

/**
 *  懒加载创建内容试图
 */
- (UIView *)contentView {
    if (nil == _contentView) {
        UIView *contentView = [[UIView alloc] init];
        
        contentView.frame = CGRectMake(0, CGRectGetMaxY(self.tabBarView.frame), self.view.frame.size.width, self.view.frame.size.height - CGRectGetMaxY(self.tabBarView.frame));
        
        _contentView = contentView;
        
        [self.view addSubview:_contentView];
    }
    
    return _contentView;
}

/**
 *  屏幕即将旋转到某个方向
 */
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    NSLog(@"%s", __func__);
}

@end
