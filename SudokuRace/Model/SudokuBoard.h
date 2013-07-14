//
//  SudokuBoard.h
//  SudokuRace
//
//  Created by James M. Wilsterman on 7/14/13.
//  Copyright (c) 2013 James M. Wilsterman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Row.h"

@interface SudokuBoard : NSObject

- (void)addRow:(Row *)row;

- (Row *)rowAtIndex:(NSUInteger)index;

@end
