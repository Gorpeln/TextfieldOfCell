//
//  ViewController.m
//  TextfieldOfCell
//
//  Created by chen on 2016/8/25.
//  Copyright © 2016年 Gorpeln. All rights reserved.
//

#import "ViewController.h"
#import "GPTextViewCell.h"
#import "UITextField+IndexPath.h"
#import "GlobalDefines.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)NSArray            *titleArray;
@property (nonatomic, strong)NSMutableArray     *arrayDataSouce;
@property (nonatomic, strong)NSArray             *placeholderArray;

@property (nonatomic, strong)UITableView        *tableView;
@property (nonatomic, strong)UIButton           *completeBtn;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [UIView new];
    [self.tableView addSubview:self.completeBtn];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldDidChanged:) name:UITextFieldTextDidChangeNotification object:nil];
}

#pragma mark - notification

- (void)textFieldDidChanged:(NSNotification *)noti{
    // 数据源赋值
    UITextField *textField=noti.object;
    NSIndexPath *indexPath = textField.indexPath;
    [self.arrayDataSouce replaceObjectAtIndex:indexPath.row withObject:textField.text];
}

#pragma marks - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayDataSouce.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *Id = @"GPTextViewCell";
    GPTextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Id];
    if (!cell) {
        cell = [[GPTextViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Id];
    }
    // 核心方法
    [cell setTitleStr:self.titleArray[indexPath.row] andPlaceholderStr:self.placeholderArray[indexPath.row] andDataStr:self.arrayDataSouce[indexPath.row] andIndexPath:indexPath];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - private

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"点击结束了");
}

#pragma marks- lazy

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,64, self.view.frame.size.width, self.view.frame.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1.0];
    }
    return _tableView;
}

- (NSMutableArray *)arrayDataSouce{
    if (!_arrayDataSouce) {
        _arrayDataSouce = [NSMutableArray array]; // 注意：初始化时，一定要注意占位，否则第一次去的时候为nil，奔溃
        for (int i = 0; i < self.titleArray.count; i ++) {
            [_arrayDataSouce addObject:@""];
        }
    }
    return _arrayDataSouce;
}

- (NSArray *)titleArray{
    if (!_titleArray) {
        _titleArray = @[@"姓名：", @"年龄：", @"性别：", @"身份证号：", @"工作地点：", @"人生理想："];
    }
    return _titleArray;
}

- (NSArray *)placeholderArray{
    if (!_placeholderArray) {
        _placeholderArray = @[@"请输入您的姓名", @"请输入您的年龄", @"请输入您的性别", @"请输入您的身份证号", @"请输入您的工作地点", @"请输入您的人生理想"];
    }
    return _placeholderArray;
}


- (UIButton *)completeBtn{
    if (!_completeBtn) {
        _completeBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 360, (SCREEN_WIDTH - 200), 44)];
        [_completeBtn setTitle:@"打印数据源" forState:UIControlStateNormal];
        _completeBtn.backgroundColor = [UIColor purpleColor];
        [_completeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_completeBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _completeBtn;
}
#pragma mark- Action
- (void)btnClick{
    // 打印数据源
    [self.arrayDataSouce enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *string = (NSString *)obj;
        if (string.length == 0) {
            NSLog(@"第%lu个位置元素为空", (unsigned long)idx);
        }else{
            NSLog(@"%@", obj);
        }
    }];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
