//
//  PGTile.h
//  PirateGame
//
//  Created by Leonel Garza on 9/8/14.
//  Copyright (c) 2014 Leonel Garza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PGWeapon.h"
#import "PGArmor.h"

@interface PGTile : NSObject

@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong, nonatomic) NSString *actionButtonName;
@property (strong, nonatomic) PGArmor *armor;
@property (strong, nonatomic) PGWeapon *weapon;
@property (nonatomic) int healthEffect; 

@end
