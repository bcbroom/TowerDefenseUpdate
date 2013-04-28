#import "cocos2d.h"
#import "HelloWorldLayer.h"

#define kTOWER_COST 300

@class HelloWorldLayer, Enemy;

@interface Tower: CCNode {
    int attackRange;
    int damage;
    float fireRate;
    BOOL attacking;
    Enemy *chosenEnemy;
}

@property (nonatomic,assign) HelloWorldLayer *theGame;
@property (nonatomic,assign) CCSprite *mySprite;

+(id)nodeWithTheGame:(HelloWorldLayer*)_game location:(CGPoint)location;
-(id)initWithTheGame:(HelloWorldLayer *)_game location:(CGPoint)location;
-(void)targetKilled;

@end