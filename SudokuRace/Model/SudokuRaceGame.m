//
//  SudokuRaceGame.m
//  SudokuRace
//
//  Created by James M. Wilsterman on 7/14/13.
//  Copyright (c) 2013 James M. Wilsterman. All rights reserved.
//

#import "SudokuRaceGame.h"

@interface SudokuRaceGame()

@property (readwrite, nonatomic) int playerOneScore;
@property (readwrite, nonatomic) int playerTwoScore;

@property (strong, nonatomic) SudokuBoard *sudokuBoard;

@end

@implementation SudokuRaceGame

- (void)changeValueForPlayer:(NSString *)player forRowIndex:(NSUInteger)row forSquareIndex:(NSUInteger)square withValue:(int)value
{    
    Row *selectedRow = [self.sudokuBoard rowAtIndex:row];
    Square *selectedSquare = [selectedRow squareAtIndex:square];
    
    if (!selectedSquare.isLocked) {
        if ([player isEqualToString:@"one"]) {
            if (!selectedSquare.playerTwoValue == value) {
                selectedSquare.playerOneValue = value;
            }
        } else if ([player isEqualToString:@"two"]) {
            if (!selectedSquare.playerOneValue == value) {
                selectedSquare.playerTwoValue = value;
            }
        }
    }
}

- (id)initWithSudokuBoard:(SudokuBoard *)sudokuBoard
{
    self = [super init];
    
    if (self) {
        self.sudokuBoard = sudokuBoard;
    }
    
    return self;
}

@end
