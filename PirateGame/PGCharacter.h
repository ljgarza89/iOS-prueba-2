//
//  PGCharacter.h
//  PirateGame
//
//  Created by Leonel Garza on 9/9/14.
//  Copyright (c) 2014 Leonel Garza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PGWeapon.h"
#import "PGArmor.h"

@interface PGCharacter : NSObject

@property (strong, nonatomic) PGArmor *armor;
@property (strong, nonatomic) PGWeapon *weapon;
@property (nonatomic) int health;
@property (nonatomic) int damage; 

@end
