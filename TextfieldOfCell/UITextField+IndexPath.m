
//
//  UITextField+IndexPath.m
//  TextfieldOfCell
//
//  Created by chen on 2016/8/25.
//  Copyright © 2016年 Gorpeln. All rights reserved.
//

#import "UITextField+IndexPath.h"
#import <objc/runtime.h>


@implementation UITextField (IndexPath)
static char indexPathKey;
- (NSIndexPath *)indexPath{
    return objc_getAssociatedObject(self, &indexPathKey);
}

- (void)setIndexPath:(NSIndexPath *)indexPath{
    objc_setAssociatedObject(self, &indexPathKey, indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
