//
//  BGMView.m
//  Quartz Test 2
//
//  Created by 馬 岩 on 14-6-19.
//  Copyright (c) 2014年 馬 岩. All rights reserved.
//

#import "BGMView.h"

@implementation BGMView

- (id)initWithFrame:(CGRect)frame
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder*)coder
{
	NSLog(@"%@", NSStringFromSelector(_cmd));

	if (self = [super initWithCoder:coder]) {
        // Initialization code
		
//		self.myStar = [[BGMStar alloc] initWithCenterPoint: self.center andRadius: 100 andAngle:0];
//		self.lastUpdateDate = [NSDate date];
//		
//		NSLog(@"Points: %@", self.myStar.points);
//		NSLog(@"View Center: %@", NSStringFromCGPoint(self.center));
//		NSLog(@"star Center: %@", NSStringFromCGPoint(self.myStar.center));
	}
	return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGContextSetLineWidth(context, 4.0);
	CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
	
	NSDate* now = [NSDate date];
	NSTimeInterval interval = [now timeIntervalSinceDate:self.lastUpdateDate];
	
	self.myStar.currentAngle += interval;
	
	/////////////////////////////////////////////////////////////////////////////////
	
	CGContextSaveGState(context);
	
	CGContextTranslateCTM(context, self.myStar.center.x, self.myStar.center.y);
	NSLog(@"View Center: %@", NSStringFromCGPoint(self.center));
	NSLog(@"star Center: %@", NSStringFromCGPoint(self.myStar.center));
	
	CGContextRotateCTM(context, self.myStar.currentAngle);
	
	CGContextMoveToPoint(context, [self.myStar.points[0] CGPointValue].x, [self.myStar.points[0] CGPointValue].y);
	int j = 0;
	
	for (int i = 0; i < self.myStar.points.count; i++)
	{
		j += 2;
		if(j >= self.myStar.points.count)
		{
			j -= self.myStar.points.count;
		}
		CGContextAddLineToPoint(context, [self.myStar.points[j] CGPointValue].x, [self.myStar.points[j] CGPointValue].y);
	}
	
	CGContextStrokePath(context);
	
	CGContextRestoreGState(context);
	
	/////////////////////////////////////////////////////////////////////////////////
	
	self.lastUpdateDate = now;
}

@end
