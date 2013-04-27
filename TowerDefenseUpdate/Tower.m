#import "Tower.h"

@implementation Tower

@synthesize mySprite,theGame;

+(id) nodeWithTheGame:(HelloWorldLayer*)_game location:(CGPoint)location
{
    return [[self alloc] initWithTheGame:_game location:location];
}

-(id) initWithTheGame:(HelloWorldLayer *)_game location:(CGPoint)location
{
	if( (self=[super init])) {
		
		theGame = _game;
        attackRange = 70;
        damage = 10;
        fireRate = 1;
        
        mySprite = [CCSprite spriteWithFile:@"tower.png"];
		[self addChild:mySprite];
        
        [mySprite setPosition:location];
        
        [theGame addChild:self];
        
        [self scheduleUpdate];
        
	}
	
	return self;
}

-(void)update:(ccTime)dt
{
    
}

-(void)draw
{
    ccDrawColor4B(255, 255, 255, 255);
    ccDrawCircle(mySprite.position, attackRange, 360, 30, false);
    [super draw];
}

@end