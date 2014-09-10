//
//  PGViewController.m
//  PirateGame
//
//  Created by Leonel Garza on 9/5/14.
//  Copyright (c) 2014 Leonel Garza. All rights reserved.
//

#import "PGViewController.h"
#import "PGFactory.h"
#import "PGTile.h"

@interface PGViewController ()

@end

@implementation PGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    PGFactory *factory = [[PGFactory alloc] init];
    self.tiles = [factory tiles];
    self.character = [factory charater];
    self.boss = [factory boss];
    //NSLog(@"%@", tiles);
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Instructions!" message:@"Use the lower right navigation buttons to move through the views... good luck! " delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alertView show];

    
    self.currentPoint = CGPointMake(0, 0);
    //NSLog(@"%f %f", self.currentPoint.x, self.currentPoint.y);
    [self updateCharacterStatsForArmor:nil withWeapon:nil withHealthEffect:0];
    [self updateTile];
    [self updateButtons];
    
    self.actionButton.enabled = YES;
    self.northButton.enabled = YES;
    self.southButton.enabled = YES;
    self.eastButton.enabled = YES;
    self.westButton.enabled = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionButtonPressed:(UIButton *)sender
{
    PGTile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    [self updateCharacterStatsForArmor:tile.armor withWeapon:tile.weapon withHealthEffect:tile.healthEffect];
    if (tile.healthEffect == -20){
        self.character.health = self.character.health - self.boss.damage;
        self.boss.health = self.boss.health - self.character.damage;
        [self updateTile];
        self.actionButton.enabled = YES;
    }
    if (self.character.health <= 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Defeated!" message:@"You are a damn loser argggh!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
        self.actionButton.enabled = NO;
        self.northButton.enabled = NO;
        self.southButton.enabled = NO;
        self.eastButton.enabled = NO;
        self.westButton.enabled = NO;
    }
    else if (self.boss.health <= 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"I expected more!" message:@"You did so so... but you won!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
        self.actionButton.enabled = NO;
        self.northButton.enabled = NO;
        self.southButton.enabled = NO;
        self.eastButton.enabled = NO;
        self.westButton.enabled = NO;
    }
    [self updateTile];
}

- (IBAction)northButtonPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y + 1);
    [self updateButtons];
    [self updateTile];
    self.actionButton.enabled = YES;
}

- (IBAction)southButtonPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
    [self updateButtons];
    [self updateTile];
    self.actionButton.enabled = YES;
}

- (IBAction)eastButtonPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
    self.actionButton.enabled = YES;
}

- (IBAction)westButtonPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
    self.actionButton.enabled = YES;
}

- (IBAction)resetButtonPressed:(UIButton *)sender {
    self.character = nil;
    self.boss = nil;
    [self viewDidLoad]; 
}

-(void) updateTile {
    PGTile *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    self.storyLabel.text = tileModel.story;
    self.backgroundImageView.image = tileModel.backgroundImage;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.weaponLabel.text = self.character.weapon.name;
    self.armonLabel.text = self.character.armor.name; 
    [self.actionButton setTitle:tileModel.actionButtonName forState:UIControlStateNormal];
}

-(void)updateButtons {
    self.westButton.hidden = [self tileExistsAtPont:CGPointMake(self.currentPoint.x - 1, self.currentPoint.y)];
    self.eastButton.hidden = [self tileExistsAtPont:CGPointMake(self.currentPoint.x + 1, self.currentPoint.y)];
    self.northButton.hidden = [self tileExistsAtPont:CGPointMake(self.currentPoint.x, self.currentPoint.y + 1)];
    self.southButton.hidden = [self tileExistsAtPont:CGPointMake(self.currentPoint.x, self.currentPoint.y - 1)];
}

-(BOOL)tileExistsAtPont: (CGPoint) point
{
    if(point.y >= 0 && point.x >= 0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count])
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

-(void) updateCharacterStatsForArmor:(PGArmor *) armor withWeapon: (PGWeapon *) weapon withHealthEffect: (int) heathEffect
{
    if(armor != nil)
    {
        self.character.health = self.character.health - self.character.armor.health + armor.health;
        self.character.armor = armor;
    }
    else if (weapon != nil)
    {
        self.character.damage = self.character.damage - self.character.weapon.damage + weapon.damage;
        self.character.weapon = weapon;
    }
    else if (heathEffect != 0)
    {
        self.character.health = self.character.health + heathEffect;
        self.actionButton.enabled = NO;
    }
    else {
        self.character.health = self.character.health + self.character.armor.health;
        self.character.damage = self.character.damage + self.character.weapon.damage;
    }
}

@end
