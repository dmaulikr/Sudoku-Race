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

@property (strong, nonatomic) NSMutableArray *rows; // Array of Rows

@end

@implementation SudokuBoard

#define ROW_LENGTH 9
#define NUMBER_OF_ROWS 9

- (NSMutableArray *)rows
{
    if (!_rows) _rows = [[NSMutableArray alloc] init];
    return _rows;
}

- (void)addRow:(Row *)row
{
    if ([row length] == ROW_LENGTH) {
        [self.rows addObject:row];
    }
}

- (Row *)rowAtIndex:(NSUInteger)index
{
    return (index <= [self.rows count]) ? self.rows[index] : nil;
}

#define MAKE_RANDOM 1

- (id)initWithDifficulty:(NSString *)difficulty;
{
    self = [super init];
    
    if (self)
    {
        if ([difficulty isEqualToString:@"easy"]) {
            NSDictionary *board = [SudokuBoardDatabase easyBoards];
            if (board) {
                for (int i = 0; i < NUMBER_OF_ROWS; i++)
                {
                    Row *row = [[Row alloc] init];
                    for (int i = 0; i < ROW_LENGTH; i++)
                    {
                        Square *square = [[Square alloc] init];
                        id value = [board objectForKey:[NSString stringWithFormat:@"%d", MAKE_RANDOM]];
                        if ([value isKindOfClass:[NSNumber class]]) {
                            NSNumber *numberValue = value;
                            square.initialValue = [numberValue integerValue];
                            if (square.initialValue == 0) {
                                square.Locked = NO;
                            } else {
                                square.Locked = YES;
                            }
                            [row addSquare:square];
                        }
                    }
                    [self addRow:row];
                }
            }
        }
        
    }
    
    return self;
}

@end
