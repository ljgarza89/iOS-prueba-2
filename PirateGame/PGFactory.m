//
//  PGFactory.m
//  PirateGame
//
//  Created by Leonel Garza on 9/8/14.
//  Copyright (c) 2014 Leonel Garza. All rights reserved.
//

#import "PGFactory.h"
#include "PGTile.h"

@implementation PGFactory

-(NSArray *)tiles {
    PGTile *tile1 = [[PGTile alloc] init];
    tile1.story = @"Captain, we need a fearless leader such as yourself to undertake a voyage. You just stop the evil pirate Boss. Would you like a blunted sword to get started?";
    tile1.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    PGWeapon *bluntedSword = [[PGWeapon alloc] init];
    bluntedSword.name = @"Blunted sword";
    bluntedSword.damage = 13;
    tile1.weapon = bluntedSword;
    tile1.actionButtonName = @"Grab sword!"; 
    
    PGTile *tile2 = [[PGTile alloc] init];
    tile2.story = @"You have come across an armory. Would you like to upgrade to a steel armor?";
    tile2.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    PGArmor *steelArmor = [[PGArmor alloc] init];
    steelArmor.name = @"Steel armor";
    steelArmor.health = 10;
    tile2.armor = steelArmor;
    tile2.actionButtonName = @"Grab steel armor!";
    
    PGTile *tile3 = [[PGTile alloc] init];
    tile3.story = @"A myterious dock appears on the horizon. Should we stop and ask for directions?";
    tile3.backgroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile3.healthEffect = 15;
    tile3.actionButtonName = @"Stop arghhh!";
    
    NSMutableArray *firstColumn = [[NSMutableArray alloc] init];
    [firstColumn addObject:tile1];
    [firstColumn addObject:tile2];
    [firstColumn addObject:tile3];
    
    PGTile *tile4 = [[PGTile alloc] init];
    tile4.story = @"You have found a parrot. This can be used in your armor slot. Parrots are a great defender and are fiercly loyal to their captain!";
    tile4.backgroundImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    PGArmor *parrotArmor = [[PGArmor alloc] init];
    parrotArmor.name = @"Parrot armor";
    parrotArmor.health = 20;
    tile4.armor = parrotArmor;
    tile4.actionButtonName = @"Parrot I choose you!";
    
    PGTile *tile5 = [[PGTile alloc] init];
    tile5.story = @"You have stumbled upon a cache of pirate weapons. Would you like to upgrade to a pistol?";
    tile5.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    PGWeapon *pistolWeapon = [[PGWeapon alloc] init];
    pistolWeapon.name = @"Pistol weapon";
    pistolWeapon.damage = 50;
    tile5.weapon = pistolWeapon;
    tile5.actionButtonName = @"Grab AK-47";
    
    PGTile *tile6 = [[PGTile alloc] init];
    tile6.story = @"You have been captured by pirates and are ordered to walk the plank.";
    tile6.backgroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    tile6.healthEffect = -30;
    tile6.actionButtonName = @"Damn! Lets scape from this shit";
    
    NSMutableArray *secondColumn = [[NSMutableArray alloc] init];
    [secondColumn addObject:tile4];
    [secondColumn addObject:tile5];
    [secondColumn addObject:tile6];
    
    PGTile *tile7 = [[PGTile alloc] init];
    tile7.story = @"You have sighted a pirate battle off the coast. Should we intervine?";
    tile7.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile7.healthEffect = 30;
    tile7.actionButtonName = @"Argggg help those biatches";
    
    PGTile *tile8 = [[PGTile alloc] init];
    tile8.story = @"The legend of the deep. The mighty kraken appears!";
    tile8.backgroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    tile8.healthEffect = -90;
    tile8.actionButtonName = @"Arggg we are fucked";
    
    PGTile *tile9 = [[PGTile alloc] init];
    tile9.story = @"You have stumbled upon a hidden cave of pirate treasurer!";
    tile9.backgroundImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    tile9.healthEffect = 120;
    tile9.actionButtonName = @"Take everything";
    
    NSMutableArray *thirdColumn = [[NSMutableArray alloc] init];
    [thirdColumn addObject:tile7];
    [thirdColumn addObject:tile8];
    [thirdColumn addObject:tile9];
    
    PGTile *tile10 = [[PGTile alloc] init];
    tile10.story = @"A group of pirates attempts to board your ship";
    tile10.backgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile10.healthEffect = -54;
    tile10.actionButtonName = @"Kill everyone!";
    
    PGTile *tile11 = [[PGTile alloc] init];
    tile11.story = @"In the deep of the sea many things live and many things can be found. Will the fortune bring help or ruin?";
    tile11.backgroundImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    tile11.healthEffect = 190;
    tile11.actionButtonName = @"Ohh captain ma captain";
    
    PGTile *tile12 = [[PGTile alloc] init];
    tile12.story = @"Your final faceoff with the fearsome pitate Boss!";
    tile12.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    tile12.healthEffect = -20;
    tile12.actionButtonName = @"Bring some rhum and fight"; 
    
    NSMutableArray *fouthColumn = [[NSMutableArray alloc] init];
    [fouthColumn addObject:tile10];
    [fouthColumn addObject:tile11];
    [fouthColumn addObject:tile12];
    
    NSArray *tiles = [[NSArray alloc] initWithObjects:firstColumn, secondColumn, thirdColumn, fouthColumn, nil];
    
    return tiles;
}

-(PGCharacter *) charater
{
    PGCharacter *character = [[PGCharacter alloc] init];
    PGArmor *armor = [[PGArmor alloc] init];
    PGWeapon *weapon = [[PGWeapon alloc] init];
    armor.name = @"Cloak";
    armor.health = 5;
    character.armor = armor;
    weapon.name = @"Fists";
    weapon.damage = 10;
    character.weapon = weapon;
    character.health = 100;
    character.damage = 0;
    
    return character;
}

-(PGBoss *) boss
{
    PGBoss *boss = [[PGBoss alloc] init];
    boss.health = 100;
    boss.damage = 30;
    
    return boss;
}

@end
