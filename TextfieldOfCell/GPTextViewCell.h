//
//  GPTextViewCell.h
//  Gorpeln
//
//  Created by chen on 2016/8/25.
//  Copyright © 2016年 Gorpeln. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GPTextViewCell : UITableViewCell

/**
 *  设置cell、数据
 *  @param titleStr             左边的标题
 *  @param placeholderStr       textfield的占位字符
 *  @param dataStr              textfield输入内容
 *  @param indexPath            indexPath。唯一绑定当前textfield
 */
- (void)setTitleStr:(NSString *)titleStr andPlaceholderStr:(NSString *)placeholderStr andDataStr:(NSString *)dataStr andIndexPath:(NSIndexPath *)indexPath;

@end
