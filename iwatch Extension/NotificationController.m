//
//  NotificationController.m
//  iwatch Extension
//
//  Created by cai on 2018/6/5.
//  Copyright © 2018年 CAI YILONG. All rights reserved.
//

#import "NotificationController.h"



@interface NotificationController ()

@end


@implementation NotificationController

- (instancetype)init {
    self = [super init];
    if (self){
        // Initialize variables here.

    }
    return self;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

-(void)didReceiveNotification:(UNNotification *)notification withCompletion:(void (^)(WKUserNotificationInterfaceType))completionHandler{
    
    
    
}

-(void)handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)localNotification{
    
    NSLog(@"======>%@",identifier);
    
}

//- (nonnull NSArray<NSString *> *)suggestionsForResponseToActionWithIdentifier:(NSString *)identifier forNotification:(UNNotification *)notification inputLanguage:(NSString *)inputLanguage WK_AVAILABLE_WATCHOS_ONLY(3.0){
//
//}

//// deprecated
//- (void)didReceiveRemoteNotification:(NSDictionary *)remoteNotification withCompletion:(void(^)(WKUserNotificationInterfaceType interface)) completionHandler WK_DEPRECATED_WATCHOS_IOS(2.0, 3.0, 8.2, 10.0, "use didReceiveNotification:withCompletion:"){
//
//}
//- (void)didReceiveLocalNotification:(UILocalNotification *)localNotification withCompletion:(void(^)(WKUserNotificationInterfaceType interface)) completionHandler WK_DEPRECATED_WATCHOS_IOS(2.0, 3.0, 8.2, 10.0, "use didReceiveNotification:withCompletion:"){
//
//}
//- (nonnull NSArray<NSString *> *)suggestionsForResponseToActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)remoteNotification inputLanguage:(NSString *)inputLanguage WK_AVAILABLE_WATCHOS_ONLY(2.0) WK_DEPRECATED_WATCHOS(2.0, 3.0, "use suggestionsForResponseToActionWithIdentifier:forNotification:inputLanguage:"){
//
//}
//- (nonnull NSArray<NSString *> *)suggestionsForResponseToActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)localNotification inputLanguage:(NSString *)inputLanguage WK_AVAILABLE_WATCHOS_ONLY(2.0) WK_DEPRECATED_WATCHOS(2.0, 3.0, "use suggestionsForResponseToActionWithIdentifier:forNotification:inputLanguage:"){
//
//}


/*
- (void)didReceiveNotification:(UNNotification *)notification withCompletion:(void(^)(WKUserNotificationInterfaceType interface)) completionHandler {
    // This method is called when a notification needs to be presented.
    // Implement it if you use a dynamic notification interface.
    // Populate your dynamic notification interface as quickly as possible.
    //
    // After populating your dynamic notification interface call the completion block.
    completionHandler(WKUserNotificationInterfaceTypeCustom);
}
*/

@end



