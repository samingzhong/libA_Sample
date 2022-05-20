//
//  ViewController.m
//  libA_Sample
//
//  Created by zhongxiaoming on 5/19/22.
//

#import "ViewController.h"
#import "Masonry.h"

#import "LibA.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    void (^setupUI)(void) = ^ {
        UILabel *label = UILabel.new;
        [self.view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            if (@available(iOS 11.0, *)) {
                make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop);
            } else {
                // Fallback on earlier versions
            }
        }];
        self.titleLabel = label;
    };
    setupUI();
    
    
    CustomViewA *view = [[CustomViewA alloc] initWithFrame:CGRectMake(100, 10, 300, 100)];
    view.layer.cornerRadius = 20;
    view.layer.masksToBounds = YES;
    // 数据回调。另外可以借助RAC的对象监听进行数据同步。
    view.modelInfoChangeCallback = ^(CustomViewAModel * _Nonnull modelInfo) {
        self.titleLabel.text = modelInfo.title;
    };
    
    
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(self.view.mas_centerY);
    }];
    
    CustomViewAModel *model = [CustomViewAModel new];
    model.title = @"我是一个标题";
    view.model = model;
}


@end
