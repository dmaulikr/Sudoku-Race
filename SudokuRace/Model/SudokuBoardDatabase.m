//
//  SudokuBoardDatabase.m
//  SudokuRace
//
//  Created by James M. Wilsterman on 7/14/13.
//  Copyright c 2013 James M. Wilsterman. All rights reserved.
//

#import "SudokuBoardDatabase.h"

@interface SudokuBoardDatabase()

@end

@implementation SudokuBoardDatabase

+ (NSDictionary *)easyBoards
{
    NSDictionary *easyBoards = nil;
    if (!easyBoards) {
        easyBoards = @{ @"1" : @[@0,@5,@4,@9,@3,@7,@8,@0,@0,@0,@7,@6,@0,@2,@0,@0,@0,@0,@2,@0,@0,@0,@0,@4,@9,@1,@0,@0,@0,@0,@0,@5,@0,@0,@4,@0,@0,@0,@7,@2,@0,@1,@3,@0,@0,@0,@4,@0,@0,@7,@0,@0,@0,@0,@0,@8,@3,@4,@0,@0,@0,@0,@9,@0,@0,@0,@0,@8,@0,@1,@6,@0,@0,@0,@1,@3,@9,@6,@5,@8,@0]};
    }
    
    return easyBoards;
}

@end
