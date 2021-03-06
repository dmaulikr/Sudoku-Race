//
//  SudokuRaceViewController.m
//  SudokuRace
//
//  Created by James M. Wilsterman on 7/14/13.
//  Copyright (c) 2013 James M. Wilsterman. All rights reserved.
//

#import "SudokuRaceViewController.h"
#import "SudokuBoard.h"
#import "SudokuRaceCollectionViewCell.h"

@interface SudokuRaceViewController () <UICollectionViewDataSource, UICollectionViewDelegate> // now we must implement mandatory methods in these protocols

@property (weak, nonatomic) IBOutlet UISegmentedControl *playerPicker;

@property (strong, nonatomic) NSString *player;

@end

@implementation SudokuRaceViewController

- (void)viewDidLoad
{
    self.player = @"one";
}

- (SudokuRaceGame *)game
{
    if (!_game) {
        NSLog(@"Attempting game lazy instantiation");
        _game = [[SudokuRaceGame alloc] initWithSudokuBoard:[self createSudokuBoard]];
    }
    return _game;
}

- (SudokuBoard *)createSudokuBoard
{
        NSLog(@"Attempting createSudokuBoard");
    return [[SudokuBoard alloc] initWithDifficulty:@"easy"];
}
- (IBAction)selectPlayer:(UISegmentedControl *)sender {
    if ([self.player isEqualToString:@"one"]) {
        self.player = @"two";
    } else {
        self.player = @"one";
    }
}

#pragma mark - UICollectionViewDataSource

/*
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(24.0, 24.0);
}
*/

// first mandatory method in the UICollectionViewDataSource protocol - returns how many UICollectiongViewCells are in a given section
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return [self.game numberOfSquares];
}

// actual data provider method - returns a new box (cell) at an index with model data - NSIndexPath is just an object with an item property and a section property (see lec. 7 slide 37)
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Square" forIndexPath:indexPath];
    Square *square = [self.game squareAtIndex:indexPath.item];
    [self updateCell:cell usingSquare:square];
    return cell;
}

- (void)updateCell:(UICollectionViewCell *)cell usingSquare:(Square *)square
{
    if ([cell isKindOfClass:[SudokuRaceCollectionViewCell class]]) {
        SquareView *squareView = ((SudokuRaceCollectionViewCell *)cell).squareView;
        squareView.playerOneValue = square.playerOneValue;
        squareView.playerTwoValue = square.playerTwoValue;
        squareView.initialValue = square.initialValue;
        squareView.locked = square.isLocked;
        squareView.alpha = square.isLocked ? 0.7 : 1.0;
        squareView.playerOneSelected = square.isPlayerOneSelected;
        squareView.playerTwoSelected = square.isPlayerTwoSelected;
    }
}

#pragma mark - Updating the UI

- (void)updateUI
{
    for (UICollectionViewCell *cell in [self.squareCollectionView visibleCells]) {
        NSIndexPath *indexPath = [self.squareCollectionView indexPathForCell:cell];
        Square *square = [self.game squareAtIndex:indexPath.item];
        [self updateCell:cell usingSquare:square];
    }
}
- (IBAction)newGame {
    self.game = nil;
    [self updateUI];
    [self.squareCollectionView reloadData];
}

- (IBAction)editSquare:(UITapGestureRecognizer *)gesture
{
    CGPoint tapLocation = [gesture locationInView:self.squareCollectionView];
    NSIndexPath *indexPath = [self.squareCollectionView indexPathForItemAtPoint:tapLocation];
    if (indexPath) {
        
        [self.game toggleSelectionStateForPlayer:self.player forSquareIndex:(indexPath.item)];
        
        BOOL selectedForPlayer = [self.game selectionStateAtIndex:(indexPath.item) forPlayer:self.player];
        
        if (selectedForPlayer) {
            [self showKeyPad];
        } else {
            [self hideKeyPad];
        }
        
        [self updateUI];
    }
}

#define CLEAR_VALUE_CODE 0

- (IBAction)pressKeyPad:(UIButton *)sender
{
    [self.game changeValueForPlayer:self.player withValue:[sender.currentTitle intValue]];
    if (self.game.playerOneNeedsAlert || self.game.playerTwoNeedsAlert) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry!"
                                                        message:@"You can't copy your opponent!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    [self updateUI];
}

- (void)showKeyPad
{
    self.keyPadView.hidden = NO;
}

- (void)hideKeyPad
{
    self.keyPadView.hidden = YES;
}

@end
