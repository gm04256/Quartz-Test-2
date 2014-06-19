//
//  BGMStar.h
//  Quartz Test 2
//
//  Created by 馬 岩 on 14-6-19.
//  Copyright (c) 2014年 馬 岩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BGMStar : NSObject

@property float radius;
@property float currentAngle;
@property CGPoint center;
@property NSMutableArray* points;

- (instancetype)initWithCenterPoint:(CGPoint)center andRadius:(float)radius andAngle:(float)angle;

@end
