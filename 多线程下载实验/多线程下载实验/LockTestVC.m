//
//  LockTestVC.m
//  多线程下载实验
//
//  Created by jinjiajian on 2017/8/23.
//  Copyright © 2017年 jjj. All rights reserved.
//

#import "LockTestVC.h"

@interface LockTestVC ()

@property (nonatomic,strong)NSLock *lock;

@property (atomic,assign)float jin;


@end

@implementation LockTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"lockVC";
    
    self.jin = 10.0;
    
    NSOperationQueue *queue = [NSOperationQueue new];
    __weak typeof(self) weakSelf = self;
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [_lock lock];
//        [NSThread sleepForTimeInterval:2.0];
//        
//        weakSelf.jin += 10;
//        NSLog(@"1=========%lf",weakSelf.jin);
//        [_lock unlock];
//    });
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        
//        [_lock lock];
//        [NSThread sleepForTimeInterval:2.0];
//        weakSelf.jin += 30;
//        NSLog(@"2>>>>>>>%lf",weakSelf.jin);
//        [_lock unlock];
//    });
    
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        
        
        
        @synchronized (self) {
            [NSThread sleepForTimeInterval:2.0];
            
            weakSelf.jin += 10;
            NSLog(@"1=========%lf",weakSelf.jin);
        }
        
//        [weakSelf.lock lock];
//        [NSThread sleepForTimeInterval:2.0];
//        
//        weakSelf.jin += 10;
//        NSLog(@"1=========%lf",weakSelf.jin);
//        [weakSelf.lock unlock];
        
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        
        @synchronized (self) {
            [NSThread sleepForTimeInterval:2.0];
            weakSelf.jin += 30;
            NSLog(@"2>>>>>>>%lf",weakSelf.jin);
        }
        
//        [weakSelf.lock lock];
//        [NSThread sleepForTimeInterval:2.0];
//        weakSelf.jin += 30;
//        NSLog(@"2>>>>>>>%lf",weakSelf.jin);
//        [weakSelf.lock unlock];
//        
    }];
    
    
    [queue addOperation:op1];
    [queue addOperation:op2];
//
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSLock *)lock{
    if (!_lock) {
        _lock = [NSLock new];
    }
    return _lock;
}

@end
