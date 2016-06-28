//
//  ViewController.m
//  Graph-Practice
//
//  Created by Chris Nowak on 6/28/16.
//  Copyright © 2016 Chris Nowak Tho, LLC. All rights reserved.
//

#import "ViewController.h"
#import "CounterView.h"
#import "PushButtonView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet CounterView *counterView;
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;

@end

@implementation ViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - IBActions

-(IBAction)pushButtonPressed:(PushButtonView *)sender {
    if (sender.isAddButton) {
        self.counterView.counter++;
        [self updateCounterViewIfNecessary];
    } else {
        if (self.counterView.counter > 0) {
            self.counterView.counter--;
            [self updateCounterViewIfNecessary];
        }
    }
    self.counterLabel.text = [NSString stringWithFormat:@"%ld", (long)self.counterView.counter];
}

-(void)updateCounterViewIfNecessary {
    if (self.counterView.counter <= numberOfGlasses) {
        [self.counterView setNeedsDisplay];
    }
}

@end
