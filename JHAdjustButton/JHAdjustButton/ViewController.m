//
//  ViewController.m
//  JHAdjustButton
//
//  Created by HaoCold on 2022/1/20.
//

#import "ViewController.h"
#import "JHAdjustButton.h"

@interface ViewController ()
@property (nonatomic,  strong) JHAdjustButton *adjButton1;
@property (nonatomic,  strong) JHAdjustButton *adjButton2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _adjButton1 = [self setupButton:CGRectMake(50, 50, 200, 80) title:@"red rose" image:@"rose"];
    _adjButton1.padding = UIEdgeInsetsMake(5, 5, 5, 5);
    _adjButton1.betweenSpace = 10;
    _adjButton1.imageSize = CGSizeMake(25, 26);

    _adjButton2 = [self setupButton:CGRectMake(50, CGRectGetMaxY(_adjButton1.frame) + 30, 200, 150) title:@"ring" image:@"ring"];
    _adjButton2.padding = UIEdgeInsetsMake(3, 3, 3, 3);
    _adjButton2.betweenSpace = 5;
    _adjButton1.imageSize = CGSizeMake(25, 26);
    
    
    CGFloat y = CGRectGetMaxY(_adjButton2.frame) + 50;
    CGFloat width = CGRectGetWidth(self.view.bounds) / 3;
    NSArray *titles = @[@"Horiz_Left",@"Horiz_Center",@"Horiz_Right"];
    for (NSInteger i = 0; i < titles.count; i++) {
        [self setupButton:CGRectMake(10 + width * i, y, width - 20, 40) title:titles[i] tag:100+i];
    }
    
    y += 50;
    titles = @[@"Vert_Top",@"Vert_Center",@"Vert_Bottom"];
    for (NSInteger i = 0; i < titles.count; i++) {
        [self setupButton:CGRectMake(10 + width * i, y, width - 20, 40) title:titles[i] tag:200+i];
    }
    
    y += 50;
    titles = @[@"img_L title_R",@"img_R title_L"];
    for (NSInteger i = 0; i < titles.count; i++) {
        [self setupButton:CGRectMake(10 + width * i, y, width - 20, 40) title:titles[i] tag:300+i];
    }
    
    y += 50;
    titles = @[@"img_T title_B",@"img_B title_T"];
    for (NSInteger i = 0; i < titles.count; i++) {
        [self setupButton:CGRectMake(10 + width * i, y, width - 20, 40) title:titles[i] tag:400+i];
    }
}

- (JHAdjustButton *)setupButton:(CGRect)frame title:(NSString *)title image:(NSString *)image
{
    JHAdjustButton *button = [JHAdjustButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.backgroundColor = [UIColor lightGrayColor];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    button.titleLabel.backgroundColor = [UIColor orangeColor];
    [button setTitle:title forState:0];
    [button setTitleColor:[UIColor blackColor] forState:0];
    [button setImage:[UIImage imageNamed:image] forState:0];
    button.imageView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:button];
    return button;
}

- (UIButton *)setupButton:(CGRect)frame title:(NSString *)title tag:(NSInteger)tag
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag = tag;
    button.frame = frame;
    button.backgroundColor = [UIColor lightGrayColor];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitle:title forState:0];
    [button setTitleColor:[UIColor blackColor] forState:0];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:1<<6];
    [self.view addSubview:button];
    return button;
}

#pragma mark --- Action

- (void)buttonAction:(UIButton *)button
{
    NSInteger tag = button.tag;
    if (tag == 100) {
        _adjButton1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _adjButton2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    }else if (tag == 101) {
        _adjButton1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        _adjButton2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }else if (tag == 102) {
        _adjButton1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        _adjButton2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }else if (tag == 200) {
        _adjButton1.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
        _adjButton2.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    }else if (tag == 201) {
        _adjButton1.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _adjButton2.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    }else if (tag == 202) {
        _adjButton1.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
        _adjButton2.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    }else if (tag == 300) {
        _adjButton1.position = JHAdjustButtonPosition_ImageLeftTitleRight;
        _adjButton2.position = JHAdjustButtonPosition_ImageLeftTitleRight;
    }else if (tag == 301) {
        _adjButton1.position = JHAdjustButtonPosition_ImageRightTitleLeft;
        _adjButton2.position = JHAdjustButtonPosition_ImageRightTitleLeft;
    }else if (tag == 400) {
        _adjButton1.position = JHAdjustButtonPosition_ImageTopTitleBottom;
        _adjButton2.position = JHAdjustButtonPosition_ImageTopTitleBottom;
    }else if (tag == 401) {
        _adjButton1.position = JHAdjustButtonPosition_ImageBottomTitleTop;
        _adjButton2.position = JHAdjustButtonPosition_ImageBottomTitleTop;
    }
}

@end
