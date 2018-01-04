//
//  GPTextViewCell.m
//  Gorpeln
//
//  Created by chen on 2016/8/25.
//  Copyright © 2016年 Gorpeln. All rights reserved.
//

#import "GPTextViewCell.h"
#import "UITextField+IndexPath.h"
#import "GlobalDefines.h"


@interface GPTextViewCell ()

@property (strong, nonatomic) UITextField   *textField;
@property (strong, nonatomic) UILabel       *titleLabel;

@end

@implementation GPTextViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.textField];
        
    }
    return self;
}

- (void)setTitleStr:(NSString *)titleStr andPlaceholderStr:(NSString *)placeholderStr andDataStr:(NSString *)dataStr andIndexPath:(NSIndexPath *)indexPath{
    // 核心代码
    
    self.textField.indexPath = indexPath;
    self.textField.text = dataStr;
    self.textField.placeholder = placeholderStr;
    self.titleLabel.text = titleStr;
    if (indexPath.row == 0) {
        [_textField becomeFirstResponder];
    }

}


- (UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(self.titleLabel.frame.size.width + BORDORWIDTH, 0, BOUNDS_WIDTH - self.titleLabel.frame.size.width - BORDORWIDTH * 2, 45 * HEIGHTSCALE)];
        _textField.backgroundColor = [UIColor clearColor];
        _textField.textAlignment = NSTextAlignmentRight; //水平左对齐
        [_textField setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
        [_textField setValue:FONTOFHEITISC(14.0) forKeyPath:@"_placeholderLabel.font"];
        _textField.font = FONTOFHEITISC(14.0);
        _textField.clearButtonMode = UITextFieldViewModeNever;//一键删除
        _textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;

    }
    return _textField;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(BORDORWIDTH, 0, 90 * WIDTHSCALE, 45 *HEIGHTSCALE)];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = FONTOFHEITISC(14.0);
    }
    return _titleLabel;
}

@end


