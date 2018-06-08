//
//  Controller01.m
//  iwatch Extension
//
//  Created by cai on 2018/6/6.
//  Copyright © 2018年 CAI YILONG. All rights reserved.
//

#import "Controller01.h"

@interface Controller01()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *titleLable;

@end

@implementation Controller01


-(void)awakeWithContext:(id)context{
    
    [self.titleLable setText:(NSDictionary *)context[@"name"]];
    
    
}

@end
