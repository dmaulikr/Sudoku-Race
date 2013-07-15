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

- (void)changeValueForPlayer:(NSString *)player withValue:(int)value
{    
    NSLog(@"Attempting to changeValueForPlayer: %@ for value: %d", player, value);
    
    Square *selectedSquare = nil;
    for (int i = 0; i < [self numberOfSquares]; i++) {
        Square *square = [self squareAtIndex:i];
        if ([player isEqualToString:@"one"]) {
            if (square.playerOneSelected) {
                selectedSquare = square;
                i = [self numberOfSquares];
            }
        } else if ([player isEqualToString:@"two"]) {
            if (square.playerTwoSelected) {
                selectedSquare = square;
                i = [self numberOfSquares];
            }
        }
    }
    
    if (!selectedSquare.isLocked) {
        if ([player isEqualToString:@"one"]) {
            if (value == 0) {
                selectedSquare.playerOneValue = 0;
            } else if (selectedSquare.playerTwoValue != value) {
                selectedSquare.playerOneValue = value;
            }
        } else if ([player isEqualToString:@"two"]) {
            if (value == 0) {
                selectedSquare.playerTwoValue = 0;
            } else if (selectedSquare.playerOneValue != value) {
                selectedSquare.playerTwoValue = value;
            }
        }
    }
}

- (void)toggleSelectionStateForPlayer:(NSString *)player forSquareIndex:(NSUInteger)index
{
    Square *selectedSquare = [self squareAtIndex:index];
    if (!selectedSquare.isLocked) {
        if ([player isEqualToString:@"one"]) {
            selectedSquare.playerOneSelected = !selectedSquare.playerOneSelected;
        } else if ([player isEqualToString:@"two"]) {
            selectedSquare.playerTwoSelected = !selectedSquare.playerTwoSelected;
        }
    }
    
    for (int i = 0; i < [self numberOfSquares]; i++) {
        if (i != index) {
            Square *square = [self squareAtIndex:i];
            if ([player isEqualToString:@"one"]) {
                square.playerOneSelected = NO;
            } else if ([player isEqualToString:@"two"]) {
                square.playerTwoSelected = NO;
            }            
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

- (BOOL)selectionStateAtIndex:(NSUInteger)index forPlayer:(NSString *)player
{
    Square *selectedSquare = [self squareAtIndex:index];
    
    if ([player isEqualToString:@"one"]) {
        return selectedSquare.playerOneSelected;
    } else if ([player isEqualToString:@"two"]) {
        return selectedSquare.playerTwoSelected;
    } else {
        return NO;
    }
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