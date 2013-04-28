#import "cocos2d.h"
#import "HelloWorldLayer.h"

@interface Waypoint: CCNode {
    HelloWorldLayer *theGame;
}

@property (nonatomic,assign) CGPoint myPosition;
@property (nonatomic,weak) Waypoint *nextWaypoint;

+(id)nodeWithTheGame:(HelloWorldLayer*)_game location:(CGPoint)location;
-(id)initWithTheGame:(HelloWorldLayer *)_game location:(CGPoint)location;

@end
