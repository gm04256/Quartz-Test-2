//
//  BGMStar.m
//  Quartz Test 2
//
//  Created by 馬 岩 on 14-6-19.
//  Copyright (c) 2014年 馬 岩. All rights reserved.
//

#import "BGMStar.h"

#import "BGMConstants.h"

@implementation BGMStar

- (instancetype)initWithCenterPoint:(CGPoint)center andRadius:(float)radius andAngle:(float)angle
{
	if(self = [super init])
	{
		self.center = center;
		self.radius = radius;
		self.currentAngle = angle;
		
		self.points = [NSMutableArray arrayWithCapacity:5];
		
		self.points[0] = [NSValue valueWithCGPoint:CGPointMake(0, -self.radius)];
		self.points[1] = [NSValue valueWithCGPoint:CGPointMake(self.radius * sin(degreeToRadian(72)), -self.radius * cos(degreeToRadian(72)))];
		self.points[2] = [NSValue valueWithCGPoint:CGPointMake(self.radius * sin(degreeToRadian(144)), -self.radius * cos(degreeToRadian(144)))];
		self.points[3] = [NSValue valueWithCGPoint:CGPointMake(-[self.points[2] CGPointValue].x, [self.points[2] CGPointValue].y)];
		self.points[4] = [NSValue valueWithCGPoint:CGPointMake(-[self.points[1] CGPointValue].x, [self.points[1] CGPointValue].y)];

	}
	return self;
}

@end
