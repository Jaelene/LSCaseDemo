//
//  LSBaseViewController.h
//  LSDevModel3
//
//  Created by Sen on 16/2/20.
//  Copyright © 2016年 sen. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "LSCellDispose.h"
#import "UINavigationController+JZExtension.h"



@interface LSBaseViewController : UIViewController

#pragma mark -


@property (nonatomic, assign) NSString* navTitle;       //导航栏标题

@property (nonatomic, assign) BOOL isTongzhi;           //如果是推送通知过来的vc,返回的时候直接回到首页

@property (nonatomic, assign) BOOL hasHomeBtn;          //回到首页按钮 默认NO

@property (nonatomic, assign) BOOL hiddedNavBar;    //是否隐藏导航栏，默认显示
@property (nonatomic, assign) BOOL hiddedBackBtn;   //是否隐藏左侧返回按钮，默认显示


@property (nonatomic, assign) BOOL closeCebianMoveout;  //是否关闭侧边栏滑动出现，YES-关闭 NO-开启 无默认值
@property (nonatomic, assign) BOOL fullSlidePopBack;    //是否全屏滑动返回，默认否

@property (nonatomic, assign) BOOL isTabbar;            //控制器是否在tabbar上，默认不在

#pragma mark -


//扫一扫按钮
- (void)addSaoyisaoButton;
- (void)func_saoyisao;



/**
 *  初始一个右侧时间按钮
 *
 *  @param title  文字
 *  @param image  图片
 *  @param action 时间
 */
- (void)addNavBarRightButtonWithTitle:(NSString*)title image:(UIImage*)image action:(SEL)action;

#pragma mark -

//返回
- (void)vcback;
- (void)vcbackToRoot;


#pragma mark

- (UIButton*)addRequestButtonOnView:(UIView*)supview requestSEL:(SEL)sel;

















@end
