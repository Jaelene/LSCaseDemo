//
//  LSPickerView.m
//  LSDevModel3
//
//  Created by  tsou117 on 16/3/26.
//  Copyright © 2016年 sen. All rights reserved.
//

#import "LSPickerView.h"

#define kRootViewHeight (44+44*5)

@implementation LSPickerView
{
    UIView* rootview;
    //
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithTitle:(NSString*)title listInfo:(NSArray*)listinfo
{
    self = [super init];
    if (self) {
        //
        
        _listinfo = listinfo;
        
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        self.frame = kSCREEN_RECT;
        
        //关闭
        UIView* closev = [[UIView alloc] initWithFrame:self.bounds];
        [self addSubview:closev];
        
        UITapGestureRecognizer* backTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionOfCancel)];
        backTap.numberOfTapsRequired = 1;
        backTap.numberOfTouchesRequired = 1;
        [closev addGestureRecognizer:backTap];
        
        rootview = [[UIView alloc] initWithFrame:CGRectMake(0, kSCREEN_HEIGHT, kSCREEN_WIDTH, kRootViewHeight)];
        rootview.backgroundColor = [UIColor whiteColor];
        [self addSubview:rootview];
        
        //
        UILabel* titlelb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 44)];
        titlelb.text = title;
        titlelb.userInteractionEnabled = YES;
        titlelb.textAlignment = 1;
        titlelb.textColor = [UIColor darkTextColor];
        titlelb.font = [UIFont systemFontOfSize:16];
        [rootview addSubview:titlelb];
        UIView* line = [[UIView alloc] initWithFrame:CGRectMake(0, titlelb.bounds.size.height-0.5, kSCREEN_WIDTH, 0.5)];
        line.backgroundColor = kColor_line;
        [titlelb addSubview:line];
        
        //
        UIButton* donebtn = [UIButton buttonWithType:UIButtonTypeSystem];
        donebtn.frame = CGRectMake(kSCREEN_WIDTH-60, 0, 60, 44);
        [donebtn setTitle:@"确定" forState:UIControlStateNormal];
        [donebtn addTarget:self action:@selector(actionOfCancel) forControlEvents:UIControlEventTouchUpInside];
        [titlelb addSubview:donebtn];
        
        //
        _listView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, kSCREEN_WIDTH, 44*5)];
        _listView.dataSource = self;
        _listView.delegate = self;
        [rootview addSubview:_listView];
        _listView.tableFooterView = [UIView new];
        
        //
        
        [UIView animateWithDuration:kAnimationDurationTime animations:^{
            //
            self.backgroundColor = [UIColor colorWithRed:0.000 green:0.000 blue:0.000 alpha:0.55];
            rootview.frame = CGRectMake(0, kSCREEN_HEIGHT-kRootViewHeight, kSCREEN_WIDTH, kRootViewHeight);
        }];
        
    }
    return self;
}

- (void)show{
    [[UIApplication sharedApplication].delegate.window addSubview:self];
    
}

#pragma mark
- (void)actionOfCancel{
    [self removeSelf];
}

- (void)removeSelf{
    
    [UIView animateWithDuration:kAnimationDurationTime animations:^{
        rootview.frame = CGRectMake(0, kSCREEN_HEIGHT, kSCREEN_WIDTH, 44*5);
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    } completion:^(BOOL finished) {
        if (finished) {
            
            [[NSNotificationCenter defaultCenter] removeObserver:self];
            
            [self removeFromSuperview];
        }
    }];
}

#pragma mark

- (void)setListinfo:(NSArray *)listinfo{
    //
    _listinfo = listinfo;
    [_listView reloadData];
}

#pragma mark
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //
    return _listinfo.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //
    UITableViewCell* cell = [LSCELLDISPOSE disposeCellWithTableView:tableView cellClassFromString:nil leftLineSpace:10 rightSpace:10 showIndex:0];
    
    cell.textLabel.text = _listinfo[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //    
    if (self.blockSelect) {
        self.blockSelect(indexPath.row);
    }

}

@end
