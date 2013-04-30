//
//  HelloWorldLayer.h
//  TowerDefenseUpdate
//
//  Created by Brian Broom on 4/7/13.
//  Copyright Brian Broom 2013. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer 
{
    NSMutableArray *towerBases;
    int wave;
    CCLabelBMFont *ui_wave_lbl;
    int playerHp;
    CCLabelBMFont *ui_hp_lbl;
    BOOL gameEnded;
    int playerGold;
    CCLabelBMFont *ui_gold_lbl;
}

@property (nonatomic,strong) NSMutableArray *towers;
@property (nonatomic,strong) NSMutableArray *waypoints;
@property (nonatomic,strong) NSMutableArray *enemies;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

-(BOOL)circle:(CGPoint)circlePoint withRadius:(float)radius collisionWithCircle:(CGPoint)circlePointTwo collisionCircleRadius:(float)radiusTwo;
-(void) enemyGotKilled;
-(void) getHpDamage;
-(void)doGameOver;
-(void)awardGold:(int)gold;

@end
