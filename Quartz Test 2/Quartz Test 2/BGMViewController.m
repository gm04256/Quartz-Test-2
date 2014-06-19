//
//  BGMViewController.m
//  Quartz Test 2
//
//  Created by 馬 岩 on 14-6-19.
//  Copyright (c) 2014年 馬 岩. All rights reserved.
//

#import "BGMViewController.h"

#import "BGMView.h"

@interface BGMViewController ()
@property (weak, nonatomic) IBOutlet BGMView *myView;

@property NSTimer* rotateTimer;

@end

@implementation BGMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	NSLog(@"%@", NSStringFromSelector(_cmd));
	
	NSLog(@"View Center: %@", NSStringFromCGPoint(self.myView.center));
	NSLog(@"star Center: %@", NSStringFromCGPoint(self.myView.myStar.center));
}

- (void)viewWillAppear:(BOOL)animated
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
	NSLog(@"View Center: %@", NSStringFromCGPoint(self.myView.center));
	NSLog(@"star Center: %@", NSStringFromCGPoint(self.myView.myStar.center));
}

- (void)viewDidAppear:(BOOL)animated
{
	self.myView.myStar = [[BGMStar alloc] initWithCenterPoint: self.myView.center andRadius: 100 andAngle:0];
	self.myView.lastUpdateDate = [NSDate date];
	
	[self.myView setNeedsDisplay];
	
	NSLog(@"%@", NSStringFromSelector(_cmd));
	NSLog(@"View Center: %@", NSStringFromCGPoint(self.myView.center));
	NSLog(@"star Center: %@", NSStringFromCGPoint(self.myView.myStar.center));
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rotateClicked:(id)sender
{
	if(self.rotateTimer != Nil)
	{
		[self.rotateTimer invalidate];
		self.rotateTimer = Nil;
	}
	
	self.myView.lastUpdateDate = [NSDate date];
	
	self.rotateTimer = [NSTimer scheduledTimerWithTimeInterval:0.017 target:self selector:@selector(rotateSchedule) userInfo:nil repeats:YES];
}

- (void)rotateSchedule
{
	[self.myView setNeedsDisplay];
}

- (IBAction)stopClicked:(id)sender
{
	[self.rotateTimer invalidate];
	self.rotateTimer = Nil;
}
@end
