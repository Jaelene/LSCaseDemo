//
//  LSDetailViewController.m
//  LSCaseDemo
//
//  Created by  tsou117 on 16/7/18.
//  Copyright © 2016年 sen. All rights reserved.
//

#import "LSDetailViewController.h"

@interface LSDetailViewController ()

@end

@implementation LSDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //
    [self addSubview:_detailView];
    
    //
    UILabel* msglb = [[UILabel alloc] initWithFrame:CGRectMake(10, self.subviews_h, kSCREEN_WIDTH-20, 50)];
    msglb.text = [NSString stringWithFormat:@"注：%@",_detailMsg];
    msglb.textColor = [UIColor lightGrayColor];
    msglb.font = [UIFont systemFontOfSize:12];
    msglb.numberOfLines = 0;
    [self addSubview:msglb];

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
