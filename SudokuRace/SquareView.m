//
//  SquareView.m
//  SudokuRace
//
//  Created by James M. Wilsterman on 7/14/13.
//  Copyright (c) 2013 James M. Wilsterman. All rights reserved.
//

#import "SquareView.h"

@implementation SquareView

- (void)setPlayerOneValue:(int)playerOneValue
{
    _playerOneValue = playerOneValue;
    [self setNeedsDisplay];
}

- (void)setPlayerTwoValue:(int)playerTwoValue
{
    _playerTwoValue = playerTwoValue;
    [self setNeedsDisplay];
}

- (void)setInitialValue:(int)initialValue
{
    _initialValue = initialValue;
    [self setNeedsDisplay];
}

- (void)setLocked:(BOOL)locked
{
    _locked = locked;
    [self setNeedsDisplay];
}

- (void)setPlayerOneSelected:(BOOL)playerOneSelected
{
    _playerOneSelected = playerOneSelected;
    [self setNeedsDisplay];
}

- (void)setPlayerTwoSelected:(BOOL)playerTwoSelected
{
    _playerTwoSelected = playerTwoSelected;
    [self setNeedsDisplay];
}

#define PLAYER_ONE_RED 1.0
#define PLAYER_ONE_GREEN 0.75
#define PLAYER_ONE_BLUE 0.50

#define PLAYER_TWO_RED 0.50
#define PLAYER_TWO_GREEN 0.75
#define PLAYER_TWO_BLUE 1.0

#define PLAYER_ALPHA 1.0

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:6.0]; // MAGIC
    
    [roundedRect addClip];
    
    if (self.playerOneSelected && !self.playerTwoSelected) {
        [[UIColor colorWithRed:PLAYER_ONE_RED green:PLAYER_ONE_GREEN blue:PLAYER_ONE_BLUE alpha:PLAYER_ALPHA] setFill];
    } else if (self.playerTwoSelected && !self.playerOneSelected) {
        [[UIColor colorWithRed:PLAYER_TWO_RED green:PLAYER_TWO_GREEN blue:PLAYER_TWO_BLUE alpha:PLAYER_ALPHA] setFill];
    } else if (self.playerOneSelected && self.playerTwoSelected) {
        [[UIColor colorWithRed:PLAYER_ONE_RED green:PLAYER_ONE_GREEN blue:PLAYER_TWO_BLUE alpha:PLAYER_ALPHA] setFill];
    } else {
        [[UIColor whiteColor] setFill];
    }
    
    UIRectFill(self.bounds);
    [self drawValues];
    
    [[UIColor blackColor] setStroke];
    [roundedRect stroke];
}

#define PIP_FONT_SCALE_FACTOR 0.8
#define DUAL_PIP_FONT_SCALE_FACTOR 0.4

- (void)drawValues
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    UIFont *valueFont = [UIFont systemFontOfSize:self.bounds.size.width * PIP_FONT_SCALE_FACTOR];
    UIFont *dualValueFont = [UIFont systemFontOfSize:self.bounds.size.width * DUAL_PIP_FONT_SCALE_FACTOR];
    
    NSMutableAttributedString *valueText = nil;
    
    if (self.initialValue != 0) {
        valueText = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d", self.initialValue] attributes:@{ NSParagraphStyleAttributeName : paragraphStyle, NSFontAttributeName : valueFont }];
    } else if (self.playerOneValue && !self.playerTwoValue) {
        valueText = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d", self.playerOneValue] attributes:@{ NSParagraphStyleAttributeName : paragraphStyle, NSFontAttributeName : valueFont, NSForegroundColorAttributeName : [UIColor redColor] }];
    } else if (self.playerTwoValue && !self.playerOneValue) {
        valueText = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d", self.playerTwoValue] attributes:@{ NSParagraphStyleAttributeName : paragraphStyle, NSFontAttributeName : valueFont, NSForegroundColorAttributeName : [UIColor blueColor] }];
    } else if (self.playerTwoValue && self.playerOneValue) {
        valueText = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d\n%d", self.playerOneValue, self.playerTwoValue] attributes:@{ NSParagraphStyleAttributeName : paragraphStyle, NSFontAttributeName : dualValueFont, NSForegroundColorAttributeName : [UIColor redColor] }];
        [valueText setAttributes:@{NSParagraphStyleAttributeName : paragraphStyle, NSForegroundColorAttributeName : [UIColor blueColor] } range:NSMakeRange (2,1)];
    }
    
    CGRect textBounds;
    textBounds.origin = self.bounds.origin;
    textBounds.size = self.bounds.size;

    [valueText drawInRect:textBounds];

}

#pragma mark - Initialization

- (void)setup
{
    // do initialization here
}

- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setup];
    return self;
}

@end
