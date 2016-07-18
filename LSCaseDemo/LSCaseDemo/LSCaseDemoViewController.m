//
//  LSCaseDemoViewController.m
//  LSDevModel3
//
//  Created by  tsou117 on 16/4/13.
//  Copyright © 2016年 sen. All rights reserved.
//

#import "LSCaseDemoViewController.h"


#import "LSPageScrollView.h"
#import "LSSlideView.h"
#import "LSImgZoomView.h"
#import "LSEnterView.h"
#import "LSPickerView.h"
#import "LSPaoMaView.h"
#import "LSLayoutButtonsView.h"
#import "LSItemBreakView.h"
#import "LSLabelView.h"
#import "LSHorizontalMenuView.h"
#import "LSButton.h"



@interface LSCaseDemoViewController ()

@end

@implementation LSCaseDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navTitle = @"效果";
    
    [self LSSlideView];
    
    [self LSHorizontalMenuView1];
    [self LSHorizontalMenuView1_1];
    [self LSHorizontalMenuView2];
    
    [self LSPageScrollView1];
    [self LSPageScrollView2];
    
    [self LSPaoMaView];
    
    [self LSLabelView];
    
    [self addLayoutButtonView];
    
    [self addMapButton];
    
    [self addToolButton];
    
    [self LSEnterView];
    
    [self LSPickerView];
    
    [self addListViewButton];
    

    
    [self addItemBreakView];
    
}

#pragma mark 循环滚动视图
- (void)LSSlideView{
    //
    
    //背景层
    UIImageView* bgview = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.subviews_h, kSCREEN_WIDTH, kSCREEN_WIDTH*0.5)];
    bgview.backgroundColor = [UIColor whiteColor];
    bgview.userInteractionEnabled = YES;
    [self addSubview:bgview];
    
    //展示层
    LSSlideView* adview = [[LSSlideView alloc] initWithFrame:CGRectMake(10, 10, bgview.bounds.size.width-20, bgview.bounds.size.height-20)];
    adview.layer.cornerRadius = 5;
    adview.closeAutoSlide = YES;
    [bgview addSubview:adview];
    
    NSArray* advarr = @[@"http://a.hiphotos.baidu.com/baike/pic/item/86d6277f9e2f07087889d9eeeb24b899a801f254.jpg",
                        @"http://a.hiphotos.baidu.com/baike/pic/item/eac4b74543a9822677555e808d82b9014b90eb85.jpg",
                        @"http://f.hiphotos.baidu.com/baike/crop%3D0%2C0%2C1024%2C676/sign=ca977f868a26cffc7d65e5f2843166a0/c83d70cf3bc79f3d850eed2fb2a1cd11738b29c5.jpg"];
    
    adview.imageUrlArr = advarr;
    adview.selected = ^(NSInteger index){
        //
        
        LSImgZoomView* zoomv = [[LSImgZoomView alloc] initWithFirstFrame:CGRectZero withImgUrlArr:advarr withIndexImg:index];
        [zoomv show];
        
    };

}


#pragma mark 子栏目标样式

- (void)LSHorizontalMenuView1{
    //
    
    for (int i = 0; i<3; i++) {
        //
        self.subviews_h += 10;
        
        LSHorizontalMenuView* subview = [[LSHorizontalMenuView alloc] initWithFrame:CGRectMake(0, self.subviews_h, kSCREEN_WIDTH, 40)];
        [subview setButtonTitles:@[@"陈奕迅",@"周杰伦",@"葛优",@"黄渤",@"林志玲",@"全智贤"] canMove:NO index:0];
        subview.itemstyle = i;
        
        [self addSubview:subview];
    }
    
    
}

- (void)LSHorizontalMenuView1_1{
    //
    self.subviews_h += 10;
    
    LSHorizontalMenuView* subview = [[LSHorizontalMenuView alloc] initWithFrame:CGRectMake(0, self.subviews_h, kSCREEN_WIDTH, 40)];
    [subview setButtonTitles:@[@"全部",@"电影相关",@"短片",@"欧美电影",@"日本电影"] canMove:YES index:0];
    subview.itemstyle = UIHorItemStyleRound;
    [self addSubview:subview];
}

- (void)LSHorizontalMenuView2{
    //
    
    for (int i = 0; i<3; i++) {
        //
        self.subviews_h += 10;
        LSHorizontalMenuView* subview = [[LSHorizontalMenuView alloc] initWithFrame:CGRectMake(0, self.subviews_h, kSCREEN_WIDTH, 40)];
        [subview setButtonTitles:@[@"诚实过度的爱丽丝",@"两杆大烟枪",@"爆裂鼓手",@"放牛班的春天",@"致命魔术",@"杀手没有假期",@"暗杀",@"金福南杀人事件始末"] canMove:YES index:0];
        subview.itemstyle = i;
        [self addSubview:subview];
    }
    
    
}

#pragma mark

- (void)LSPageScrollView1{
    //
    self.subviews_h += 10;
    
    //背景层
    UIImageView* bgview = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.subviews_h, kSCREEN_WIDTH, 100)];
    bgview.backgroundColor = [UIColor whiteColor];
    bgview.userInteractionEnabled = YES;
    [self addSubview:bgview];
    
    
    LSPageScrollView* itemsview = [[LSPageScrollView alloc] initWithFrame:bgview.bounds itemCount:9 itemSize:CGSizeMake(80, 80) itemInterspace:0 itemClass:LSPageItemClassButton complete:^(NSArray *items) {
        //
        
    }];
    itemsview.pagingEnabled = NO;
    [bgview addSubview:itemsview];
}

- (void)LSPageScrollView2{
    //
    self.subviews_h += 10;
    
    //背景层
    UIImageView* bgview = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.subviews_h, kSCREEN_WIDTH, 80)];
    bgview.backgroundColor = [UIColor whiteColor];
    bgview.userInteractionEnabled = YES;
    [self addSubview:bgview];
    
    
    LSPageScrollView* itemsview = [[LSPageScrollView alloc] initWithFrame:bgview.bounds itemCount:9 itemSize:CGSizeMake(100, 60) itemInterspace:10 itemClass:LSPageItemClassButton complete:^(NSArray *items) {
        //
        
    }];
    itemsview.currentPageIndicatorImage = [UIImage imageNamed:@"tb1.png"];
    itemsview.defaultPageIndicatorImage = [UIImage imageNamed:@"tb2.png"];
    itemsview.pages = 2;
    itemsview.pagingEnabled = YES;
    [bgview addSubview:itemsview];
}

#pragma mark
- (void)addMapButton{
    //
    LSButton* btn = [self buttonWithTitle:@"按钮 (配图可设置在右侧)"];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
}

#pragma mark
- (void)addToolButton{
    //
    LSButton* btn = [self buttonWithTitle:@"按钮"];
    btn.imageViewHorizontalAlignment = LSButtonImageViewHorizontalAlignmentRight;
}


#pragma mark

- (void)LSEnterView{
    
    LSButton* btn1 = [self buttonWithTitle:@"输入框1"];
    [btn1 addTarget:self action:@selector(actionOfEnter1) forControlEvents:UIControlEventTouchUpInside];
    
    LSButton* btn2 = [self buttonWithTitle:@"输入框2"];
    [btn2 addTarget:self action:@selector(actionOfEnter2) forControlEvents:UIControlEventTouchUpInside];
}
- (void)actionOfEnter1{
    //
    LSEnterView* enterview = [[LSEnterView alloc] initWithTitle:@"输入内容" enterFieldHeight:75 andCancelTitle:@"取消" andDoneBtnTitle:@"确定"];
    [enterview show];
    
    enterview.blockDone = ^(NSString* text){
        //text is
        
    };
}
- (void)actionOfEnter2{
    //
    
    UIView* tmpview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 60)];
    tmpview.backgroundColor = [LSFactory fc_randomColor];
    
    LSEnterView* enterview = [[LSEnterView alloc] initWithTitle:@"输入评价" enterFieldHeight:75 addView:tmpview andCancelTitle:@"取消" andDoneBtnTitle:@"提交"];
    [enterview show];
    
    enterview.blockDone = ^(NSString* text){
        //text is
        
    };
}

#pragma mark
- (void)LSPickerView{
    //
    LSButton* btn = [self buttonWithTitle:@"选择器"];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    btn.imageViewHorizontalAlignment = LSButtonImageViewHorizontalAlignmentRight;
    [btn addTarget:self action:@selector(actionOfPickerView) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)actionOfPickerView{
    //
    
    NSArray* listinfo = @[@"电影相关",@"短片",@"欧美电影",@"日本电影",@"国产电影",@"港片"];
    
    LSPickerView* pview = [[LSPickerView alloc] initWithTitle:@"选择内容" listInfo:listinfo];
    [pview show];
    
    pview.blockSelect = ^(NSInteger index){
        //select index
    };
}

- (void)addListViewButton{
    //
    
    NSArray* arr = @[@"UITableView",@"UICollectionView"];
    for (int i = 0; i<2; i++) {
        //
        LSButton* btn = [self buttonWithTitle:arr[i]];
        btn.tag = i;
        [btn addTarget:self action:@selector(actionOfShowListViewCase:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)actionOfShowListViewCase:(UIButton*)sender{

}

#pragma mark


#pragma mark
- (void)LSPaoMaView{
    //
    LSPaoMaView* paomaview = [[LSPaoMaView alloc] initWithFrame:CGRectMake(0, self.subviews_h, kSCREEN_WIDTH, 44) title:@"陈奕迅,周杰伦,葛优,黄渤,林志玲,全智贤,全部,电影相关,短片,欧美电影,日本电影,诚实过度的爱丽丝,两杆大烟枪,爆裂鼓手,放牛班的春天,致命魔术,杀手没有假期,暗杀,金福南杀人事件始末"];
    [self addSubview:paomaview];
}

#pragma mark
- (void)LSLabelView{
    //
    LSLabelView* lbview = [[LSLabelView alloc] initWithFrame:CGRectMake(10, self.subviews_h, kSCREEN_WIDTH-20, 44)];
    lbview.textarr = @[@"你只是个平民玩家，",@"立即充值",@"送+13神器"];
    [lbview setNormalColor:[UIColor grayColor]];
    [lbview setHighlightedColor:[UIColor orangeColor] index:1];
    [self addSubview:lbview];
    
    //
    [lbview setText:@"送圣兽" index:2];
}

#pragma mark


#pragma mark
- (void)addLayoutButtonView{
    //
    
    NSArray* iteminfo = @[@"陈奕迅",@"周杰伦",@"葛优",@"黄渤",@"林志玲",@"全智贤",@"全部",@"电影相关",@"短片",@"欧美电影",@"日本电影",@"诚实过度的爱丽丝",@"两杆大烟枪",@"爆裂鼓手",@"放牛班的春天",@"致命魔术",@"杀手没有假期",@"暗杀",@"金福南杀人事件始末"];
    
    LSLayoutButtonsView* btnsview = [[LSLayoutButtonsView alloc] initWithFrame:CGRectMake(0, self.subviews_h, kSCREEN_WIDTH, 0) title:@"规格" itemInfo:iteminfo];
    [self addSubview:btnsview];
    btnsview.blockSelect = ^(NSInteger index){
        //select index
        [SVProgressHUD showInfoWithStatus:iteminfo[index]];
    };
}


#pragma mark
- (void)addItemBreakView{
    //
    
    CGFloat item_w = kSCREEN_WIDTH/4;
    CGFloat item_h = item_w;
    
    LSItemBreakView* view = [[LSItemBreakView alloc] initWithFrame:CGRectMake(0, self.subviews_h, kSCREEN_WIDTH, 0) countOfItem:10 itemSize:CGSizeMake(item_w, item_h) indexOfbreakLine:4 complete:^(NSArray *buttons) {
        //
        
    }];
    [self addSubview:view];
}


#pragma mark action button
- (LSButton*)buttonWithTitle:(NSString*)title{
    LSButton* btn = [LSButton buttonWithType:UIButtonTypeSystem];
    [btn setImage:[UIImage imageNamed:@"tabbar_1.png"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(10, self.subviews_h, kSCREEN_WIDTH-20, 50);
    [btn setTitle:title forState:UIControlStateNormal];
    [self addSubview:btn];
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
