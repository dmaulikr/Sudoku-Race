//
//  SudokuBoard.m
//  SudokuRace
//
//  Created by James M. Wilsterman on 7/14/13.
//  Copyright (c) 2013 James M. Wilsterman. All rights reserved.
//

#import "SudokuBoard.h"
#import "SudokuBoardDatabase.h"

@interface SudokuBoard()

@property (strong, nonatomic) NSMutableArray *squares; // Array of Squares

@end

@implementation SudokuBoard

#define NUMBER_OF_SQUARES 81

- (NSUInteger)numberOfSquares
{
    if (!_numberOfSquares) _numberOfSquares = [self.squares count];
    return _numberOfSquares;
}

- (NSMutableArray *)squares
{
    if (!_squares) _squares = [[NSMutableArray alloc] init];
    return _squares;
}

- (void)addSquare:(Square *)square
{
    if ([self.squares count] < NUMBER_OF_SQUARES) {
        [self.squares addObject:square];
    }
}

- (Square *)squareAtIndex:(NSUInteger)index
{
    return (index < self.numberOfSquares) ? self.squares[index] : nil;
}

#define MAKE_RANDOM 1

- (id)initWithDifficulty:(NSString *)difficulty;
{
    NSLog(@"1/ Attempting initWithDifficulty: %@", difficulty);
    self = [super init];
    
    if (self)
    {
        if ([difficulty isEqualToString:@"easy"]) {
            NSDictionary *easyBoards = [SudokuBoardDatabase easyBoards];
            NSLog(@"2/ Got Board: %@", easyBoards);
            if (easyBoards) {
                NSLog(@"Creating board from squares...");
                id values = [easyBoards objectForKey:[NSString stringWithFormat:@"%d", MAKE_RANDOM]];
                if ([values isKindOfClass:[NSArray class]]) {
                    NSArray *arrayOfValues = values;
                    for (int i = 0; i < [values count]; i++)
                    {
                        Square *square = [[Square alloc] init];
                        id value = arrayOfValues[i];
                        if ([value isKindOfClass:[NSNumber class]]) {
                            NSNumber *numberValue = value;
                            square.initialValue = [numberValue integerValue];
                            if (square.initialValue == 0) {
                                square.Locked = NO;
                            } else {
                                square.Locked = YES;
                            }
                            NSLog(@"Attemtping to add Square with initial value %d", square.initialValue);
                            [self addSquare:square];
                        }
                    }

                }
            }
        }
    }
    return self;
}

@end
