//
//  SudokuBoard.h
//  SudokuRace
//
//  Created by James M. Wilsterman on 7/14/13.
//  Copyright (c) 2013 James M. Wilsterman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Square.h"

@interface SudokuBoard : NSObject

@property (nonatomic) NSUInteger numberOfSquares;

- (void)addSquare:(Square *)square;

- (id)initWithDifficulty:(NSString *)difficulty;

- (Square *)squareAtIndex:(NSUInteger)index;

@end
