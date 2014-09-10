//
//  PGFactory.h
//  PirateGame
//
//  Created by Leonel Garza on 9/8/14.
//  Copyright (c) 2014 Leonel Garza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PGCharacter.h"
#import "PGBoss.h"

@interface PGFactory : NSObject

-(NSArray *)tiles;
-(PGCharacter *) charater;
-(PGBoss *) boss; 

@end
