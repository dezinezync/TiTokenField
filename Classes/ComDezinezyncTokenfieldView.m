/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2013 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "ComDezinezyncTokenfieldView.h"
#import "TiUtils.h"

@implementation ComDezinezyncTokenfieldView

-(void)dealloc
{
    RELEASE_TO_NIL(square);
    [super dealloc];
}

-(void)initializeState
{
    UIView *s = [self square];
    [super initializeState];
}

-(UIView*)square
{
    /*[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(handleTokenFieldFrameDidChange:)
												 name:JSTokenFieldFrameDidChangeNotification
											   object:nil];
    */
    if (square==nil)
    {
        //tokens= [[NSMutableArray alloc] init];
        
        square = [[JSTokenField alloc] init];
        square.label.text=@"To:";
        
        [square setDelegate:self];
        [self addSubview:square];
        
        UIView *separator1 = [[[UIView alloc] initWithFrame:CGRectMake(0, square.bounds.size.height-1, square.bounds.size.width, 1)] autorelease];
        [separator1 setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin];
        [square addSubview:separator1];
        [separator1 setBackgroundColor:[UIColor lightGrayColor]];
    }
    return square;
}

-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
    if (square!=nil)
    {
        [TiUtils setView:square positionRect:bounds];
    }
}

#pragma mark -
#pragma mark JSTokenFieldDelegate

- (void)tokenField:(JSTokenField *)tokenField didAddToken:(NSString *)title representedObject:(id)obj
{
	//NSDictionary *recipient = [NSDictionary dictionaryWithObject:obj forKey:title];
	//[tokens addObject:recipient];
	//NSLog(@"Added token for < %@ : %@ >\n%@", title, obj, tokens);
    
    //Clear the textField
    
    
    if ([self.proxy _hasListeners:@"add"]){
        
        NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
        
        [data setValue:title forKey:@"token"];
        
        [self.proxy fireEvent:@"add" withObject:data];
        
    }
    
    square.textField.text=@"";
}

- (void)tokenField:(JSTokenField *)tokenField didRemoveToken:(NSString *)title representedObject:(id)obj
{
	//[tokens removeObjectAtIndex:index];
    /*NSMutableArray *discardedToken = [NSMutableArray array];
    JSTokenButton *item;
    
    for (item in tokens) {
        if (item == obj)
            [discardedToken addObject:item];
    }

    [tokens removeObjectsInArray:discardedToken];
    
//    [tokens removeObject (id *)obj];
	NSLog(@"Deleted token %@\n%@",tokenName,tokens);*/
    
    if ([self.proxy _hasListeners:@"delete"]){
        
        NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
        
        [data setValue:title forKey:@"token"];
        
        [self.proxy fireEvent:@"delete" withObject:data];
        
    }
}

- (BOOL)tokenFieldShouldReturn:(JSTokenField *)tokenField {
    NSMutableString *recipient = [NSMutableString string];
	
	NSMutableCharacterSet *charSet = [[[NSCharacterSet whitespaceCharacterSet] mutableCopy] autorelease];
	[charSet formUnionWithCharacterSet:[NSCharacterSet punctuationCharacterSet]];
	
    NSString *rawStr = [[tokenField textField] text];
	for (int i = 0; i < [rawStr length]; i++)
	{
		if (![charSet characterIsMember:[rawStr characterAtIndex:i]])
		{
			[recipient appendFormat:@"%@",[NSString stringWithFormat:@"%c", [rawStr characterAtIndex:i]]];
		}
	}
    
    if ([rawStr length])
	{
		[tokenField addTokenWithTitle:rawStr representedObject:recipient];
	}
    
    return NO;
}

#pragma mark -
#pragma mark View

- (void)viewWillAppear:(BOOL)animated
{
	[self viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
	[self viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[self viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[self viewDidDisappear:animated];
}

@end
