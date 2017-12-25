//
//  JJJTest01+gakki.m
//  多线程下载实验
//
//  Created by jinjiajian on 2017/8/29.
//  Copyright © 2017年 jjj. All rights reserved.
//

#import "JJJTest01+gakki.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation JJJTest01 (gakki)

//+ (void)load{
//    
//    // 交换方法
//    Method hhh1 = class_getInstanceMethod([self class], @selector(setGakki:));
//    Method hhh2 = class_getInstanceMethod([self class], @selector(jjjSetGakki:));
//    method_exchangeImplementations(hhh1, hhh2);
//    
//}

- (instancetype)init{
    
    if (self = [super init]) {
        // 交换方法
        Method hhh1 = class_getInstanceMethod([self class], @selector(setGakki:));
        Method hhh2 = class_getInstanceMethod([self class], @selector(jjjSetGakki:));
        method_exchangeImplementations(hhh1, hhh2);
        
    }
    
    return self;
    
}

- (void)jjjSetGakki:(NSString *)str{
    
    
    [self setValue:[NSString stringWithFormat:@"%@是gakki",str] forKeyPath:@"_gakki"];
    
}

- (void)say{
    
//    [self sayWorld];
////    NSLog(@"无法访问私有方法");
////    [self getInstanceMethodList];
    self.gakki = @"我老婆";
//
    [self setValue:[NSNumber numberWithBool:YES] forKeyPath:@"_jinView.hidden"];

//    [self classIvarList:[self class]];
//    [self classMethodList:[self class]];

//    [self objectAllProperty_Value_Type];
//    if ([self respondsToSelector:@selector(hahah)]) {
//        objc_msgSend(self, sel_registerName("hahah"));
//    }
    
    
//    if ([self respondsToSelector:@selector(setGakki:)]) {
//        <#statements#>
//    }
   

}

//获取一个类的实例方法列表
- (void)getInstanceMethodList {
    unsigned int count;
    Method *methods = class_copyMethodList([self class], &count);
    for (int i =0; i < count; i++) {
        SEL name = method_getName(methods[i]);
        NSLog(@"***实例方法名:%@",NSStringFromSelector(name));
    }
    free(methods);
}



- (void)classIvarList:(Class)aClass
{
    u_int count;
    
    Ivar * ivars = class_copyIvarList(aClass, &count);
    
    NSLog(@"Class's name: %@, Ivar's count: %d\n\n", NSStringFromClass(aClass), count);
    
    for (int i = 0; i < count; i++)
    {
        Ivar ivar = ivars[i];
        
        NSString * ivar_name = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSString * ivar_type = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        
        
        NSLog(@"[%d]ivar_name : %@", i, ivar_name);
        NSLog(@"[%d]ivar_type : %@\n\n", i, ivar_type);
    }
    
    free(ivars);
}

- (void)objectAllProperty_Value_Type
{
    u_int count;
    
    objc_property_t * properties = class_copyPropertyList(self.class, &count);
    
    NSLog(@"Class's name: %@, Property's count: %d\n\n", self.class, count);
    
    for (int i = 0; i < count; i++)
    {
        objc_property_t property = properties[i];
        
        NSString * propertyName  = [NSString stringWithUTF8String:property_getName(property)];
        NSString * propertyType  = [NSString stringWithUTF8String:property_getAttributes(property)];
        
        id propertyValue = [self valueForKey:(NSString *)propertyName];
        
        NSLog(@"[%d]propertyName : %@", i, propertyName);
        NSLog(@"[%d]propertyValue: %@", i, propertyValue);
        NSLog(@"[%d]propertyType : %@\n\n", i, propertyType);
    }
    
    free(properties);
}

- (void)classMethodList:(Class)aClass
{
    u_int count;
    
    Method * methods = class_copyMethodList(aClass,&count);
    
//    NSLog(@"Class's name: %@, Ivar's count: %d\n\n", NSStringFromClass(aClass), count);
    
    for(int i = 0;i < count; i++)
    {
        Method method = methods[i];
        
        NSString *methodName = [NSString stringWithUTF8String:sel_getName(method_getName(method))];
        NSString *methodType = [NSString stringWithUTF8String:method_getTypeEncoding(method)];
        NSString *methodArgs = @(method_getNumberOfArguments(method)).stringValue;
        
        
        NSLog(@"[%d]methodName : %@", i, methodName);
        NSLog(@"[%d]methodArgs : %@", i, methodArgs);
        NSLog(@"[%d]methodType : %@\n\n", i, methodType);
    }
    free(methods);
}


@end
