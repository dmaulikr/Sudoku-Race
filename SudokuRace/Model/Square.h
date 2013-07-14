//
//  Square.h
//  SudokuRace
//
//  Created by James M. Wilsterman on 7/14/13.
//  Copyright (c) 2013 James M. Wilsterman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Square : NSObject

@property (nonatomic) int playerOneValue;
@property (nonatomic) int playerTwoValue;
@property (nonatomic) int initialValue;

@property (nonatomic, getter=isLocked) BOOL locked;

@end