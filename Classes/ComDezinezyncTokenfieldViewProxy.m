/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2013 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "ComDezinezyncTokenfieldViewProxy.h"
#import "TiUtils.h"

@implementation ComDezinezyncTokenfieldViewProxy

-(void)blur:(id)args
{
	[self makeViewPerformSelector:@selector(blur:) withObject:args createIfNeeded:YES waitUntilDone:NO];
}

-(void)focus:(id)args
{
	[self makeViewPerformSelector:@selector(focus:) withObject:args createIfNeeded:YES waitUntilDone:NO];
}

-(TiDimension)defaultAutoHeightBehavior:(id)unused
{
    return TiDimensionAutoSize;
}

@end
