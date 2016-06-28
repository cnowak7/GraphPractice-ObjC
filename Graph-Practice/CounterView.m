//
//  CounterView.m
//  Graph-Practice
//
//  Created by Chris Nowak on 6/28/16.
//  Copyright © 2016 Chris Nowak Tho, LLC. All rights reserved.
//

#import "CounterView.h"

IB_DESIGNABLE

@interface CounterView ()

@property (nonatomic) IBInspectable UIColor *outlineColor;
@property (nonatomic) IBInspectable UIColor *counterColor;

@end

@implementation CounterView

NSInteger const numberOfGlasses = 8;

CGFloat const pi = (CGFloat)M_PI;

- (void)drawRect:(CGRect)rect {
    // DRAWING THE ARC
    
    // get the center
    CGPoint center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    
    // get the radius
    CGFloat radius = MAX(self.bounds.size.width, self.bounds.size.height);
    
    // get the arc width
    CGFloat arcWidth = 76;
    
    // establish starting and ending angles
    CGFloat startAngle = 3 * pi / 4;
    CGFloat endAngle = pi / 4;
    
    // establish path
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius/2 - arcWidth/2 startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    // establish stroke
    path.lineWidth = arcWidth;
    [self.counterColor setStroke];
    [path stroke];
    
    // DRAWING THE OUTLINE
    
    // calculate the difference between the two angles
    // ensuring if it's positive
    CGFloat angleDifference = 2 * pi - startAngle + endAngle;
    
    // calculate the arc for each single glass
    CGFloat arcLengthPerGlass = angleDifference / (CGFloat)numberOfGlasses;
    
    // multiply out by the actual glasses drunk
    CGFloat outlineEndAngle = arcLengthPerGlass * (CGFloat)self.counter + startAngle;
    
    // draw the outer arc
    UIBezierPath *outlinePath = [UIBezierPath bezierPathWithArcCenter:center radius:self.bounds.size.width/2 - 2.5 startAngle:startAngle endAngle:outlineEndAngle clockwise:YES];
    
    // draw the inner arc
    [outlinePath addArcWithCenter:center radius:self.bounds.size.width/2 - arcWidth + 2.5 startAngle:outlineEndAngle endAngle:startAngle clockwise:NO];
    
    // close the path
    [outlinePath closePath];
    
    [self.outlineColor setStroke];
    outlinePath.lineWidth = 5.0;
    [outlinePath stroke];
}

@end
