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
    if (square==nil)
    {
        square = [[JSTokenField alloc] init];
        square.label.text=@"To:";
        
        [square setDelegate:self];
        [self addSubview:square];
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

-(void)setBackgroundColor_:(id)color {
  UIColor *c = [[TiUtils colorValue:color] _color];
  JSTokenField *s = [self square];
  s.backgroundColor = c;
}

-(void)setLabel_:(id)label {
	JSTokenField *s= [self square];
	s.label.text=label;
}

-(void)setColor_:(id)color {
    JSTokenField *s = [self square];
    s.textField.textColor = [[TiUtils colorValue:color] _color];
}

-(void)focus:(id)args {
    [square.textField becomeFirstResponder];
}

-(void)blur:(id)args {
    [square.textField resignFirstResponder];
}

-(void)addToken:(id)title {
    ENSURE_SINGLE_ARG(title, NSString);
    
    [square addTokenWithTitle:title representedObject:[NSNull null]];
}

-(void)removeToken:(id)title {
    ENSURE_SINGLE_ARG(title, NSString);
    
    [square removeTokenForString:title];
}

-(void)removeAllTokens:(id)args {
    [square removeAllTokens];
}

#pragma mark -
#pragma mark JSTokenFieldDelegate

- (void)tokenField:(JSTokenField *)tokenField didAddToken:(NSString *)title representedObject:(id)obj
{
	if ([self.proxy _hasListeners:@"add"]){
        
        NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
        
        [data setValue:title forKey:@"token"];
        
        [self.proxy fireEvent:@"add" withObject:data];
        
    }
    
    square.textField.text=@"";
}

- (void)tokenField:(JSTokenField *)tokenField didRemoveToken:(NSString *)title representedObject:(id)obj
{
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
