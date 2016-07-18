//
//  LSEnterView.h
//  杭州网
//
//  Created by  tsou117 on 15/5/18.
//  Copyright (c) 2015年 chen. All rights reserved.
//



#import "LSBaseView.h"

@interface LSEnterView : LSBaseView
<UITextViewDelegate>

@property (nonatomic, strong, readonly) UIView* rootview;
@property (nonatomic, strong, readonly) UITextView* mytextView;

@property (nonatomic, assign) NSUInteger maxLength;  //输入信息最大值

@property (nonatomic, copy) void (^blockDone)(NSString* entertext);


/**
 *  普通输入框
 *
 *  @param title       标题
 *  @param canceltitle 取消按钮标题
 *  @param btntitle    确认按钮标题
 *
 *  @return 无
 */
- (instancetype)initWithTitle:(NSString*)title
             enterFieldHeight:(CGFloat)fieldheight
               andCancelTitle:(NSString*)canceltitle
              andDoneBtnTitle:(NSString*)btntitle;

/**
 *  自定义输入框
 *
 *  @param fieldheight 框框高度
 *  @param title       标题
 *  @param elseview    附件视图
 *  @param canceltitle 取消按钮标题
 *  @param btntitle    确认按钮标题
 *
 *  @return 无
 */
- (instancetype)initWithTitle:(NSString*)title
             enterFieldHeight:(CGFloat)fieldheight
                      addView:(UIView*)elseview
               andCancelTitle:(NSString*)canceltitle
              andDoneBtnTitle:(NSString*)btntitle;



- (void)show;

@end
