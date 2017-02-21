//
//  MyScrollView.m
//  MyScrollView
//
//  Created by Callum Davies on 2017-02-20.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

#import "MyScrollView.h"

@implementation MyScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(timeToPan:)];
        [self addGestureRecognizer:panGesture];
        self.contentSize = CGSizeMake(350, 800);
    }
    return self;
}

-(void)timeToPan:(UIPanGestureRecognizer *)sender
{
    
    CGPoint translation = [sender translationInView:self];
    CGRect bounds = self.bounds;
    
    // Translate the view's bounds, but do not permit values that would violate contentSize
    CGFloat newBoundsOriginX = bounds.origin.x - translation.x;
    CGFloat minBoundsOriginX = 0.0;
    CGFloat maxBoundsOriginX = self.contentSize.width - bounds.size.width;
    bounds.origin.x = fmax(minBoundsOriginX, fmin(newBoundsOriginX, maxBoundsOriginX));
    
    CGFloat newBoundsOriginY = bounds.origin.y - translation.y;
    CGFloat minBoundsOriginY = 0.0;
    CGFloat maxBoundsOriginY = self.contentSize.height - bounds.size.height;
    bounds.origin.y = fmax(minBoundsOriginY, fmin(newBoundsOriginY, maxBoundsOriginY));
    
    self.bounds = bounds;
    [sender setTranslation:CGPointZero inView:self];
        
    }
    
    
    
//    CGPoint translationInView = [sender translationInView:self];
//    
//    CGRect myBounds = self.bounds;
//    myBounds.origin.x += translationInView.x;
//    myBounds.origin.y += translationInView.y;
//    
//    CGRect limit = CGRectMake(0, 0, self.contentSize.width, self.contentSize.height);
    
//    if(CGRectContainsRect(limit, myBounds)) {
//        
//        self.bounds = myBounds;
//    }
    


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
