//
//  SudokuRaceViewController.h
//  SudokuRace
//
//  Created by James M. Wilsterman on 7/14/13.
//  Copyright (c) 2013 James M. Wilsterman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SudokuBoard.h"
#import "SudokuRaceGame.h"

@interface SudokuRaceViewController : UIViewController

- (SudokuBoard *)createSudokuBoard;

- (void)updateCell:(UICollectionViewCell *)cell usingSquare:(Square *)square;

@property (strong, nonatomic) SudokuRaceGame *game;

@property (readonly, nonatomic) NSString *difficulty;

@property (weak, nonatomic) IBOutlet UICollectionView *squareCollectionView;

@end
