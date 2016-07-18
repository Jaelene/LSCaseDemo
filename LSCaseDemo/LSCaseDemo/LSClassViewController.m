//
//  LSClassViewController.m
//  LSDevModel3
//
//  Created by  tsou117 on 16/4/12.
//  Copyright © 2016年 sen. All rights reserved.
//

#import "LSClassViewController.h"

#import "LSSlideView.h"
#import "LSHorizontalMenuView.h"
#import "LSPageScrollView.h"
#import "LSButton.h"
#import "LSEnterView.h"
#import "LSPickerView.h"
#import "LSLayoutButtonsView.h"
#import "LSImgZoomView.h"
#import "FXBlurView.h"
#import "LSPaoMaView.h"
#import "LSLabelView.h"

#import "LSDetailViewController.h"
#import "LSCaseDemoViewController.h"

@interface LSClassViewController ()
<UITableViewDataSource,UITableViewDelegate>

@end

@implementation LSClassViewController
{
    NSArray* listinfo;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navTitle = @"Case Demo";
    
    listinfo = [NSArray arrayWithContentsOfFile:[kLSBundle pathForResource:@"LSViewModelCase" ofType:@"plist"]];
    
    
    
    [self loadTableViewWithTableViewStyle:UITableViewStylePlain refreshStyle:LSRefreshTypeNo];
    self.mytableview.dataSource = self;
    self.mytableview.delegate = self;
    self.mytableview.rowHeight = 50;

    
    //
    [self addNavBarRightButtonWithTitle:@"效果" image:nil action:@selector(actionOfCaseDemoVc)];
}

- (void)actionOfCaseDemoVc{
    //
    LSCaseDemoViewController* vc = [[LSCaseDemoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES completion:^(BOOL finished) {}];
}

#pragma mark

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return listinfo.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //
    UITableViewCell* cell = [LSCELLDISPOSE disposeCellWithTableView:tableView cellClassFromString:nil leftLineSpace:10 rightSpace:0 showIndex:0];
    
    NSDictionary* dic = listinfo[indexPath.row];
    
    cell.textLabel.text = dic[@"title"];
    cell.textLabel.textColor = [UIColor colorWithRed:0.886 green:0.271 blue:0.298 alpha:1];
    cell.detailTextLabel.text = dic[@"detail"];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSString* title = cell.textLabel.text;
    NSString* detail = cell.detailTextLabel.text;
    
    UIView* tmpview;
    
    if ([title isEqualToString:kLSSlideView]) {
        //
        tmpview = [self LSSlideView];
        
    }else if ([title isEqualToString:kLSButton]){
        //
        tmpview = [self LSButton];
        
    }else if ([title isEqualToString:kLSEnterView]){
        //
        [self LSEnterView];
        return;
    }else if ([title isEqualToString:kLSHorizontalMenuView]){
        //
        tmpview = [self LSHorizontalMenuView];
        
    }else if ([title isEqualToString:kLSLayoutButtonsView]){
        //
        tmpview = [self LSLayoutButtonsView];
        
    }else if ([title isEqualToString:kLSPageScrollView]){
        //
        tmpview = [self LSPageScrollView];
        
    }else if ([title isEqualToString:kLSPickerView]){
        //
        
        [self LSPickerView];
        return;
        
    }else if ([title isEqualToString:kLSImgZoomView]){
        //
        [self LSImgZoomView];
        return;
    }else if ([title isEqualToString:kFXBlurView]){
        //
        tmpview = [self FXBlurView];
        
    }else if ([title isEqualToString:kLSPaoMaView]){
        //
        tmpview = [self LSPaoMaView];
    }else if ([title isEqualToString:kLSLabelView]){
        //
        tmpview = [self LSLabelView];
    }
    
    //
    LSDetailViewController* vc = [[LSDetailViewController alloc] init];
    vc.navTitle = title;
    vc.detailView = tmpview;
    vc.detailMsg = detail;
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

#pragma mark 类效果

- (UIView*)LSSlideView{
    //
 
    //展示层
    LSSlideView* adview = [[LSSlideView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, kSCREEN_WIDTH*0.5)];
    adview.layer.cornerRadius = 5;
    adview.closeAutoSlide = YES;
    
    NSArray* advarr = @[@"http://a.hiphotos.baidu.com/baike/pic/item/86d6277f9e2f07087889d9eeeb24b899a801f254.jpg",
                        @"http://a.hiphotos.baidu.com/baike/pic/item/eac4b74543a9822677555e808d82b9014b90eb85.jpg",
                        @"http://f.hiphotos.baidu.com/baike/crop%3D0%2C0%2C1024%2C676/sign=ca977f868a26cffc7d65e5f2843166a0/c83d70cf3bc79f3d850eed2fb2a1cd11738b29c5.jpg"];
    
    adview.imageUrlArr = advarr;
    adview.selected = ^(NSInteger index){
        //
        
        LSImgZoomView* zoomv = [[LSImgZoomView alloc] initWithFirstFrame:CGRectZero withImgUrlArr:advarr withIndexImg:index];
        [zoomv show];
        
    };
    return adview;
}

#pragma mark

- (UIView*)LSButton{
    //
    UIView* bgview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 44*3)];
    
    
    for (int i = 0; i<3; i++) {
        //
        LSButton* btn = [LSButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(10, 44*i, 100, 44);
        [btn setTitle:@"按钮" forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabbar_1.png"] forState:UIControlStateNormal];
        btn.imageViewHorizontalAlignment = i;
        btn.contentHorizontalAlignment = i;
        [bgview addSubview:btn];
    }

    return bgview;
}

- (void)LSEnterView{

    //
    LSEnterView* enterview = [[LSEnterView alloc] initWithTitle:@"LSEnterView" enterFieldHeight:60 addView:nil andCancelTitle:@"取消" andDoneBtnTitle:@"确认"];
    enterview.mytextView.text = @"这是输入框";
    [enterview show];

}

#pragma mark

- (UIView*)LSHorizontalMenuView{
    //
    LSHorizontalMenuView* view = [[LSHorizontalMenuView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 44)];
    [view setButtonTitles:@[@"电影相关",@"短片",@"欧美电影",@"日本电影",@"国产电影",@"港片"] canMove:YES index:0];

    return view;
}

#pragma mark
- (UIView*)FXBlurView{
    //
    
    NSArray* advarr = @[@"http://a.hiphotos.baidu.com/baike/pic/item/86d6277f9e2f07087889d9eeeb24b899a801f254.jpg",
                        @"http://a.hiphotos.baidu.com/baike/pic/item/eac4b74543a9822677555e808d82b9014b90eb85.jpg",
                        @"http://f.hiphotos.baidu.com/baike/crop%3D0%2C0%2C1024%2C676/sign=ca977f868a26cffc7d65e5f2843166a0/c83d70cf3bc79f3d850eed2fb2a1cd11738b29c5.jpg"];
    
    LSPageScrollView* view = [[LSPageScrollView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 80) itemCount:5 itemSize:CGSizeMake(120, 80) itemInterspace:10 itemClass:LSPageItemClassButton complete:^(NSArray *items) {
        //
        
        
        for (int i = 0; i<advarr.count; i++) {
            //
            NSString* imgurl = advarr[i];
            
            LSButton* btn = items[i];
            [btn sd_setImageWithURL:[NSURL URLWithString:imgurl] forState:UIControlStateNormal];
            
        }
    }];
    view.pagingEnabled = NO;
    
    FXBlurView* fxview = [[FXBlurView alloc] initWithFrame:CGRectMake(10+120+10+10, 0, 100, 80)];
    fxview.tintColor = [UIColor clearColor];
    [view addSubview:fxview];
    
    return view;
}

#pragma mark
- (UIView*)LSPageScrollView{
    //
    LSPageScrollView* view = [[LSPageScrollView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 80) itemCount:5 itemSize:CGSizeMake(120, 60) itemInterspace:10 itemClass:LSPageItemClassButton complete:^(NSArray *items) {
        //
        
    }];
    view.pagingEnabled = NO;
    return view;
}

- (UIView*)LSPaoMaView{
    //
    LSPaoMaView* view = [[LSPaoMaView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 50) titleArr:@[@"陈奕迅,周杰伦,葛优,黄渤,林志玲,全智贤,",@"全部,电影相关,短片,欧美电影,日本电影",@"诚实过度的爱丽丝,两杆大烟枪,爆裂鼓手,放牛班的春天,致命魔术,杀手没有假期,暗杀,金福南杀人事件始末"]];
    
    return view;
}

- (UIView*)LSLayoutButtonsView{
    //
    NSArray* iteminfo = @[@"陈奕迅",@"周杰伦",@"葛优",@"黄渤",@"林志玲",@"全智贤",@"全部",@"电影相关",@"短片",@"欧美电影",@"日本电影",@"诚实过度的爱丽丝",@"两杆大烟枪",@"爆裂鼓手",@"放牛班的春天",@"致命魔术",@"杀手没有假期",@"暗杀",@"金福南杀人事件始末"];
    
    LSLayoutButtonsView* btnsview = [[LSLayoutButtonsView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 0) title:@"规格" itemInfo:iteminfo];
    btnsview.blockSelect = ^(NSInteger index){
        //select index
        [SVProgressHUD showInfoWithStatus:iteminfo[index]];
    };
    
    return btnsview;
}

- (void)LSPickerView{
    //
    NSArray* arr = @[@"电影相关",@"短片",@"欧美电影",@"日本电影",@"国产电影",@"港片"];
    
    LSPickerView* pview = [[LSPickerView alloc] initWithTitle:@"选择内容" listInfo:arr];
    [pview show];
    
    pview.blockSelect = ^(NSInteger index){
        //select index
    };
}

- (void)LSImgZoomView{
    //
    NSArray* advarr = @[@"http://a.hiphotos.baidu.com/baike/pic/item/86d6277f9e2f07087889d9eeeb24b899a801f254.jpg",
                        @"http://a.hiphotos.baidu.com/baike/pic/item/eac4b74543a9822677555e808d82b9014b90eb85.jpg",
                        @"http://f.hiphotos.baidu.com/baike/crop%3D0%2C0%2C1024%2C676/sign=ca977f868a26cffc7d65e5f2843166a0/c83d70cf3bc79f3d850eed2fb2a1cd11738b29c5.jpg"];
    
    LSImgZoomView* zoomv = [[LSImgZoomView alloc] initWithFirstFrame:CGRectZero withImgUrlArr:advarr withIndexImg:0];
    [zoomv show];
}

- (UIView*)LSLabelView{
    //
    LSLabelView* lbview = [[LSLabelView alloc] initWithFrame:CGRectMake(10, 0, kSCREEN_WIDTH-20, 44) textArr:@[@"你只是个平民玩家，",@"立即充值",@"送+13神器"]];
    [lbview setNormalColor:[UIColor grayColor]];
    [lbview setHighlightedColor:[UIColor orangeColor] index:1];
    return lbview;
}

#pragma mark
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
