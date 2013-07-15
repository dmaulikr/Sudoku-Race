//
//  Square.m
//  SudokuRace
//
//  Created by James M. Wilsterman on 7/14/13.
//  Copyright (c) 2013 James M. Wilsterman. All rights reserved.
//

#import "Square.h"

@implementation Square

#define MIN_VALUE 0
#define MAX_VALUE 9

- (void)setPlayerOneValue:(int)playerOneValue
{
    if (MIN_VALUE <= playerOneValue && MAX_VALUE >= playerOneValue) {
        _playerOneValue = playerOneValue;
    }
}

- (void)setPlayerTwoValue:(int)playerTwoValue
{
    if (MIN_VALUE <= playerTwoValue && MAX_VALUE >= playerTwoValue) {
        _playerTwoValue = playerTwoValue;
    }
}

@end
