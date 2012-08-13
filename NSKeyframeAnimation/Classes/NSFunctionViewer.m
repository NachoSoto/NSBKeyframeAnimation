//
//  NSFunctionViewer.m
//  NSKeyframeAnimation
//
//  Created by Nacho Soto on 8/6/12.
//  Copyright (c) 2012 Nacho Soto. All rights reserved.
//

#import "NSFunctionViewer.h"
#import "NSFunctionViewer+Animations.h"

#import "NSKeyframeAnimation.h"
#import "NSFunctionView.h"

#define kMainViewProportion (0.7f)
#define kBackgroundColor [UIColor scrollViewTexturedBackgroundColor]

#define kAppleTopPadding (100.0f)
#define kPadding (40.0f)

#define kAnimationDuration (2)
#define kAnimatedKeyPath @"position.x"
#define kAnimationInterval (1)
#define kAnimationPadding (80.0f)

@interface NSFunctionViewer () <UITableViewDataSource, UITableViewDelegate>
{
    BOOL _showingAllAnimations;
}

@property (nonatomic, retain) UIView *mainView;
@property (nonatomic, retain) UIView *sideView;

@property (nonatomic, retain) UIImageView *apple;
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSFunctionView *functionView;

@property (nonatomic, assign) AnimationType currentAnimationType;

@end

@implementation NSFunctionViewer

- (id)init
{
    if ((self = [super init]))
    {
        self.apple = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"apple"]] autorelease];
        
        self.currentAnimationType = 0;
        
        _showingAllAnimations = NO;
    }
    
    return self;
}

- (void)dealloc
{
    [_mainView release];
    [_sideView release];
    [_tableView release];
    [_apple release];
    [_functionView release];
    
    [super dealloc];
}

- (void)loadView
{
    self.view = [[[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame] autorelease];
    self.view.backgroundColor = kBackgroundColor;
    
    /* -- columns -- */
    self.mainView = [[[UIView alloc] initWithFrame:CGRectMake(0,
                                                              0,
                                                              CGRectGetWidth(self.view.frame) * kMainViewProportion,
                                                              CGRectGetHeight(self.view.frame))] autorelease];
    [self.view addSubview:self.mainView];
    self.mainView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin;
    
    
    self.sideView = [[[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.mainView.frame),
                                                              0,
                                                              CGRectGetWidth(self.view.frame) - CGRectGetWidth(self.mainView.frame),
                                                              CGRectGetHeight(self.view.frame))] autorelease];
    [self.view addSubview:self.sideView];
    self.sideView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin;
    /* -- columns -- */
    
    /* -- actor -- */
    self.apple.center = CGPointMake([self startValue], kAppleTopPadding);
    self.apple.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin;
    [self.mainView addSubview:self.apple];
    /* -- actor -- */
    
    /* -- function view -- */
    const CGFloat functionViewPadding = 20.0f,
                  functionViewSize = CGRectGetWidth(self.mainView.frame) * 0.8f;
    
    const CGRect functionViewFrame = CGRectMake((CGRectGetWidth(self.view.frame) - functionViewSize) / 2,
                                                CGRectGetMaxY(self.apple.frame) + kPadding,
                                                functionViewSize,
                                                functionViewSize);
    
    UIView *functionViewBackground = [[[UIView alloc] initWithFrame:functionViewFrame] autorelease];
    functionViewBackground.backgroundColor = [UIColor colorWithWhite:1 alpha:0.1f];
    functionViewBackground.layer.cornerRadius = 10.0f;
    
    self.functionView = [[[NSFunctionView alloc] initWithFrame:CGRectInset(functionViewBackground.bounds,
                                                                           functionViewPadding,
                                                                           functionViewPadding)] autorelease];
    
    [functionViewBackground addSubview:self.functionView];
    [self.mainView addSubview:functionViewBackground];
    /* -- function view -- */
    
    /* -- function picker -- */
    const CGSize tableSize = CGSizeMake(CGRectGetWidth(self.sideView.frame) * 0.7f,
                                        CGRectGetHeight(self.sideView.frame));
    self.tableView = [[[UITableView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.sideView.frame) - tableSize.width) / 2,
                                                                    (CGRectGetHeight(self.sideView.frame) - tableSize.height) / 2,
                                                                    tableSize.width,
                                                                    tableSize.height)
                                                   style:UITableViewStyleGrouped] autorelease];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundView = [[[UIView alloc] init] autorelease];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
    [self.sideView addSubview:self.tableView];
    /* -- function picker -- */
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    self.mainView = nil;
    self.sideView = nil;
    self.apple = nil;
    self.tableView = nil;
    self.functionView = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:self.currentAnimationType inSection:0]
                                animated:NO
                          scrollPosition:UITableViewRowAnimationTop];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self prepareAnimation];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

#pragma mark - table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return AnimationTypeCount;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{   
    cell.textLabel.text = [[self class] animatonNameForType:indexPath.row];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = NSStringFromClass([self class]);
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
    }
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnimationType newAnimationType = (AnimationType)indexPath.row;
    
    if (newAnimationType == AnimationTypeAll)
    {
        _showingAllAnimations = YES;
        newAnimationType = 0; // start from the beginning
    }
    else
    {
        _showingAllAnimations = NO;
    }

    self.currentAnimationType = newAnimationType;
}

#pragma mark -

- (float)startValue
{
    return CGRectGetWidth(self.apple.frame) / 2 + kAnimationPadding;
}

- (float)endValue
{
    return CGRectGetWidth(self.mainView.frame) - (CGRectGetWidth(self.apple.frame) / 2) - kAnimationPadding;
}

- (void)prepareAnimation
{
    NSKeyframeAnimationFunction c = [[self class] animationFunctionForType:self.currentAnimationType];
    
    float startValue = self.startValue,
          endValue   = self.endValue;
    
    NSKeyframeAnimation *animation = [NSKeyframeAnimation animationWithKeyPath:kAnimatedKeyPath
                                                                      duration:kAnimationDuration
                                                                    startValue:startValue
                                                                      endValue:endValue
                                                                      function:c];
    
    animation.completionBlock = ^(BOOL finished) {
        if (finished)
        {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, kAnimationInterval * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
                
                [self prepareAnimation];
            });
        }
    };
    
    if (_showingAllAnimations)
    {
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:self.currentAnimationType inSection:0]
                                    animated:YES
                              scrollPosition:UITableViewScrollPositionMiddle];
     
        // next run will show the next animation
        self.currentAnimationType = (self.currentAnimationType + 1) % (AnimationTypeCount - 1);
    }
    
    [self.apple.layer setValue:@(endValue) forKeyPath:kAnimatedKeyPath];
    [self.apple.layer addAnimation:animation forKey:kAnimatedKeyPath];
    
    self.functionView.animation = animation;
}

@end
