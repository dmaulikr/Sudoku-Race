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

- (void)changeValueForPlayer:(NSString *)player forSquareIndex:(NSUInteger)index withValue:(int)value
{    
    NSLog(@"Attempting to changeValueForPlayer: %@ forSquareIndex: %d for value: %d", player, index, value);
    Square *selectedSquare = [self squareAtIndex:index];
    
    if (!selectedSquare.isLocked) {
        if ([player isEqualToString:@"one"]) {
            if (selectedSquare.playerTwoValue != value) {
                selectedSquare.playerOneValue = value;
            }
            selectedSquare.playerOneSelected = YES;
        } else if ([player isEqualToString:@"two"]) {
            if (selectedSquare.playerOneValue != value) {
                selectedSquare.playerTwoValue = value;
            }
            selectedSquare.playerTwoSelected = YES;
        }
    }
}

- (id)initWithSudokuBoard:(SudokuBoard *)sudokuBoard
{
    NSLog(@"Attempting initWithSudokuBoard with board: %@", sudokuBoard);
    self = [super init];
    
    if (self) {
        self.sudokuBoard = sudokuBoard;
        NSLog(@"Sudoku board successfully added to game");
    }
    
    return self;
}

- (NSUInteger)numberOfSquares
{
    return self.sudokuBoard.numberOfSquares;
}

- (Square *)squareAtIndex:(NSUInteger)index
{
    return [self.sudokuBoard squareAtIndex:index];
}

@end