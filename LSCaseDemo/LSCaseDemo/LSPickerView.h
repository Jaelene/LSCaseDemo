//
//  LSPickerView.h
//  LSDevModel3
//
//  Created by  tsou117 on 16/3/26.
//  Copyright © 2016年 sen. All rights reserved.
//

#import "LSBaseView.h"
#import "LSCellDispose.h"

@interface LSPickerView : LSBaseView
<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong, readonly) UITableView* listView;
@property (nonatomic, strong) NSArray* listinfo;

@property (nonatomic, copy) void (^blockSelect)(NSInteger index);

- (instancetype)initWithTitle:(NSString*)title listInfo:(NSArray*)listinfo;
- (void)show;

@end

