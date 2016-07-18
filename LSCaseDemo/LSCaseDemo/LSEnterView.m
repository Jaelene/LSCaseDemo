//
//  LSEnterView.m
//  杭州网
//
//  Created by  tsou117 on 15/5/18.
//  Copyright (c) 2015年 chen. All rights reserved.
//

#import "LSEnterView.h"

#define ROOTVIEW_HEIGHT 130
#define TEXTVIEW_HEIGHT 75

@implementation LSEnterView
{
    
    //
    CGFloat sub_h;
    
    
    CGFloat _fieldheight;
    NSString* _title;
    NSString* _canceltitle;
    NSString* _btntitle;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithTitle:(NSString*)title enterFieldHeight:(CGFloat)fieldheight  andCancelTitle:(NSString*)canceltitle andDoneBtnTitle:(NSString*)btntitle
{
    self = [super init];
    if (self) {
        //
        _fieldheight = fieldheight;
        _title = title;
        _canceltitle = canceltitle;
        _btntitle = btntitle;
        _maxLength = 250;
        
        [self defaultSet];
        [self addRootView];
        [self addNavView];
        
        [self addTextView];
        
        //更新高度
        _rootview.frame = CGRectMake(0, kSCREEN_HEIGHT, kSCREEN_WIDTH, sub_h);
        [_mytextView becomeFirstResponder];

        [UIView animateWithDuration:kAnimationDurationTime animations:^{
            self.backgroundColor = [UIColor colorWithRed:0.000 green:0.000 blue:0.000 alpha:0.55];
        }];
    }
    return self;
}

//外带一个视图+输入框
- (instancetype)initWithTitle:(NSString*)title
             enterFieldHeight:(CGFloat)fieldheight
                      addView:(UIView*)elseview
               andCancelTitle:(NSString*)canceltitle
              andDoneBtnTitle:(NSString*)btntitle{
    //
    self = [super init];
    if (self) {
        //
        _fieldheight = fieldheight;
        _title = title;
        _canceltitle = canceltitle;
        _btntitle = btntitle;
        _maxLength = 250;
        
        [self defaultSet];
        [self addRootView];
        [self addNavView];
        
        //
        if (elseview) {
            //
            elseview.frame = CGRectMake(0, sub_h, kSCREEN_WIDTH, elseview.bounds.size.height);
            [_rootview addSubview:elseview];
            
            UIView* line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, elseview.bounds.size.width, 0.5)];
            line.backgroundColor = kColor_line;
            [elseview addSubview:line];
            
            sub_h += elseview.bounds.size.height+5;
        }
        
        
        [self addTextView];
        
        //
        _rootview.frame = CGRectMake(0, kSCREEN_HEIGHT, kSCREEN_WIDTH, sub_h);
        
        //
        [_mytextView becomeFirstResponder];
        
        [UIView animateWithDuration:kAnimationDurationTime animations:^{
            self.backgroundColor = [UIColor colorWithRed:0.000 green:0.000 blue:0.000 alpha:0.55];
        }];
        
    }
    return self;
}

- (void)show{
    [[UIApplication sharedApplication].delegate.window addSubview:self];
    
}

#pragma mark

- (void)defaultSet{
    //
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    
    self.frame = kSCREEN_RECT;
    
    //键盘通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    //关闭
    UIView* closev = [[UIView alloc] initWithFrame:self.bounds];
    [self addSubview:closev];
    
    UITapGestureRecognizer* backTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionOfCancel)];
    backTap.numberOfTapsRequired = 1;
    backTap.numberOfTouchesRequired = 1;
    [closev addGestureRecognizer:backTap];
}

#pragma mark
- (void)addRootView{
    //
    
    _rootview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 0)];
    _rootview.backgroundColor = [UIColor whiteColor];
    [self addSubview:_rootview];
    
}

#pragma mark
- (void)addNavView{
    
    UIView* bgview = [[UIView alloc] initWithFrame:CGRectMake(0, sub_h, kSCREEN_WIDTH, 44)];
    [_rootview addSubview:bgview];
    sub_h += bgview.bounds.size.height;
    
    //
    //line
    UIView* line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 2)];
    line.backgroundColor = kColor_themeWithAlpha(1);
    [bgview addSubview:line];
    
    //取消
    UIButton* cancelBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    cancelBtn.frame = CGRectMake(0, 0, 50, 44);
    [cancelBtn setTitle:_canceltitle forState:UIControlStateNormal];
    cancelBtn.tintColor = [UIColor grayColor];
    [cancelBtn addTarget:self action:@selector(actionOfCancel) forControlEvents:UIControlEventTouchUpInside];
    [bgview addSubview:cancelBtn];
    
    //标题
    UILabel* titleLb = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, self.bounds.size.width-100, 44)];
    titleLb.text = _title;
    titleLb.textAlignment = 1;
    titleLb.font = [UIFont systemFontOfSize:16];
    titleLb.textColor = [UIColor colorWithRed:0.212 green:0.212 blue:0.212 alpha:1];
    [bgview addSubview:titleLb];
    
    //发表按钮
    UIButton* doneBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    doneBtn.frame = CGRectMake(bgview.bounds.size.width-50, 0, 50, 44);
    [doneBtn setTitle:_btntitle forState:UIControlStateNormal];
    doneBtn.tintColor = [UIColor grayColor];
    [doneBtn addTarget:self action:@selector(actionOfDone:) forControlEvents:UIControlEventTouchUpInside];
    [bgview addSubview:doneBtn];
    
}

#pragma mark
- (void)addTextView{
    //
    //输入框
    _mytextView = [[UITextView alloc]initWithFrame:CGRectMake(10, sub_h, _rootview.bounds.size.width-20, _fieldheight)];
    _mytextView.returnKeyType = UIReturnKeyNext;
    _mytextView.delegate = self;
    _mytextView.backgroundColor = kBGC_contentView;
    _mytextView.layer.cornerRadius = 4;
    _mytextView.layer.borderColor = kColor_line.CGColor;
    _mytextView.layer.borderWidth = 0.5;
    _mytextView.font = [UIFont systemFontOfSize:14];
    _mytextView.clipsToBounds = YES;
    _mytextView.autocorrectionType = UITextAutocorrectionTypeNo;//取消联想
    _mytextView.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [_rootview addSubview:_mytextView];
    sub_h += _mytextView.bounds.size.height+10;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    NSString* enterstr = [textView.text stringByReplacingCharactersInRange:range withString:text];
    BOOL isbeyond = enterstr.length > _maxLength;
    if (isbeyond) {
        [SVProgressHUD showInfoWithStatus:[NSString stringWithFormat:@"抱歉，您最多可输入%ld字！",(long)_maxLength]];
    }
    
    return !isbeyond;
    
}

#pragma mark
- (void)keyboardWillShow:(NSNotification *)aNotification
{
    //获取键盘的高度
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    
    [UIView animateWithDuration:kAnimationDurationTime animations:^{
        _rootview.frame = CGRectMake(0, kSCREEN_HEIGHT-sub_h-keyboardRect.size.height, kSCREEN_WIDTH, sub_h);
    }];
    
}

- (void)actionOfCancel{
    [self removeSelf];
}

- (void)actionOfDone:(UIButton*)sender{
    
    NSString* text = [LSFactory fc_judgeObj:_mytextView.text placeholder:nil];
    
    //
    if (!text) {
        [SVProgressHUD showInfoWithStatus:[NSString stringWithFormat:@"请%@",_title]];
        return;
    }
    if (self.blockDone) {
        self.blockDone(text);
        
        [self removeSelf];
        return;
    }
    
    //

}

- (void)removeSelf{
    
    [_mytextView resignFirstResponder];
    [UIView animateWithDuration:kAnimationDurationTime animations:^{
        _rootview.frame = CGRectMake(0, kSCREEN_HEIGHT, kSCREEN_WIDTH, sub_h);
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    } completion:^(BOOL finished) {
        if (finished) {
            
            [[NSNotificationCenter defaultCenter] removeObserver:self];
            
            [self removeFromSuperview];
        }
    }];
}


#pragma mark

- (void)setMaxLength:(NSUInteger)maxLength{
    _maxLength = maxLength;
    if (_maxLength == 0) {
        _maxLength = 30;
    }
}



@end
