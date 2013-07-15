//
//  SudokuRaceGame.h
//  SudokuRace
//
//  Created by James M. Wilsterman on 7/14/13.
//  Copyright (c) 2013 James M. Wilsterman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SudokuBoard.h"

@interface SudokuRaceGame : NSObject

- (id)initWithSudokuBoard:(SudokuBoard *)sudokuBoard;

@property (readonly, nonatomic) int playerOneScore;
@property (readonly, nonatomic) int playerTwoScore;

- (void)changeValueForPlayer:(NSString *)player forSquareIndex:(NSUInteger)index withValue:(int)value;

- (void)toggleSelectionStateForPlayer:(NSString *)player forSquareIndex:(NSUInteger)index;

- (NSUInteger)numberOfSquares;

- (Square *)squareAtIndex:(NSUInteger)index;

- (BOOL)selectionStateAtIndex:(NSUInteger)index forPlayer:(NSString *)player;

@end
