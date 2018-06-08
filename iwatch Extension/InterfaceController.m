//
//  InterfaceController.m
//  iwatch Extension
//
//  Created by cai on 2018/6/5.
//  Copyright © 2018年 CAI YILONG. All rights reserved.
//

#import "InterfaceController.h"
#import "RowVC.h"
#import <WatchConnectivity/WatchConnectivity.h>

@interface InterfaceController ()<WCSessionDelegate>

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *btn;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *lable;

@end


@implementation InterfaceController{
    BOOL _isStart ;
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    if ([WCSession isSupported]) {
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
    }
    
    [self.tableView setNumberOfRows:4 withRowType:@"rowvc"];
    for (int i = 0; i<4; i++) {
        RowVC *cell = [self.tableView rowControllerAtIndex:i];
        [cell.image setImageNamed:[NSString stringWithFormat:@"0%d",i+1]];
        [cell.lable setText:[NSString stringWithFormat:@"美女0%d",i+1]];
    }
    
    // Configure interface objects here.
}


-(void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex{
    [super table:table didSelectRowAtIndex:rowIndex];
    
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

#pragma mark  ------ Memu

- (IBAction)menu1Click {
    
    NSLog(@"-------->menu1   click");
    
}

- (IBAction)menu2Click {
    NSLog(@"-------->menu2   click");
}


- (id)contextForSegueWithIdentifier:(NSString *)segueIdentifier{
    return nil;
}

-(id)contextForSegueWithIdentifier:(NSString *)segueIdentifier inTable:(WKInterfaceTable *)table rowIndex:(NSInteger)rowIndex{
    return @{@"name":[NSString stringWithFormat:@"%d",rowIndex]};
}


- (IBAction)btnClick {
    [self.lable setText:@"你好"];

    WCSession *session = [WCSession defaultSession];
    
    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:@"张三",@"Name", nil];
    
    [session sendMessage:dic replyHandler:^(NSDictionary<NSString *,id> * _Nonnull replyMessage) {
        NSLog(@"replay: %@", replyMessage);
        
    } errorHandler:^(NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
    }];

    
   
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
    
    NSLog(@"watch ------->%@",name);
    
    
}




- (void)session:(WCSession *)session activationDidCompleteWithState:(WCSessionActivationState)activationState error:(nullable NSError *)error __IOS_AVAILABLE(9.3) __WATCHOS_AVAILABLE(2.2){
    
}

/** ------------------------- iOS App State For Watch ------------------------ */

/** Called when the session can no longer be used to modify or add any new transfers and, all interactive messages will be cancelled, but delegate callbacks for background transfers can still occur. This will happen when the selected watch is being changed. */


- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



