//
//  LSBaseView.h
//  LSDevModel2
//
//  Created by  tsou117 on 15/10/10.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSFactory.h"

#define kSCREEN_RECT        ([UIScreen mainScreen].bounds)
#define kSCREEN_WIDTH       ([UIScreen mainScreen].bounds.size.width)
#define kSCREEN_HEIGHT      ([UIScreen mainScreen].bounds.size.height)

#define kColor_line                     [UIColor colorWithRed:0.902 green:0.902 blue:0.902 alpha:1]

#define kAnimationDurationTime          0.35

#define kImage_placeHolder              [UIImage imageNamed:@"placeholderimage.png"]

@interface LSBaseView : UIView

//在xib中设置圆角
//@property (nonatomic,assign)IBInspectable CGFloat cornerRadius;
//@property (nonatomic,assign)IBInspectable CGFloat bwidth;
//@property (nonatomic,assign)IBInspectable UIColor* bcolor;

@end
