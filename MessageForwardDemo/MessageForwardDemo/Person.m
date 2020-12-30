//
//  Person.m
//  MessageForwardDemo
//
//  Created by reborn on 2020/8/27.
//  Copyright © 2020 reborn. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
#import "Car.h"

@implementation Person

/// 一、动态解析机制（动态绑定）
//void run(id self, SEL _cmd) {
//    NSLog(@"%@ %s",self, sel_getName(_cmd));
//}
//
//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//
//    if (sel == @selector(run)) {
//        class_addMethod(self, sel, (IMP)run, "v@:");
//        return YES;
//    }
//    return [super resolveInstanceMethod:sel];
//}

/***************************************************************/

/// 二、快速消息转发-指定消息处理对象
//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    if (aSelector == @selector(run)) {
//        return [[Car alloc] init];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}
//
//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    return [super resolveInstanceMethod:sel];
//}

/***************************************************************/

/// 三、标准消息转发-消息签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {

    NSString *sel = NSStringFromSelector(aSelector);
    // 判断要转发的SEL
    if ([sel isEqualToString:@"run"]) {
        // 为的你转发方法手动生成签名
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    SEL selector = [anInvocation selector];
    // 新建需要转发消息的对象
    Car *car = [[Car alloc] init];
    if ([car respondsToSelector:selector]) {
        // 唤醒这个方法
        [anInvocation invokeWithTarget:car];
    }
}
@end
