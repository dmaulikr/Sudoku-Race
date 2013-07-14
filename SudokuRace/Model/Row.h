//
//  Row.h
//  SudokuRace
//
//  Created by James M. Wilsterman on 7/14/13.
//  Copyright (c) 2013 James M. Wilsterman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Square.h"

@interface Row : NSObject

- (void)addSquare:(Square *)square;

- (int)length;

- (Square *)squareAtIndex:(NSUInteger)index;

@end
