//
//  ViewController.m
//  iwatch-app
//
//  Created by cai on 2018/6/5.
//  Copyright © 2018年 CAI YILONG. All rights reserved.
//

#import "ViewController.h"
#import <WatchConnectivity/WatchConnectivity.h>
#import <WatchKit/WatchKit.h>
#import <Social/Social.h>

@interface CustomActivity:UIActivity
@end
@implementation CustomActivity
@end




@interface ViewController ()<WCSessionDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([WCSession isSupported]){
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
    }
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)sharedBtnClick:(id)sender {
    
    NSArray *images = @[@"fd2aa8bbef714343abd0b5a9259a0e02.jpg"];
    UIActivityViewController *activityController=[[UIActivityViewController alloc]initWithActivityItems:images applicationActivities:nil];
    [self.navigationController presentViewController:activityController animated:YES completion:nil];
    
}













- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    WCSession *session = [WCSession defaultSession];
    
    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:@"this is iphone send",@"Name", nil];
    
    [session sendMessage:dic replyHandler:^(NSDictionary<NSString *,id> * _Nonnull replyMessage) {
        NSLog(@"replay: %@", replyMessage);
        
    } errorHandler:^(NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
    }];
}


- (void)session:(WCSession *)session activationDidCompleteWithState:(WCSessionActivationState)activationState error:(nullable NSError *)error __IOS_AVAILABLE(9.3) __WATCHOS_AVAILABLE(2.2){
    
}
/*
 
 // watch侧发送数据过来，iPhone接收到数据并回复数据过去
 // message: watch侧发送过来的信息
 // replyHandler: iPhone回复过去的信息
 func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
 // 在这里，我们接收到watch发送过来的数据，可以用代理、代码块或者通知中心传值到ViewController，做出一系列操作。
 // 注！！：watch侧发送过来信息，iPhone回复直接在这个函数里回复replyHandler([String : Any])（replyHandler(数据)），这样watch侧发送数据的函数对应的reply才能接收到数据，别跟sendMessage这个函数混淆了。如果用sendMessage回复，那watch侧接收到信息就是didReceiveMessage的函数。
 }
 
 // iPhone向watch发送数据
 // key: 数据的key值
 // value: 数据内容
 func sendMessageToWatch(key:String,value:Any) {
 session?.sendMessage([key : value], replyHandler: { (dict:Dictionary) in
 // 这里是发送数据后的操作，比如写个alert提示发送成功
 　　  // replyHandler是watch侧didReceiveMessage函数接收到信息后reply回复过来的内容，这里可以编辑自己需要的功能
 }, errorHandler: { (Error) in
 // 发送失败，一般是蓝牙没开，或手机开了飞行模式
 })
 }
 }
 
 
 
 
 */

- (void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *, id> *)message replyHandler:(void(^)(NSDictionary<NSString *, id> *replyMessage))replyHandler{
    NSString *name = [message objectForKey:@"Name"];
    NSLog(@"---------->%@",name);
    replyHandler(@{@"reply":@"this is iphone reply"});
    
    
}



/** ------------------------- iOS App State For Watch ------------------------ */

/** Called when the session can no longer be used to modify or add any new transfers and, all interactive messages will be cancelled, but delegate callbacks for background transfers can still occur. This will happen when the selected watch is being changed. */
- (void)sessionDidBecomeInactive:(WCSession *)session __IOS_AVAILABLE(9.3) __WATCHOS_UNAVAILABLE{
    
}

/** Called when all delegate callbacks for the previously selected watch has occurred. The session can be re-activated for the now selected watch using activateSession. */
- (void)sessionDidDeactivate:(WCSession *)session __IOS_AVAILABLE(9.3) __WATCHOS_UNAVAILABLE{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
