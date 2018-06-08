//
//  RowVC.h
//  iwatch Extension
//
//  Created by cai on 2018/6/5.
//  Copyright © 2018年 CAI YILONG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

@interface RowVC : NSObject

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *image;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *lable;
@end
