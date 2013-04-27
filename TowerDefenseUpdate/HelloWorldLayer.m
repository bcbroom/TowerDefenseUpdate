//
//  HelloWorldLayer.m
//  TowerDefenseUpdate
//
//  Created by Brian Broom on 4/7/13.
//  Copyright Brian Broom 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "Tower.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

@synthesize towers;

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        
		// 1 - initialize
        
        self.touchEnabled = YES;
        CGSize winSize = [CCDirector sharedDirector].winSize;
        
        // 2 - set background
        
        CCSprite * background = [CCSprite spriteWithFile:@"bg.png"];
        [self addChild:background];
        [background setPosition:ccp(winSize.width/2,winSize.height/2)];
        
        // 3 - load tower positions        
        [self loadTowerPositions];
        
        // 4 - add waypoints
        
        // 5 - add enemies
        
        // 6 - create wave label
        
        // 7 - player lives
        
        // 8 - gold
        
        // 9 - sound
	}
	return self;
}

-(void)loadTowerPositions
{
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"TowersPosition" ofType:@"plist"];
    NSArray * towerPositions = [NSArray arrayWithContentsOfFile:plistPath];
    towerBases = [[NSMutableArray alloc] initWithCapacity:10];
    
    for(NSDictionary * towerPos in towerPositions)
    {
        CCSprite * towerBase = [CCSprite spriteWithFile:@"open_spot.png"];
        [self addChild:towerBase];
        [towerBase setPosition:ccp([[towerPos objectForKey:@"x"] intValue],[[towerPos objectForKey:@"y"] intValue])];
        [towerBases addObject:towerBase];
    }    
}

-(BOOL)canBuyTower
{
    return YES;
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
	for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		
		location = [[CCDirector sharedDirector] convertToGL: location];
        
        for(CCSprite * tb in towerBases)
        {
            if([self canBuyTower] && CGRectContainsPoint([tb boundingBox],location) && !tb.userData)
			{
                //We will spend our gold later.
                
                Tower *tower = [Tower nodeWithTheGame:self location:tb.position];
                [towers addObject:tower];
                tb.userData = (__bridge void *)(tower);
			}
		}
	}
}

@end
