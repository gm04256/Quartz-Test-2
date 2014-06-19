//
//  BGMView.h
//  Quartz Test 2
//
//  Created by 馬 岩 on 14-6-19.
//  Copyright (c) 2014年 馬 岩. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BGMStar.h"

@interface BGMView : UIView

@property NSDate* lastUpdateDate;

@property BGMStar* myStar;

- (void)startAnimation;
- (void)stopAnimation;

@end
