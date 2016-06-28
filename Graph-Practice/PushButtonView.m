//
//  PushButtonView.m
//  Graph-Practice
//
//  Created by Chris Nowak on 6/28/16.
//  Copyright © 2016 Chris Nowak Tho, LLC. All rights reserved.
//

#import "PushButtonView.h"

IB_DESIGNABLE

@interface PushButtonView ()

@property (nonatomic) IBInspectable UIColor *fillColor;

@end

@implementation PushButtonView

- (void)drawRect:(CGRect)rect {
    // draw the circle first
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    [self.fillColor setFill];
    [path fill];
    
    // set up the width and height variables
    // for the horizontal stroke
    CGFloat plusHeight = 3.0;
    CGFloat plusWidth = MIN(self.bounds.size.width, self.bounds.size.height) * 0.6;
    
    // create the path
    UIBezierPath *plusPath = [[UIBezierPath alloc] init];
    
    // set the path's line width to the height of the stroke
    plusPath.lineWidth = plusHeight;
    
    // HORIZONTAL LINE
    
    // move the intitial point of the path
    // to the start of the horizontal stroke
    [plusPath moveToPoint:CGPointMake(self.bounds.size.width/2 - plusWidth/2 + 0.5, self.bounds.size.height/2 + 0.5)];
    
    // add a point to the path at the end
    // of the horizontal stroke
    [plusPath addLineToPoint:CGPointMake(self.bounds.size.width/2 + plusWidth/2 + 0.5, self.bounds.size.height/2 + 0.5)];
    
    // VERTICAL LINE
    
    if (self.isAddButton) {
        // move the initial point of the path
        // to the start of the vertical stroke
        [plusPath moveToPoint:CGPointMake(self.bounds.size.width/2 + 0.5, self.bounds.size.height/2 - plusWidth/2 + 0.5)];
        
        // add a point to the path at the end
        // of the vertical stroke
        [plusPath addLineToPoint:CGPointMake(self.bounds.size.width/2 + 0.5, self.bounds.size.height/2 + plusWidth/2 + 0.5)];
    }
    
    // set the stroke color
    [[UIColor whiteColor] setStroke];
    
    // draw the stroke
    [plusPath stroke];
}

@end
