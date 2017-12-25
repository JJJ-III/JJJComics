//
//  ViewController.m
//  多线程下载实验
//
//  Created by jinjiajian on 2017/8/18.
//  Copyright © 2017年 jjj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    // 创建队列组
//    dispatch_group_t group = dispatch_group_create();
//    // 创建信号量，并且设置值为10
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
//    NSLog(@"%@",semaphore);
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    for (int i = 0; i < 10; i++)
//    {   // 由于是异步执行的，所以每次循环Block里面的dispatch_semaphore_signal根本还没有执行就会执行dispatch_semaphore_wait，从而semaphore-1.当循环10此后，semaphore等于0，则会阻塞线程，直到执行了Block的dispatch_semaphore_signal 才会继续执行
//        dispatch_time_t  t = dispatch_time(DISPATCH_TIME_NOW, 2.0*1000*1000*1000);
//        long temp = dispatch_semaphore_wait(semaphore, t);
//        if (temp == 0) {
//            dispatch_group_async(group, queue, ^{
//                NSLog(@"%i",i);
//                sleep(2);
//                // 每次发送信号则semaphore会+1，
//                dispatch_semaphore_signal(semaphore);
//                NSLog(@"");
//            });
//        }else{
//            
//            NSLog(@"等不了了%d",i);
//        }
//        
//    }
//
//    NSLog(@"%@",semaphore);
//    NSLog(@"我出来了");
    
    // Do any additional setup after loading the view, typically from a nib.
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
//    dispatch_time_t  t = dispatch_time(DISPATCH_TIME_NOW, 1*1000*1000*1000);
    
    
    NSOperationQueue *queue = [NSOperationQueue new];
    queue.maxConcurrentOperationCount = 1;
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        
//        long tempNum = dispatch_semaphore_wait(semaphore,DISPATCH_TIME_FOREVER);
//        NSLog(@"一===%@",[NSThread currentThread]);
        [NSThread sleepForTimeInterval:3.0];
        
//        NSLog(@"五===%@",[NSThread currentThread]);
        
//        if (tempNum == 0) {
//            
//            dispatch_semaphore_signal(semaphore);
//            NSLog(@"op1成功！");
//        }else{
//            NSLog(@"op1成功之母!");
//        }
        
        NSLog(@"op1成功！");
        
    }];
    
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        
//        long tempNum = dispatch_semaphore_wait(semaphore,DISPATCH_TIME_FOREVER);
        
//        NSLog(@"二===%@",[NSThread currentThread]);
        [NSThread sleepForTimeInterval:3.0];
        
//        if (tempNum == 0) {
//            
//            dispatch_semaphore_signal(semaphore);
//            NSLog(@"op2成功！");
//        }else{
////            dispatch_semaphore_signal(semaphore);
//            NSLog(@"op2成功之母！");
//        }
        NSLog(@"op2成功！");
    }];
    
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        
//        long tempNum = dispatch_semaphore_wait(semaphore,DISPATCH_TIME_FOREVER);
        
//        NSLog(@"三===%@",[NSThread currentThread]);
//        [NSThread sleepForTimeInterval:2.0];
        
//        if (tempNum == 0) {
//            
//            dispatch_semaphore_signal(semaphore);
//            NSLog(@"op3成功");
//        }else{
//            NSLog(@"op3成功之母");
//        }
        NSLog(@"op13成功！");
    }];
    
    
    [queue addOperation:op];
    [queue addOperation:op2];
    
    
    
    
    
//    NSLog(@"四===%@",[NSThread currentThread]);
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [queue addOperation:op3];
    });
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
