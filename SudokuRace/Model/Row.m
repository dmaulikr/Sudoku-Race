//
//  Row.m
//  SudokuRace
//
//  Created by James M. Wilsterman on 7/14/13.
//  Copyright (c) 2013 James M. Wilsterman. All rights reserved.
//

#import "Row.h"

@interface Row ()

@property (strong, nonatomic) NSMutableArray *squares; // Array of Squares

@end

@implementation Row

- (NSMutableArray *)squares
{
    if (!_squares) _squares = [[NSMutableArray alloc] init];
    return _squares;
}

- (void)addSquare:(Square *)square
{
    [self.squares addObject:square];
}

- (Square *)squareAtIndex:(NSUInteger)index
{
    return (index <= [self.squares count]) ? self.squares[index] : nil;
}

- (int)length
{
    return self.squares.count;
}

@end
