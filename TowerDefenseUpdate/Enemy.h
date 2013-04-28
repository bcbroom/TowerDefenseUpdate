#import "cocos2d.h"
#import "HelloWorldLayer.h"


@class HelloWorldLayer, Waypoint, Tower;

@interface Enemy: CCNode {
    CGPoint myPosition;
    int maxHp;
    int currentHp;
    float walkingSpeed;
    Waypoint *destinationWaypoint;
    BOOL active;
}

@property (nonatomic,assign) HelloWorldLayer *theGame;
@property (nonatomic,assign) CCSprite *mySprite;

+(id)nodeWithTheGame:(HelloWorldLayer*)_game;
-(id)initWithTheGame:(HelloWorldLayer *)_game;
-(void)doActivate;
-(void)getRemoved;


@end