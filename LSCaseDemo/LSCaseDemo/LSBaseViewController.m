//
//  LSBaseViewController.m
//  LSDevModel3
//
//  Created by Sen on 16/2/20.
//  Copyright © 2016年 sen. All rights reserved.
//

#import "LSBaseViewController.h"

#import "LScanningViewController.h"



@interface LSBaseViewController ()


@end

@implementation LSBaseViewController
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //背景
    self.view.backgroundColor = kBGC_contentView;
    
    kBGC_navBar(kColor_themeWithAlpha(1));
    kColor_navbarTitle([UIColor whiteColor]);
    kColor_navbarTintColor([UIColor whiteColor]);
    
    self.navigationController.navigationBar.translucent = NO;
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    //
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:self.hiddedNavBar animated:YES];
    self.closeCebianMoveout = NO;
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
    [SVProgressHUD dismiss];
}

#pragma mark - 基本设置

- (void)setHiddedNavBar:(BOOL)hiddedNavBar{
    //
    _hiddedNavBar = hiddedNavBar;
    
    if (_hiddedNavBar) {self.edgesForExtendedLayout = UIRectEdgeNone;}
}

- (void)setIsTabbar:(BOOL)isTabbar{
    //
    _isTabbar = isTabbar;
    self.hiddedBackBtn = _isTabbar;
    
}

- (void)setNavTitle:(NSString *)navTitle{
    //
    _navTitle = navTitle;
    self.navigationItem.title = _navTitle;
    
    //
//    [self addBackButton];
}
- (void)setHiddedBackBtn:(BOOL)hiddedBackBtn{
    _hiddedBackBtn = hiddedBackBtn;
    
}

- (void)setFullSlidePopBack:(BOOL)fullSlidePopBack{
    //
    self.navigationController.fullScreenInteractivePopGestureRecognizer = fullSlidePopBack;
}

- (void)setCloseCebianMoveout:(BOOL)closeCebianMoveout{
    //
//    if (closeCebianMoveout) {
//        //
//        [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
//        [self.mm_drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeNone];
//    }else{
//        //
//        [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
//        [self.mm_drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
//    }
}

#pragma mark - 基本界面

- (void)addBackButton{
    //
    if (_hiddedBackBtn) {return;}
    
    
    /*
     默认返回按钮
     UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
     self.navigationItem.backBarButtonItem = item;
     
     */
    
    BOOL ispush = [self isPushTypeVc];
    
    /*
     
     1 返回按钮 + 回到首页按钮
     
     2 自定义返回按钮 注释打开
     判断当前vc是不是登录vc,登录vc和非登录vc返回按钮ui不相同
     */
    
    UIView* btnv;
    
    if (_hasHomeBtn) {
        //
        btnv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 28*2+10, 44)];
        
        UIButton* backbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backbtn.frame = CGRectMake(0, (44-28)/2, 28, 28);
        [backbtn setImage:ispush ? [UIImage imageNamed:@"back.png"] : [UIImage imageNamed:@"esc.png"] forState:UIControlStateNormal];
        [backbtn addTarget:self action:@selector(vcback) forControlEvents:UIControlEventTouchUpInside];
        [btnv addSubview:backbtn];
        
        UIButton* homebtn = [UIButton buttonWithType:UIButtonTypeCustom];
        homebtn.frame = CGRectMake(backbtn.frame.origin.x+backbtn.frame.size.width+5, (44-28)/2, 28, 28);
        [homebtn setImage:[UIImage imageNamed:@"esc.png"] forState:UIControlStateNormal];
        [homebtn addTarget:self action:@selector(vcbackToRoot) forControlEvents:UIControlEventTouchUpInside];
        [btnv addSubview:homebtn];
        
    }else{
        
        btnv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        
        UIButton* backbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backbtn.frame = CGRectMake(0, (44-28)/2, 28, 28);
        [backbtn setImage:ispush ? [UIImage imageNamed:@"back.png"] : [UIImage imageNamed:@"esc.png"] forState:UIControlStateNormal];
        [backbtn addTarget:self action:@selector(vcback) forControlEvents:UIControlEventTouchUpInside];
        [btnv addSubview:backbtn];
    }
    
    UIBarButtonItem* leftBtn = [[UIBarButtonItem alloc] initWithCustomView:btnv];
    self.navigationItem.leftBarButtonItem = leftBtn;
}


#pragma mark
//扫一扫
- (void)addSaoyisaoButton{
    //
    UIButton* saoBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    saoBtn.frame = CGRectMake(0, 0, 44, 44);
    //    saoBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    //    [saoBtn setImage:[UIImage imageNamed:@"saoyisao.png"] forState:UIControlStateNormal];
    [saoBtn setTitle:@"扫描" forState:UIControlStateNormal];
    [saoBtn addTarget:self action:@selector(func_saoyisao) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* rightBtn = [[UIBarButtonItem alloc] initWithCustomView:saoBtn];
    self.navigationItem.rightBarButtonItem = rightBtn;
    //    self.navigationItem.rightBarButtonItems   添加多个按钮
}
- (void)func_saoyisao{
    //
    LScanningViewController* scan_vc = [[LScanningViewController alloc] init];
    scan_vc.hidesBottomBarWhenPushed = self.isTabbar;
    [self.navigationController pushViewController:scan_vc animated:YES];
}


#pragma mark -

- (void)addNavBarRightButtonWithTitle:(NSString*)title image:(UIImage*)image action:(SEL)action{
    //
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 44, 44);
    btn.accessibilityIdentifier = @"0";
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    if (image) {
        [btn setImage:image forState:UIControlStateNormal];
    }
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = rightItem;
}



#pragma mark - 基本功能

- (void)vcback{
    //
    
    
    if (_isTongzhi) {
        //
        [self.navigationController popToRootViewControllerAnimated:YES];
        return;
    }
    
    BOOL ispush = [self isPushTypeVc];
    ispush ? [self.navigationController popViewControllerAnimated:YES] : [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

- (void)vcbackToRoot{
    //
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - 其他

- (BOOL)isPushTypeVc{
    //
    NSRange range = [self.navTitle rangeOfString:@"登录"];
    
    return range.length == 0 ? YES : NO;
}

#define mark - LSAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        
        
        NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",alertView.accessibilityIdentifier]];
        
        
        [[UIApplication sharedApplication] openURL:url];
    }
}


#pragma mark

- (UIButton*)addRequestButtonOnView:(UIView*)supview requestSEL:(SEL)sel{
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = supview.bounds;
    btn.alpha = 0;
    [btn setTitle:@"获取数据失败,点击重试" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    [supview addSubview:btn];
    return btn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
