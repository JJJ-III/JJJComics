//
//  TestViewController.m
//  多线程下载实验
//
//  Created by jinjiajian on 2017/8/29.
//  Copyright © 2017年 jjj. All rights reserved.
//

#import "TestViewController.h"
#import "JJJTest01.h"

@interface TestViewController ()

@property (nonatomic, strong) NSString *target;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

   
//    //....
//    dispatch_queue_t queue = dispatch_queue_create("parallel", DISPATCH_QUEUE_CONCURRENT);
//    for (int i = 0; i < 1000000 ; i++) {
//        dispatch_async(queue, ^{
//            self.target = [NSString stringWithFormat:@"ksddkjalkjd%d",i];
//        });
//    }
    
    
    
    JJJTest01 *jjj = [[JJJTest01 alloc]init];
    [jjj say];
    
    JJJTest01 *jjj_2 = [[JJJTest01 alloc]init];
    [jjj_2 say];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
